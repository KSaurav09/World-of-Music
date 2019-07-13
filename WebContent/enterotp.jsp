<%@include file="header.jsp"%>

<%
Object obj1  = session.getAttribute("email");
Object obj2  = session.getAttribute("emailrecover");
String emailFill ="";
if(obj1!=null){
	emailFill = obj1.toString();
}else if(obj2!=null){
	emailFill = obj2.toString();
}


%>

<!--main start-->
      <div id="main">
				
		<div id="lt">
		</div>
		
		<div id="cnt">
		
		<form method ="post" action="OtpVerification">
			<div id="cntup">
			<br><br>
			<fieldset>
			
			<legend><b>OTP Checker</b></legend>
			
			<%if(session.getAttribute("errormsg")!=null){ %>
			<p style=color:red;><%=session.getAttribute("errormsg") %></p>
			<%}else{%>
			<p style=color:blue;>An OTP has been sent to your email. Check your email</p>
			<%}%>
			
			<label for="uname"><b>Email</b></label>
			
			<%if(obj1!=null){ %>
				<input type="email" value="<%=emailFill%>" name="email" readonly="readonly">
			<%}else if(obj2!=null){%>
				<input type="email" value="<%=emailFill%>" name="emailrecover" readonly="readonly">
			<%}%>
			
			<br>
			
			<label for="otp"><b>Enter OTP</b></label>
			<input type="number" placeholder="Enter OTP" name="enter_otp" required>


			<br>
			
			
			<%if(request.getSession().getAttribute("email_otp")==null){ %>
			<input type="submit"  value="Next"  name="what_todo_do">
			<%}else{ %>
			<input type="submit"  value="Next"  name="what_todo_do">
			<%} %>

				
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