{get_comments var=last_comments}
{if $last_comments}
	<div class="card mb-4">
		<div class="card-header fw-bold">{$lang->global_comments|escape}</div>
		<div class="card-body">
			{get_comments var=last_comments limit=5}
			{if $last_comments}
				{foreach $last_comments as $comment name=com}
					<h5 class="card-title">{$comment->name}</h5>
					<div class="mb-1"><small class="text-muted">{$comment->date|date} {$lang->at|escape} {$comment->date|time}</small></div>
					<div class="mb-1">{$comment->text|strip_tags|truncate:150}</div>
					<div class="mb-1">
						{if $comment->type == product}
							<a href="{$lang_link}products/{$comment->product->url}#comment_{$comment->id}" class="text-decoration-none">
								<small>{$comment->product->name}</small>
							</a>
						{/if}
						{if $comment->type == blog}
							<a href="{$lang_link}blog/{$comment->post->url}#comment_{$comment->id}" class="text-decoration-none">
								<small>{$comment->post->name}</small>
							</a>
						{/if}
						{if $comment->type == article}
							<a href="{$lang_link}article/{$comment->article->url}#comment_{$comment->id}" class="text-decoration-none">
								<small>{$comment->article->name}</small>
							</a>
						{/if}
						{if $comment->type == review}
							<a href="{$lang_link}reviews#comment_{$comment->id}" class="text-decoration-none">
								<small>{$lang->global_reviews|escape}</small>
							</a>
						{/if}
					</div>
					{if !$smarty.foreach.com.last}
						<hr>
					{/if}
				{/foreach}
			{/if}
		</div>
	</div>
{/if}