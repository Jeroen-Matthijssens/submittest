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
	<a href="${rootUrl}">home</a>

	<parts:debug />

	<h1>Current Count</h1>

	<c:url value="/reset" var="resetUrl" />
	${counter.count}<a href="${resetUrl}">reset</a>

	<h1>params</h1>
	
	<div>
		<h3>Params</h3>
		${param}
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
	</div>
</body>

</html>
