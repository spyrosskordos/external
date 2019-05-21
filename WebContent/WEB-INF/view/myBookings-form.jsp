<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="ui segment">
<sec:authorize access="isAuthenticated()">
	<h3>
		<i class="book icon"></i>My Bookings
	</h3>

	<!--  add our html table here -->
	<table class="ui celled  striped table">
		<thead>

			<th>Vehicle</th>
			<th>Date</th>
			<th>Status</th>
		</thead>
		<!-- loop over and print our customers -->
		<c:forEach items="${allBookingsOfUser}" var="pp">
			<c:choose>
				<c:when test="${pp.confirmed == 'true'}">
					<tr>
						<td <%="style='background-color:lightgreen;'"%>><c:out value="${pp.vehicleToCheck}" /></td>
						<td <%="style='background-color:lightgreen;'"%>><c:out value="${pp.date}" /></td>
						<td <%="style='background-color:lightgreen;'"%>>Confirmed</td>

					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td <%="style='background-color:LightCoral;'"%>><c:out value="${pp.vehicleToCheck}" /></td>
						<td <%="style='background-color:LightCoral;'"%>><c:out value="${pp.date}" /></td>
						<td <%="style='background-color:LightCoral;'"%>>Not Confirmed</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</table>
<!--
Se periptwsi pou pelaths prospathisei na mpei apo to url

-->
</sec:authorize>

	
			<sec:authorize access="!isAuthenticated()">
			<br>
			<br>
			<br>
			<br>
			<div class="ui middle aligned center aligned grid">
  			<div class="column">
			
		<h2 class="ui icon header">
  <i class="remove circle outline icon"></i>
  <div class="content">
    Access Denied
    <div class="sub header">Please Login  <a href="<c:url value="/login/logout" />"><strong></strong>Here</a> </div>
  </div>
</h2>
			</div>
			</div>
			<br>
			<br>
			<br>
			<br>
			</sec:authorize>
</div>

