<%@include file="header.jsp"%>

<!--main start-->
      <div id="main">
	  <!--  <h1> Welcome to OldBookExchangePortal</h1>-->
				
		<div id="lt">
		</div>
		
		<div id="cnt">
		
		<form method="post" action="EmailCheck">
			<div id="cntup">
			<br><br>
			<fieldset>
			
			<legend><b>Mail verification</b></legend>
			<%if(session.getAttribute("emailexists")!=null){ %>
			<p style=color:red;><%=session.getAttribute("emailexists") %></p>
			<%}%>
			<p style=color:blue;>Enter valid email for verification</p>
			<label for="uname"><b>Enter email</b></label>
			<input type="email" placeholder="Enter your email" name="email" required>
			<br>
			
			
			
			
			<%if(request.getSession().getAttribute("email_otp")==null){ %>
			<input type="submit"  value="Send OTP"  name="what_todo_do">
			<%}else{ %>
			<input type="submit"  value="Re-Send OTP"  name="what_todo_do">
			<%} %>
			<!--<input type="submit"  value="Signup" name="what_todo_do">	-->

			</fieldset>
			
			
			
			</div>
		</form>
		
			<!--<div id="cntdown">
			</div>-->
		</div>
		
		
		
		<div id="rt">
		</div>
		
	  </div>
       <!--main end-->


<%@include file="footer.jsp"%>