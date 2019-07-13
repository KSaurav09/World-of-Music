<%@page import="java.util.List"%>
<%@include file="adminheader.jsp"%>

<%
List<User> customerList = null;
	
	if((request.getAttribute("customerList"))!=null){
		customerList = (List<User>)request.getAttribute("customerList");
	
%>

<!--main start-->
      <div id="main">
				
		<div id="lt" style="border-radius: 25px;width:20%;height:460px;float:left;opacity:0.0">
		</div>
		
		<div id="cnt" style="border-radius: 25px;width:60%;height:460px;float:left;">
		
		
		<form method = "post" action="">
			<div id="cntup" style="overflow:scroll;width:100%;height:100%;float:left;">
			
			<fieldset>

			<legend><b>Customer Details</b></legend>Reading gives us someplace to go when we have to stay where we are.

	<hr>
<%
	for(User user : customerList){ 
	
%>
<table width=100% >
			
			<tr>
				<td rowspan="4" width=30%><img src="GetImageController?img_id=<%=user.getLoginId() %>" alt="customer image" height="120px" width="90px" ></td>
				<td><h3><%=user.getFname()%>  <%=user.getLname()%></h3></td>
			</tr>													 
			
			<tr>
				
				<td>D.O.B.:<%=user.getDob()%></td>
			</tr>
			
			<tr>
				
				<td>Mobile number:<%=user.getMobno()%></td>
			</tr>
			<tr>
				<td>Email Id:<%=user.getLoginId()%></td>
			</tr>
			
		<%} %>
		<hr>	
</table>
<hr>

			</fieldset>
			
			
			
			</div>
		</form>
		
		
		
			
		
		</div>
		
		
		
		<div id="rt" style="border-radius: 25px;width:20%;height:460px;float:left;opacity:0.0">
		</div>
		
	  </div>
	  
<%}else{ %>
<p>No any registered student</p>
<%} %>
       <!--main end-->
       
       



<%@include file="footer.jsp"%>
