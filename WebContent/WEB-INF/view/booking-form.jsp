<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div>


	<br> <br>

	<sec:authorize access="isAuthenticated()">

		<h1 font-weight:bold;>&nbsp&nbsp Booking</h1>
		<h3>&nbsp&nbsp&nbsp Step 1:</h3>
		<form:form action="bookingStep1" modelAttribute="vehicleDB"
			method="POST" class="ui form" style="width: 200px">
			<h3>&nbsp&nbsp&nbspSubmit License Plate</h3>&nbsp&nbsp&nbsp
		&nbsp&nbsp&nbsp<input type="text" name="license_plate"
				placeholder="License Plate" pattern="^[a-zA-Z0-9]+$" />
			<br>
			<br>
			&nbsp&nbsp<button class="ui button" type="submit">Submit</button>
			<br>
			<br>

		</form:form>

		<form:form action="bookingStep2" modelAttribute="bookings"
			method="POST" class="ui form" style="width: 200px">

			<%
				String message_status;			
				message_status =(String) request.getAttribute("message");
				String message_license_plate =(String) request.getAttribute("license_plate");
				String msg =(String) request.getAttribute("msg");

				if(msg!=null){
					message_status = msg.substring(0, 3);
					String date = msg.substring(3,13);
					out.println("<font color=green size=4px>Your vehicle exist in DB. Warning! Next inspection date is in: </font><font color=red size=4px>" + date + "</font><font color=green size=4px>. Book before next inspection date expired to avoid fee.</font>");
				}
		    	if (message_license_plate != null){
		    				out.println("<font color=red size=4px>"+message_license_plate+ "</font>");
		    	}
				if (message_status != null) {
							int no = Integer.parseInt(message_status);
							if (no == 200) {
								out.println("<h3>&nbsp&nbsp&nbsp  Step 2: </h3>"
										+ "<h3>&nbsp&nbsp&nbsp  Submit Booking </h3>"
										+ " &nbsp&nbsp&nbspSelect Date<input type='date' name='date'   placeholder='Date' required='true'/><br><br>"
										+ " &nbsp&nbsp&nbspSelect Time<select id='time' name='time' > <option value='09:00:00'>09:00:00</option><option value='10:00:00'>10:00:00</option><option value='11:00:00'>11:00:00</option><option value='12:00:00'>12:00:00</option><option value='13:00:00'>13:00:00</option><option value='14:00:00'>14:00:00</option><option value='15:00:00'>15:00:00</option><option value='16:00:00'>16:00:00</option></select><br><br>"
										+ " &nbsp&nbsp<button class='ui button' type='submit'>Submit</button> <br><br>");
								
							} else if (no == 500) {

								out.println(
										"<font color=red size=4px> Your vehicle doesn't exist in DB.</font>");
							} else {

								out.println("<font color=red size=4px> Please try again. </font>");
							}
						}
			%>

		</form:form>
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
						<div class="sub header">
							Please Login <a href="<c:url value="/login/logout" />"><strong></strong>Here</a>
						</div>
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