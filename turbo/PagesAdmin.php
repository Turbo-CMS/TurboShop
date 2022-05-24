<?php 

require_once('api/Turbo.php');

########################################
class PagesAdmin extends Turbo
{

  public function fetch()
  {
  
    // Menu
    $menus = $this->pages->get_menus();
 	$this->design->assign('menus', $menus);
 	
    // Current menu
  	$menu_id = $this->request->get('menu_id', 'integer'); 
  	if(!$menu_id || !$menu = $this->pages->get_menu($menu_id))
  	{
  		$menu = reset($menus);
  	}
 	$this->design->assign('menu', $menu);


   	// Action processing
  	if($this->request->method('post'))
  	{
		// Sorting
		$positions = $this->request->post('positions'); 		
 		$ids = array_keys($positions);
		sort($positions);
		foreach($positions as $i=>$position)
			$this->pages->update_page($ids[$i], array('position'=>$position)); 

		
		// Actions with selected
		$ids = $this->request->post('check');
		if(is_array($ids))
		switch($this->request->post('action'))
		{
		    case 'disable':
		    {
				$this->pages->update_page($ids, array('visible'=>0));	      
				break;
		    }
		    case 'enable':
		    {
				$this->pages->update_page($ids, array('visible'=>1));	      
		        break;
		    }
		    case 'delete':
		    {
			    foreach($ids as $id)
					$this->pages->delete_page($id);    
		        break;
		    }
		}		
		
 	}

	// Display
    $pages = $this->pages->get_pages_tree(array('menu_id'=>$menu->id));
	
 	$this->design->assign('pages', $pages);
	return $this->design->fetch('pages.tpl');
  }
}
