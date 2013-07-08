<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="parts" tagdir="/WEB-INF/tags/parts" %>

<!DOCTYPE html>
<html>

<head>
	<parts:meta />
	<title>JSP Page</title>
	<parts:css />
	<style type="text/css">
		form {
			margin: 0 auto;
		}
	</style>
</head>

<body>
	<c:url value="/submit" var="submitUrl" />
	<form id="test" action="${submitUrl}" method="POST">
		<label for="first">first</label>
		<input id="first" name="first" type="text" />
		<input name="commit" type="submit" value="submit" />
		<input name="andereCommit" type="submit" value="bla" />
		<button id="forceSubmit">force</button>
	</form>

	<script type="text/javascript">
		(function () {
			var form = document.getElementById ("test");
			var button = form.querySelector ("input[type=submit]");

			console.log (form, button);

			// uncomment one line for examples of alternatives and the code used in the
			// pdf. (Don't forget to disable the function below, just remove the "()" at
			// the end.
			// When all buttons should be disabled, we should loop over all "button" and
			// "input[type=submit]" elements. But this is to cumbersome and adds little
			// value to this example. This is also why we (in the function below) chose to
			// disable the form instead of the buttons.
			form.onsubmit = function (evn) {
				// button.disabled = true;
				form.onsubmit = function (evn) { evn.preventDefault (); }
				// button.onclick = function (evn) { evn.preventDefault (); };	
			}
		});
	</script>

	<script>
		// Put focus on the first input for convenience.
		(function () { document.querySelector ("input").focus (); }) ();

		// All forms on the page are prevented from being submitted twice. No need to give
		// extra id's to every form and every button you want to disable.
		(function () {
			var forms = document.querySelectorAll ("form");
			function prevent (evn) { evn.preventDefault (); return false; }
			for ( var i = 0; i < forms.length; i++ ) {
				var form = forms[i];
				form.onsubmit = function () { form.onsubmit = prevent; }
			}
		}) ();

		// The double submit can be forced if desired.
		(function () {
			document.getElementById ("forceSubmit").onclick = function () {
				// just do the only form on this page as an example.
				document.querySelector ("form").submit();
			}
		});
	</script>
</body>

</html>