function AlertTimeout() {
	$(".alert-timeout").show();
	setTimeout(function () {
		$(".alert-timeout").hide();
	}, 5000);
}
// Show alerts with .alert-timeout class and hide after 5 seconds
