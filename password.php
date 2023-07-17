<?php

session_start();

require_once 'api/Turbo.php';

$turbo = new Turbo();

$backendTranslations = $turbo->backendTranslations;
$file = "turbo/lang/" . $turbo->settings->lang . ".php";

if (!file_exists($file)) {
	foreach (glob("turbo/lang/??.php") as $f) {
		$file = "turbo/lang/" . pathinfo($f, PATHINFO_FILENAME) . ".php";
		break;
	}
}

require_once $file;

?>

<!DOCTYPE html>
<html lang="<?php echo $turbo->settings->lang; ?>">

<head>
	<meta charset="UTF-8">
	<title><?php echo $turbo->backendTranslations->administrator_password_recovery; ?></title>
	<meta http-equiv="Content-Language" content="<?php echo $turbo->settings->lang; ?>">
	<link rel="icon" type="image/svg+xml" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%233b7ddd' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-settings'%3E%3Ccircle cx='12' cy='12' r='3'%3E%3C/circle%3E%3Cpath d='M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z'%3E%3C/path%3E%3C/svg%3E">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<style>
	html,
	body {
		-webkit-text-size-adjust: 100%;
		-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
		color: #495057;
		font-family: "Inter", "Arial", sans-serif;
		font-size: 0.95rem;
		font-weight: 400;
		line-height: 1.5;
		margin: 0;
		padding: 0;
		background-color: #f5f7fb;
	}

	h1 {
		color: #000;
		font-size: 1.75rem;
		font-weight: 400;
		line-height: 1.2;
	}

	p {
		margin-top: 0;
		margin-bottom: 1rem;
	}

	p.error {
		color: #dc3545;
	}

	p.success {
		color: #1cbb8c;
	}

	div.maindiv {
		position: relative;
		top: 100px;
		left: 50%;
		width: 600px;
		height: 300px;
		margin-left: -250px;
	}

	a {
		color: #3b7ddd;
		text-decoration: none;
	}

	.body {
		max-width: 600px;
		margin: 5% auto;
		padding: 40px;
		background-color: #fff;
		background-clip: border-box;
		box-shadow: 0 0 0.875rem 0 rgba(33, 37, 41, 0.05);
		border-radius: 0.25rem;
		border: 0 solid transparent;
	}

	.form-label {
		margin-bottom: 0.25rem;
	}

	label {
		display: inline-block;
	}

	input[type="text"],
	input[type="password"] {
		display: inline-block;
		width: 50%;
		padding: 0.35rem 0.85rem;
		margin-bottom: 0.50rem !important;
		margin-right: 0.50rem !important;
		font-size: 0.95rem;
		font-weight: 400;
		line-height: 1.5;
		color: #495057;
		background-color: #fff;
		background-clip: padding-box;
		border-radius: 0.2rem;
		border: 1px solid #ced4da;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
	}

	input[type="text"]:focus,
	input[type="password"]:focus {
		outline: 0;
		color: #495057;
		background-color: #fff;
		border-color: #9dbeee;
		box-shadow: 0 0 0 0.2rem rgba(59, 125, 221, 0.25);
	}

	input[type="submit"] {
		display: inline-block;
		padding: 0.35rem 0.85rem;
		font-size: 0.95rem;
		font-weight: 400;
		line-height: 1.5;
		color: #fff;
		background-color: #3b7ddd;
		border-color: #3b7ddd;
		border-radius: 0.2rem;
		border: 1px solid transparent;
		text-align: center;
		white-space: nowrap;
		vertical-align: middle;
		cursor: pointer;
		transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
		user-select: none;
		-webkit-user-select: none;
		-moz-user-select: none;
	}

	input[type="submit"]:hover {
		background-color: #326abc;
		border-color: #2f64b1;
		color: #fff;
	}

	input[type="submit"]:focus {
		background-color: #326abc;
		border-color: #2f64b1;
		box-shadow: 0 0 0 0.2rem rgba(88, 145, 226, 0.5);
	}

	input[type="submit"]:active {
		background-color: #2f64b1;
		border-color: #2c5ea6;
		color: #fff;
	}

	input[type="submit"]:active:focus {
		background-color: #2f64b1;
		border-color: #2c5ea6;
		box-shadow: 0 0 0 0.2rem rgba(88, 145, 226, 0.5);
	}

	.mt-1 {
		margin-top: 0.5rem;
	}

	.mt-n {
		margin-top: -2px;
	}

	@media screen and (max-width: 600px) {
		.body {
			padding: 20px;
		}
	}
</style>

<body>
	<div class="body">
		<?php
		if ($c = $turbo->request->get('code')) {
			if (empty($_SESSION['admin_password_recovery_code']) || empty($c) || $_SESSION['admin_password_recovery_code'] !== $c) {
				header('Location:password.php');
				exit();
			}

			if (empty($_SESSION['admin_password_recovery_ip']) || empty($_SERVER['REMOTE_ADDR']) || $_SESSION['admin_password_recovery_ip'] !== $_SERVER['REMOTE_ADDR']) {
				header('Location:password.php');
				exit();
			}

			if ($newPassword = $turbo->request->post('new_password')) {
				$passwdFile = $turbo->config->root_dir . 'turbo/.passwd';

				unset($_SESSION['admin_password_recovery_code']);
				unset($_SESSION['admin_password_recovery_ip']);

				if (!is_writable($passwdFile)) {
		?>
					<h1><?= $turbo->backendTranslations->administrator_password_recovery ?></h1>
					<p class='error'><?= $turbo->backendTranslations->file_is_not_writable ?></p>
					<p><?= $turbo->backendTranslations->file_is_not_writable_message ?></p>
				<?php
				} else {
					$newLogin = $turbo->request->post('new_login');
					$newPassword = $turbo->request->post('new_password');
					if (!$turbo->managers->update_manager($newLogin, array('password' => $newPassword))) {
						$turbo->managers->add_manager(array('login' => $newLogin, 'password' => $newPassword));
					}
				?>
					<h1><?= $turbo->backendTranslations->administrator_password_recovery ?></h1>
					<p class='success'><?= $turbo->backendTranslations->new_password_set ?></p>
					<p><a href='<?= $turbo->root_url ?>/turbo/index.php?module=ManagersAdmin'><?= $turbo->backendTranslations->go_to_control_panel ?> &#129122;</a></p>
				<?php
				}
			} else {
				?>
				<h1><?= $turbo->backendTranslations->administrator_password_recovery ?></h1>
				<form method="post">
					<label class='form-label'><?= $turbo->backendTranslations->new_login ?></label><br>
					<input type='text' name='new_login'><br>
					<label class='form-label'><?= $turbo->backendTranslations->new_password ?></label><br>
					<input type='password' name='new_password'></label><br>
					<input class='mt-1' type='submit' value='<?= $turbo->backendTranslations->save_login_and_password ?>'>
				</form>
			<?php
			}
		} else {
			?>
			<h1><?= $turbo->backendTranslations->administrator_password_recovery ?></h1>
			<form method='post' action='<?= $turbo->root_url ?>/password.php'>
				<label class='form-label'><?= $turbo->backendTranslations->enter_admin_email ?></label><br>
				<input type='text' name='email'>
				<input class='mt-h' type='submit' value='<?= $turbo->backendTranslations->restore_password ?>'>
			</form>
			<?php

			$adminEmail = $turbo->settings->admin_email;
			if (isset($_POST['email'])) {
				if ($_POST['email'] === $adminEmail) {
					$code = $turbo->config->token(mt_rand(1, mt_getrandmax()) . mt_rand(1, mt_getrandmax()) . mt_rand(1, mt_getrandmax()));
					$_SESSION['admin_password_recovery_code'] = $code;
					$_SESSION['admin_password_recovery_ip'] = $_SERVER['REMOTE_ADDR'];

					$message = $turbo->backendTranslations->message_password_recovery_1;
					$message .= '<br>' . $turbo->backendTranslations->message_password_recovery_2 . ' ' . $turbo->config->root_url . '/password.php?code=' . $code . '<br>';
					$message .= $turbo->backendTranslations->message_password_recovery_3;

					$turbo->notify->email($adminEmail, '' . $turbo->backendTranslations->administrator_password_recovery . ' ' . $turbo->settings->site_name, $message, $turbo->settings->notify_from_email);
				}
			?>
				<?= $turbo->backendTranslations->message_password_recovery_4 ?>
		<?php
			}
		}
		?>
	</div>
</body>

</html>