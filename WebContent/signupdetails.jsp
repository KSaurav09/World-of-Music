<%@include file="header.jsp"%>

<%
Object obj  = session.getAttribute("email");
String emailFill ="";
if(obj!=null){
	emailFill = obj.toString();
}


%>

<!--main start-->
      <div id="main">
				
		<div id="lt" style="border-radius: 25px;width:15%;height:460px;float:left;opacity:0.0">
		</div>
		
		<div id="cnt" style="border-radius: 25px;width:70%;height:460px;float:left;">
		
		
		<form method = "post" action="UserDetails">
			<div id="cntup" >
			
			<fieldset>

			<legend><b>Sign up form</b></legend>Reading gives us someplace to go when we have to stay where we are.

			
<table width=100% >
			<tr>
				<td><label for="fname"><b>Firstname *</b></label></td>
				<td><input type="text" size="10" placeholder="Enter first name" name="fname" required="required" style="width: 100%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;"></td>
			
				<td><label for="lname"><b>Lastname *</b></label></td>
				<td><input type="text" placeholder="Enter last name" name="lname" required="required" style="width: 100%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;"></td>
			</tr>
			
			<tr>
				<td><label for="dob"><b>Date Of Birth *</b></label></td>
				<td><input type="date" name="dateofbirth" required="required" style="width: 100%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;"></td>
				<br>
			
				<td><label for="mobile"><b>Mobile number *</b></label></td>
				<td><input type="text" name="mob"  required="required" placeholder="Enter mobile number" style="width: 100%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;"></td>
				<br>
			</tr>

			<tr>
				<td><label for="uname"><b>Email id *</b></label></td>
				<td colspan=1>
				<input type="email" value="<%=emailFill%>" readonly="readonly" name="email"  style="width: 100%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;"></td>
				<!-- <td><label for="uimg"><b>Profile Image *</b></label></td>
				<td><input type="file"   name="uimg"  style="width: 100%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;"></td>
				 --><br>
			</tr>
				
			<tr>	
				<td><label for="psd"><b>Password *</b></label></td>
				<td><input type="password" placeholder="Enter password" name="pwd" required style="width: 100%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;"></td>
			
			
				<td><label for="cpsd"><b>Confirm Password *</b></label></td>
				<td><input type="password" placeholder="Enter confirm password" name="cpwd" required style="width: 100%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;"></td>
				<br>
			</tr>
</table>
			<input type="submit" value ="Signup"><input type="reset" value = "Reset">
			
			
			</fieldset>
			
			
			
			</div>
		</form>
		
		
		
			
		
		</div>
		
		
		
		<div id="rt" style="border-radius: 25px;width:15%;height:460px;float:left;opacity:0.0">
		</div>
		
	  </div>
       <!--main end-->




<%@include file="footer.jsp"%>