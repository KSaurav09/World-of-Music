<%@include file="header.jsp"%>


		<!--main start-->
      <div id="main">
				
		<div id="lt">
		</div>
		
		<div id="cnt">
		
		<form method = "post" action="LoginProcessor">

			<div id="cntup">
			<br><br>
			<fieldset>
			
			<legend><b>Login</b></legend>
			<%if(session.getAttribute("errmsg")!=null){ %>
			<p style=color:red;><%=session.getAttribute("errmsg") %></p>
			<%}%>
			<label for="uname"><b>Username</b></label>
				<input type="text" placeholder="Enter Email Id" name="uname" required>

				<label for="psw"><b>Password</b></label>
				<input type="password" placeholder="Enter Password" name="psw" required>

				<label>
					<input type="checkbox" checked="checked" name="remember"> Remember me
				</label>
				<br>
				<input type="submit" value ="Login"><input type="reset" value = "Reset">
				<left><a href="forgotpassword.jsp">Forgot password?</a>
				<right>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="signupemail.jsp">Do you want to enter the world of music Click here</a>
			</fieldset>
			
			
			
			</div>
		</form>
		
			
		</div>
		
		
		
		<div id="rt">
		</div>
		
	  </div>
       <!--main end-->
<%
session.removeAttribute("errmsg");
%>

	  
<%@include file="footer.jsp"%>