<%@ tag import="java.util.Enumeration" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="debug" data-toggle="parent-collapsed">
	<div class="click button button-fat button-red" data-toggle="clear-click">Debug Info</div>

	<div class="debug-info">
		<p>request-type: <%= request.getMethod() %></p>
	</div>

	<div>
		<h3>Cookies</h3>
		<table class="fancy">
			<thead>
				<tr>
					<th style="width: 25%;">key</th>
					<th style="width: 75%;">values</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="name" items="${cookie}">
				<tr>
					<td class="center"><c:out value="${name.key}" /></td>
					<td><c:out value="${name.value.value}" /></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>


	<div>
		<h3>Headers</h3>
		<table class="fancy">
			<thead>
				<tr>
					<th style="width: 25%;">key</th>
					<th style="width: 75%;">values</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="name" items="${header}">
				<tr>
					<td class="center"><c:out value="${name.key}" /></td>
					<td>
						<ol class="vertical" >
						<c:forEach var="value" items="${name.value}">
							<li><c:out value="${value}" /></li> 
						</c:forEach>
						</ol>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>

	<div>
		<h3>Request attributes</h3>
		<table class="fancy">
			<thead> 
				<tr>
				<th style="width: 25%;">key</th>
				<th style="width: 75%;">values</th>
				</tr>
			</thead>
			<tbody>
			<%
			Enumeration<String> attrValues = request.getAttributeNames ();
			String attrKey;
			while ( attrValues.hasMoreElements () ) {
				attrKey = attrValues.nextElement ();
				%>
				<tr>
					<td class="center"><c:out value="<%= attrKey %>" /></td>
					<td><c:out value="<%= request.getAttribute (attrKey) %>" /></td>
				</tr>
			<% } %>
			</tbody>
		</table>
	</div>

	<div>
		<h3>Session</h3>
		<table class="fancy">
			<thead> 
				<tr>
				<th style="width: 25%;">key</th>
				<th style="width: 75%;">values</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="name" items="${sessionScope}">
				<tr>
					<td class="center"><c:out value="${name.key}" /></td>
					<td><c:out value="${name.value}" /></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>

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
			<c:forEach var="name" items="${paramScope}">
				<tr>
					<td class="center"><c:out value="${name.key}" /></td>
					<td><c:out value="${name.value}" /></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>

</section>
