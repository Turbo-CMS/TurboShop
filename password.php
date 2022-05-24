<?php
session_start();
require_once('api/Turbo.php');
$turbo = new Turbo();
$backend_translations = $turbo->backend_translations;
$file = "turbo/lang/" . $turbo->settings->lang . ".php";
if (!file_exists($file)) {
	foreach (glob("turbo/lang/??.php") as $f) {
		$file = "turbo/lang/" . pathinfo($f, PATHINFO_FILENAME) . ".php";
		break;
	}
}
require_once($file);
?>

<html>

<head>

	<?php
	print "<title>" . $turbo->backend_translations->administrator_password_recovery . "</title>";
	?>

	<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
	<meta http-equiv="Content-Language" content="en" />
</head>
<style>
	html,
	body {
		margin: 0;
		padding: 0;
		background-color: #f7f9fc;
		font-family: 'Open Sans', sans-serif;
		color: #495057;
	}

	h1 {
		font-size: 26px;
		font-weight: normal
	}

	p {
		font-size: 19px;
	}

	input {
		font-size: 18px;
	}

	p.error {
		color: red;
	}

	div.maindiv {
		width: 600px;
		height: 300px;
		position: relative;
		left: 50%;
		top: 100px;
		margin-left: -250px;
	}

	p.success {
		color: green;
	}

	a {
		color: #3f80ea;
		text-decoration: none;
	}

	.body {
		max-width: 600px;
		margin: 5% auto;
		padding: 40px;
		background: #fff;
	}

	input,
	textarea {
		display: block;
		box-sizing: border-box;
		-moz-box-sizing: border-box;
		height: 40px;
		padding: 8px 10px;
		outline: none;
		border: 1px solid #dfe2e5;
		border-radius: 2px;
		background: #fff;
		appearance: normal;
		-moz-appearance: none;
		-webkit-appearance: none;
		-webkit-transition: all 0.12s ease;
		transition: all 0.12s ease;
		-webkit-box-shadow: none;
		box-shadow: none;
		border-radius: 0.2rem;
		-webkit-border-radius: 0.2rem;
		-moz-border-radius: 0.2rem;
		-webkit-transition: background 0.2s linear 0s;
		transition: background 0.2s linear 0s;
	}

	input {
		display: inline-block;
		line-height: 1;
	}

	input:focus {
		color: #495057;
		background-color: #fff;
		border-color: #9fc0f5;
		outline: 0 !important;
		-webkit-box-shadow: none;
		box-shadow: 0 0 0 0.2rem rgba(63, 128, 234, 0.25);
		-webkit-transition: none !important;
	}

	input[type="submit"] {
		background-color: #3f80ea;
		border-color: #3f80ea;
		color: #fff;
		display: inline-block;
		font-weight: normal;
		line-height: 1;
		text-align: center;
		white-space: nowrap;
		border-radius: 3px;
		font-weight: 600;
		cursor: pointer;
		user-select: none;
		border: 1px solid transparent;
		padding: 0.3rem 1rem;
		font-size: 1rem;
		transition: all 0.2s ease-in-out;
		margin-top: 3px;
	}

	input[type="submit"]:hover {
		background-color: #366dc7;
		border-color: #3266bb;
		color: #fff;
	}

	input[type="submit"]:focus {
		box-shadow: 0 0 0 0.2rem rgba(92, 147, 237, 0.5);
	}

	input[type="submit"]:active {
		background-color: #366dc7;
		border-color: #3266bb;
		color: #fff;
	}

	input[type="submit"]:active:focus {
		box-shadow: 0 0 0 0.2rem rgba(92, 147, 237, 0.5);
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

		// If you came from the link from the letter
		if ($c = $turbo->request->get('code')) {
			// Code does not match - stop working
			if (empty($_SESSION['admin_password_recovery_code']) || empty($c) || $_SESSION['admin_password_recovery_code'] !== $c) {
				header('Location:password.php');
				exit();
			}

			// IP does not match - stop working
			if (empty($_SESSION['admin_password_recovery_ip']) || empty($_SERVER['REMOTE_ADDR']) || $_SESSION['admin_password_recovery_ip'] !== $_SERVER['REMOTE_ADDR']) {
				header('Location:password.php');
				exit();
			}

			// If you posted a password
			if ($new_password = $turbo->request->post('new_password')) {
				// Password file
				$passwd_file = $turbo->config->root_dir . 'turbo/.passwd';

				// We remove the code from the session so that no one else uses the link
				unset($_SESSION['admin_password_recovery_code']);
				unset($_SESSION['admin_password_recovery_ip']);

				// If writing to files is prohibited, we warn about it
				if (!is_writable($passwd_file)) {
					print "
				<h1>" . $turbo->backend_translations->administrator_password_recovery . "</h1>
				<p class='error'>" . $turbo->backend_translations->file_is_not_writable . "</p>
				<p>" . $turbo->backend_translations->file_is_not_writable_message . "</p>
			";
				} else {
					// New login and password
					$new_login = $turbo->request->post('new_login');
					$new_password = $turbo->request->post('new_password');
					if (!$turbo->managers->update_manager($new_login, array('password' => $new_password)))
						$turbo->managers->add_manager(array('login' => $new_login, 'password' => $new_password));

					print "
				<h1>" . $turbo->backend_translations->administrator_password_recovery . "</h1>
				<p class='success'>" . $turbo->backend_translations->new_password_set . "</p>
				<p>
				<a href='" . $turbo->root_url . "/turbo/index.php?module=ManagersAdmin'>" . $turbo->backend_translations->go_to_control_panel . "</a>
				</p>
			";
				}
			} else {
				// Form for specifying a new login and password
				print "
		<h1>" . $turbo->backend_translations->administrator_password_recovery . "</h1>
		<p>
		<form method=post>
			" . $turbo->backend_translations->new_login . "<br><input type='text' name='new_login'><br><br>
			" . $turbo->backend_translations->new_password . "<br><input type='password' name='new_password'><br><br>
			<input type='submit' value='" . $turbo->backend_translations->save_login_and_password . "'>
		</form>
		</p>
		";
			}
		} else {
			print "
		<h1>" . $turbo->backend_translations->administrator_password_recovery . "</h1>
		<p>
		" . $turbo->backend_translations->enter_admin_email . "
		<form method='post' action='" . $turbo->root_url . "/password.php'>
			<input type='text' name='email'>
			<input type='submit' value='" . $turbo->backend_translations->restore_password . "'>
		</form>
		</p>
	";

			$admin_email = $turbo->settings->admin_email;

			if (isset($_POST['email'])) {
				if ($_POST['email'] === $admin_email) {
					$code = $turbo->config->token(mt_rand(1, mt_getrandmax()) . mt_rand(1, mt_getrandmax()) . mt_rand(1, mt_getrandmax()));
					$_SESSION['admin_password_recovery_code'] = $code;
					$_SESSION['admin_password_recovery_ip'] = $_SERVER['REMOTE_ADDR'];

					$message = $turbo->backend_translations->message_password_recovery_1;
					$message .= '<br>' . $turbo->backend_translations->message_password_recovery_2 . ' ' . $turbo->config->root_url . '/password.php?code=' . $code . '<br>';
					$message .= $turbo->backend_translations->message_password_recovery_3;

					$turbo->notify->email($admin_email, '' . $turbo->backend_translations->administrator_password_recovery . ' ' . $turbo->settings->site_name, $message, $turbo->settings->notify_from_email);
				}
				print "" . $turbo->backend_translations->message_password_recovery_4 . "";
			}
		}
		?>

	</div>
	</div>
</body>

</html>