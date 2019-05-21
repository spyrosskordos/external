<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div>


	<br> <br>

	<h3>&nbsp&nbsp Register</h3>
	<form:form action="createUser" method="POST" class="ui form"
		modelAttribute="user">
		
		&nbsp&nbsp
		<input type="text" style="width: 200px" name="username"
			placeholder="username" required="true" />
		<br>
		<br>
		&nbsp&nbsp
		<input type="password" style="width: 200px" name="password"
			placeholder="password" required="true" />
		<br>
		<br>
		&nbsp &nbsp
		<input type="email" style="width: 200px" name="email"
			placeholder="email" required="true" />
		<br>
		<br>
		&nbsp&nbsp
		<input type="text" style="width: 200px" name="name"
			placeholder="name" pattern="^[a-zA-Z]+$" required="true" />
		<br>
		<br>
		&nbsp&nbsp
		<input type="text" style="width: 200px" name="surname"
			placeholder="surname" pattern="^[a-zA-Z]+$" required="true" />
		<br>
		<br>
			
		
		&nbsp&nbsp
		<button class="ui button" type="submit">Register</button>
	</form:form>
	<br> &nbsp&nbsp
	
	<%
 	String register_msg = (String) request.getAttribute("message");
 	if (register_msg != null)
 		out.println("<font color=red size=3px>" + register_msg + "</font>");
 %>
	<br> <br>