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
		<input class="button" name="action" type="submit" value="remove" />
		<input class="button" name="action" type="submit" value="add" />
		<input id="forceSubmit" class="button" name="action" type="submit" value="force" />
	</form>

	<script type="text/javascript">
		(function () {
			var form = document.getElementById ("test");
			var button = form.querySelector ("input[type=submit]");

			console.log (form, button);

			// uncomment one line for examples of alternatives and the code used in the
			// pdf. (Don't forget to disable the function below, just remove the "()" at
			// the end)
			// When all buttons should be disabled, we should loop over all "button" and
			// "input[type=submit]" elements. But this is to cumbersome and adds little
			// value to this example. This is also why we (in the function below) choose
			// to disable the form instead of all buttons.
			form.onsubmit = function (evn) {
				// button.disabled = true;
				// form.onsubmit = function (evn) { evn.preventDefault (); }
				// button.onclick = function (evn) { evn.preventDefault (); };	
			}
		});
	</script>

	<script>
		// Put focus on the first input for convenience.
		(function () { document.querySelector ("input").focus (); }) ();

		// All forms on the page are prevented from being submitted twice. No need to give
		// extra id's to every form and every button you want to disable. Instead of
		// disabling all forms, you can change the forms variable in
		//
		//     > var forms = documents.forms;
		//
		// to a list of all forms for which you want to prevent double submitting, or
		// exclude some forms where you don't care if double submitting happens.
		//
		//     > var forms = document.querySelectorAll ("forms.special");
		//     > var forms = document.querySelectorAll ("forms:not(.special");
		(function () {
			var forms = document.forms;
			function preventDoubles (evn) { evn.target.onsubmit = prevent; }
			function prevent (evn) { evn.preventDefault (); return false; }
			for ( var i = 0; i < forms.length; i++ ) {
				forms[i].onsubmit = preventDoubles;
			}
		}) ();

		// The double submit can be forced if desired. For instance when "force"
		// submitting with certain buttons of the form. The button name=value pair will
		// not be send to the server. You could simulate this.
		(function () {
			document.getElementById ("forceSubmit").onclick = function (evn) {
				var input = evn.target.cloneNode ();
				input.setAttribute ("type", "hidden");
				evn.target.form.appendChild (input);
				evn.target.form.submit ();
			}
		}) ();
	</script>
</body>

</html>
