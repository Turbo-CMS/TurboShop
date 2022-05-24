{$subject= $btr->subscribe_mailing_new scope=global}
<h1 style='font-weight:normal;font-family:arial;'>{$btr->subscribe_mailing_new|escape}</h1>
<table cellpadding=6 cellspacing=0 style='border-collapse: collapse;'>
	<tr>
		<td style='padding:6px; width:170; background-color:#f0f0f0; border:1px solid #e0e0e0;font-family:arial;'>
			{$btr->subscribe_mailing_email|escape}
		</td>
		<td style='padding:6px; width:330; background-color:#ffffff; border:1px solid #e0e0e0;font-family:arial;'>
			{$subscribe->email|escape}
		</td>
	</tr>
</table>
<br><br>
{$btr->email_wish|escape} <a href='https://turbo-cms.com'>Turbo CMS</a>!