<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="parts" tagdir="/WEB-INF/tags/parts" %>

<!DOCTYPE html>
<html>

<head>
	<parts:meta />
	<title>JSP Page</title>
	<parts:css />
	<parts:scripts />
</head>

<body>
	<c:url value="/" var="rootUrl" />
	<a class="button" href="${rootUrl}">home</a><br />
	counter reset
</body>
</html>
