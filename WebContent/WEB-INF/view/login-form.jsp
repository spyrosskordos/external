<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
<!--
.field {
    width: 450px;

 }
.ui form {
    width: 420px;
    margin: 0 auto;
}

.ui submit button{

	margin-left: -4px
}

-->
</style>
<br><br>
<div class="ui middle aligned center aligned grid">
  <div class="column">
    <h2 class="ui teal image header">

        Log-in to your account

    </h2>
    
	<form:form action="${pageContext.request.contextPath}/authUser"
		method="POST" class="ui form">
		<c:if test="${param.error != null}">
			<div class="ui negative message">
				<i class="close icon"></i>
				<div class="header">Oops!</div>
				<p>Sorry! Invalid username/password!</p>
			</div>
		</c:if>
		
		
		<div class="field">
		 <input type="text" name="username" placeholder="Username"/>
		</div>
		<div class="field">
			 <input type="password" name="password"  placeholder="Password"/>
		</div>
		<div class="field">
			<input type="submit" value="Login" />
		</div>
	</form:form>
   
  <form:form action="register"
		method="POST" class="ui form">
    <div  class="ui message">
      New to us? &nbsp <a href="${pageContext.request.contextPath}/user/register">Sign Up</a>
    </div>
    </form:form>
  </div>
</div>
