<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
	<a class="button" href="${rootUrl}">home</a>

	<c:url value="/reset" var="resetUrl" />
	<h1><a class="button" href="${resetUrl}">reset</a> Current Count: ${counter.count}</h1>

	<h1>Params</h1>

	<table class="fancy">
		<thead> 
			<tr>
				<th style="width: 25%;">key</th>
				<th style="width: 75%;">values</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="name" items="${param}">
			<tr>
				<td class="center"><c:out value="${name.key}" /></td>
				<td><c:out value="${name.value}" /></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>

</html>
