{* Login Modal *}
<div class="modal fade" id="userModal" tabindex="-1" aria-labelledby="userModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content p-4">
			<div class="modal-header border-0">
				<h5 class="modal-title fs-3 fw-bold" id="userModalLabel">{$lang->login}</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form class="needs-validation" role="form" action="{$lang_link}user/login" autocomplete="off" method="post" novalidate>
					<div class="mb-3">
						<label for="login-email" class="form-label">Email<span class="text-danger">*</span></label>
						<input type="text" class="form-control" name="email" id="login-email" value="{if isset($email)}{$email|escape}{/if}" placeholder="{$lang->enter_your_email}" maxlength="255" required>
						<div class="invalid-feedback">{$lang->enter_your_email}</div>
					</div>
					<div class="mb-3">
						<label for="login-password" class="form-label">{$lang->password}<span class="text-danger">*</span></label>
						<input type="password" class="form-control" name="password" id="login-password" value="" placeholder="{$lang->enter_password}" autocomplete="off" required>
						<div class="invalid-feedback">{$lang->enter_password}</div>
					</div>
					<div class="mb-3">
						<a class="text-decoration-none" href="{$lang_link}user/password_remind">{$lang->forgot_password}</a>
					</div>
					<button type="submit" class="btn btn-success" name="login" value="{$lang->login}"><i class="fa-light fa-arrow-right-to-bracket me-2"></i>{$lang->login}</button>
				</form>
			</div>
			<div class="modal-footer border-0 justify-content-center">
				<a class="text-decoration-none" href="{$lang_link}user/register"><i class="fal fa-user-plus me-2"></i>{$lang->registration}</a>
			</div>
		</div>
	</div>
</div>