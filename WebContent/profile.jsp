<%@include file="header.jsp"%>
<%if(session.getAttribute("user")!=null){ %>
<%
   User user =  (User)session.getAttribute("user");
%>	  
	  
<!--main start-->
      <div id="main">
	 
				
		<div id="lt" style="width=20%;">
		</div>
		
		<div id="cnt">
		
			<div id="cntup">
			
		<form method = "post" 
			  action="UpdateImageController"	
			  enctype="multipart/form-data">
			<fieldset>

			<legend><b>Your profile</b></legend>Reading gives us someplace to go when we have to stay where we are.

			
<table width=100% >
			<tr>
				<td rowspan=4><img src="GetImageController" alt="upload your profile image" height="160" width="150"></td>
				<td><label for="fname"width=100%><b>First Name *</b></label></td>
				<td><%=user.getFname()%></td>
				
			</tr>
			
			<tr>
				 <td><label for="lname"><b>Lastname *</b></label></td>
				<td><%=user.getLname()%></td> 
				
			</tr>
			
			
			<tr>
				<td><label for="dob"><b>Date Of Birth *</b></label></td>
				<td><%=user.getDob()%></td>
				<br>
				</tr>
			
			<tr>
				<td><label for="mobile"><b>Mobile number *</b></label></td>
				<td><%=user.getMobno()%></td>
				<br>
			</tr>
			
			
			
			<tr>
				<td><input type="file" size="10"  name="uimg" accept="image/*"></td>
				<td><label for="uname"><b>Email id *</b></label></td>
				<td><%=user.getLoginId()%></td>
				
		
				<br>
			</tr>
			<tr>
				<td><center><input type="submit" value ="Update profile image "></td>
				
				<td colspan = 2><center><a href="updateprofile.jsp"><b>Update profile </a></td>
				
<%}else{ %>
<p>Please login again</p>
<%} %>				
				
				<br>
			</tr>	
			
</table>
			
			
			
			</fieldset>
			
			</form>
			
			
			
			
			</div>
		
			
		
		</div>
		
		
		
		<div id="rt">
		</div>
		
	
	  </div>
	  <!--main end-->	  
	  
	  
	  
<%@include file="footer.jsp"%>