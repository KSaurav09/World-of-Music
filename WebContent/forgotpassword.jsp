<%@include file="header.jsp"%>



		<!--main start-->
      <div id="main">
	  <!--  <h1> Welcome to OldBookExchangePortal</h1>-->
				
		<div id="lt">
		</div>
		
		<div id="cnt">
		
		<form action="EmailCheck" method="post">
			<div id="cntup">
			<br><br><br>
			<fieldset>
			
			<legend><b>Reset Password</b></legend>
			<%if(session.getAttribute("error_msg")!=null){ %>
			<p style=color:red;><%=session.getAttribute("error_msg") %></p>
			<%}%>
			<label for="email"><b>Enter your Email Id</b></label>
			<input type="text" placeholder="Enter Email Id" name="emailrecover" required>
			
			
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