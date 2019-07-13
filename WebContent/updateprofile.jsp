<%@include file="header.jsp"%>

<%if(session.getAttribute("user")!=null){ %>
<%
   User user =  (User)session.getAttribute("user");
%>	

		<!--main start-->
      <div id="main">
	  <!--  <h1> Welcome to OldBookExchangePortal</h1>-->
				
		<div id="lt" style="width=20%;">
		</div>
		
		<div id="cnt">
		
			<div id="cntup" >
			
		<form method = "post" action="UpdateProfile">	
			
						<fieldset>

			<legend><b>Edit profile</b></legend>Edit the text box you want to  update and click on update button

			
<table width=100% >
			<tr>
				<td><label for="fname"><b>Firstname </b></label></td>
				<td><input type="text" size="10" value="<%=user.getFname()%>" name="fname" required style="width: 100%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;"></td>
			
				<td><label for="lname"><b>Lastname </b></label></td>
				<td><input type="text" value="<%=user.getLname()%>" name="lname" required style="width: 100%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;"></td>
			</tr>
			
			<tr>
				<td><label for="dob"><b>Date Of Birth </b></label></td>
				<td><input type="text" readonly="readonly" value="<%=user.getDob()%>" name="lname" required style="width: 100%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;"></td>
				<br>
			
				<td><label for="mobile"><b>Mobile number </b></label></td>
				<td><input type="text" name="mob"  required value="<%=user.getMobno()%>" style="width: 100%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;"></td>
				<br>
			</tr>

			<tr>
				<td><label for="uname"><b>Email id </b></label></td>
				<td><input type="text" readonly="readonly" value="<%=user.getLoginId()%>" name="lname" required style="width: 100%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;"></td>
				<br>
			</tr>
				
			
</table>
			<center><input type="submit" value ="Update">
			
			
			</fieldset>
			
			</form>
			
			
			
			
			</div>
		
			
		
		</div>
		
		
		
		<div id="rt">
		</div>
			
	  </div>
	   <!--main end-->

	<%}%>  
	  
<%@include file="footer.jsp"%>