{* Error *}
{if isset($error)}
	<div class="alert alert-danger" role="alert">
		{if $error == 'empty_name'}
			{$lang->enter_your_name|escape}
		{elseif $error == 'empty_email'}
			{$lang->enter_your_email|escape}
		{elseif $error == 'empty_password'}
			{$lang->enter_password|escape}
		{elseif $error == 'user_exists'}
			{$lang->email_already_registered|escape}
		{else}
			{$error}
		{/if}
	</div>
{/if}

{* Success *}
{if isset($success)}
	<div class="alert alert-success" role="alert">
		{$lang->message_success|escape}
	</div>
{/if}

<div class="personal__block personal__block--private">
	<div class="form">
		<div class="personal__top-form bordered outer-rounded-x">
			<h5>{$lang->contact_details_user|escape}</h5>
			<form id="profile-form" class="validate" method="post">
				<div class="form-body form-body--grid">
					<div class="form-group input-filed">
						<label for="NAME" class="font_14"><span>{$lang->name|escape}&nbsp;<span class="required-star">*</span></span></label>
						<div class="input">
							<input required="" type="text" class="form-control" name="name" id="NAME" maxlength="50" value="{$name|escape}" aria-required="true">
						</div>
					</div>
					<div class="form-group input-filed">
						<label for="EMAIL" class="font_14"><span>E-mail&nbsp;<span class="required-star">*</span></span></label>
						<div class="input">
							<input required="" type="text" name="email" id="EMAIL" maxlength="50" class="form-control" value="{$email|escape}" aria-required="true">
						</div>
						<div class="text_block font_13">{$lang->user_email_text|escape}</div>
					</div>
					<div class="form-group input-filed">
						<label for="PERSONAL_PHONE" class="font_14"><span>{$lang->phone|escape}&nbsp;</span></label>
						<div class="input">
							<input type="text" name="phone" id="PERSONAL_PHONE" class="form-control" maxlength="255" value="{$phone|escape}" aria-required="true">
						</div>
						<div class="text_block font_13">{$lang->user_phone_text|escape}</div>
					</div>
					<div class="form-group input-filed">
						<label for="ADDRESS" class="font_14"><span>{$lang->address|escape}&nbsp;</span></label>
						<div class="input">
							<input type="text" name="address" id="ADDRESS" class="form-control" maxlength="255" value="{$address|escape}" aria-required="true">
						</div>
						<div class="text_block font_13">{$lang->shipping_address|escape}</div>
					</div>
				</div>
				<div class="form-footer form-footer--has-message">
					<button class="btn btn-default btn-lg has-ripple" type="submit" name="save" value="save"><span>{$lang->save_changes|escape}</span></button>
				</div>
			</form>
		</div>
		<div class="personal__top-form bordered outer-rounded-x" id="change-password">
			<h5>{$lang->change_password|escape}</h5>
			<form id="pass-form" method="post" class="pass-form">
				<input type="hidden" name="name" value="{$name|escape}">
				<input type="hidden" name="email" value="{$email|escape}">
				<input type="hidden" name="phone" value="{$phone|escape}">
				<input type="hidden" name="address" value="{$address|escape}">
				<div class="form-body form-body--grid">
					<div class="form-group">
						<label for="NEW_PASSWORD" class="font_14"><span>{$lang->new_password|escape}&nbsp;</span></label>
						<div class="input eye-password">
							<input type="password" name="password" id="NEW_PASSWORD" maxlength="50" class="form-control password" value="">
						</div>
						<div class="text_block font_13">{$lang->registraion_password_text|escape}</div>
					</div>
				</div>
				<div class="form-footer form-footer--has-message">
					<button class="btn btn-default btn-lg" type="submit" name="save" value="{$lang->save_changes|escape}"><span>{$lang->save_changes|escape}</span></button>
				</div>
			</form>
		</div>
	</div>
</div>