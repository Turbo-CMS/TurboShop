$(document).ready(function () {
	$("form.subscribe-form").validate({
		rules: { EMAIL: { email: true } },
	});
});
