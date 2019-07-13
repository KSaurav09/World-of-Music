<%@page import="sis.com.admin.SongList"%>
<%@include file="adminheader.jsp"%>
<%
SongList songList = null;
	if(session.getAttribute("songList")!=null){
		songList = (SongList)session.getAttribute("songList");
	}
%>

<!--main start-->
      <div id="main">
				
		<div id="lt" style="border-radius: 25px;width:15%;height:460px;float:left;opacity:0.0">
		</div>
		
		<div id="cnt" style="border-radius: 25px;width:70%;height:460px;float:left;">
		
		

<form action="audioupload"
	method="post"
	enctype="multipart/form-data" 
>
			<div id="cntup" >
			
			<fieldset>

			<legend><b>New Audio Song</b></legend>

			
<table width=100% >
			
			
	
			 <tr>
				
				
				<td><label for="audio"><b>Audio*</b></label></td>
				<td><input type="file" accept="audio/*"	 name="audio" required style="width: 100%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;"></td>
			
				<td></td>

			
			</tr> 
			
			
</table>
			<input type="submit" value ="Upload Audio"><input type="reset" value = "Reset">
			
			
			</fieldset>
			

			
			</div>
		</form>

</div>
</div>

<%@include file="footer.jsp"%>