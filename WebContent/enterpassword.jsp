<%@include file="header.jsp"%>	  
<%
Object obj  = session.getAttribute("emailrecover");
String emailFill ="";
if(obj!=null){
	emailFill = obj.toString();
}
%>  
<!--main start-->
      <div id="main">
	  <!--  <h1> Welcome to OldBookExchangePortal</h1>-->
				
		<div id="lt">
		</div>
		
		<div id="cnt">
		
		<form action="ControllerPassword" method="post">
			<div id="cntup">
			<br><br><br>
			<fieldset>
			
			<legend><b>Reset Password</b></legend>
			
			<label for="email"><b>Enter your Email Id</b></label>
			<input type="text" value="<%=emailFill%>" name="email" required>
			
			<label for="pwd"><b>Enter new password</b></label>			
			<input type="password" placeholder="Enter new password" name="pwd" required>
			
			<label for="cpwd"><b>Re-enter new password</b></label>
			<input type="password" placeholder="Re-enter new password" name="cpwd" required>
				
			<br>
			<input type="submit" value ="Next"><input type="reset" value = "Reset">
				
				
			</fieldset>
			
			
			
			</div>
		</form>
		
			
		
		</div>
		
		
		
		<div id="rt">
		</div>
		
	  </div>
       <!--main end-->	  
	  
	  
	  
<%@include file="footer.jsp"%>