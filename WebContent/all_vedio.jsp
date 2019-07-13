<%@page import="sis.com.admin.SongList"%>
<%@page import="java.util.List"%>
<%@include file="adminheader.jsp"%>


<%
	List<SongList> songList = null;
	
		songList = (List<SongList>)session.getAttribute("songList");
	
%>

<!--main start-->
      <div id="main">
	  <!--  <h1> Welcome to OldBookExchangePortal</h1>-->
				
		<div id="lt" style="border-radius: 25px;width:20%;height:460px;float:left;opacity:0.0">
		</div>
		
		<div id="cnt" style="border-radius: 25px;width:60%;height:460px;float:left;">
		
		
		<form method = "post" action="">
			<div id="cntup" style="overflow:scroll;width:100%;height:100%;float:left;">
			
			<fieldset>

			<legend><b></b></legend>

<table width="100%">
	<tr>
	<th>Song Name</th>
	<th>Play/Pause</th>
	<th>delete/download</th>
	
	</tr>
</table>

<table width=100% >

<%
	for(SongList song : songList){
		
	
%>
	
			
			<tr>
			<td><%=song.getSongName()%></td>
				<td>
									
		<%-- <video height="100" width="300" controls autoplay loop muted>
    		<source src="RunVedioDownlaodController?doc_id=<%=song.getSongId()%>" type="video/mp4" />
		</video> --%>
		
		
		<a href="play.jsp?id=<%=song.getSongId()%>">Play</a>
					
				</td>
				
				
				<%if(session.getAttribute("user")!=null){ %>
				<td><a href="VedioDownlaodController?doc_id=<%=song.getSongId()%>">download</a></td>

			<%}else{ %>
			
				<td><a href="DeleteVedioController?id=<%=song.getSongId()%>">delete</a>
				<a href="VedioDownlaodController?doc_id=<%=song.getSongId()%>">download</a></td>
			<%} %>
				
				
				<%--  <td><a href="DeleteVedioController?id=<%=song.getSongId()%>">        delete</a><a href="VedioDownlaodController?doc_id=<%=song.getSongId()%>">download</a></td> --%>
			</tr>
			
		<%} %>	
			
</table>
			
			<hr>
				
			</fieldset>
			
			
			
			</div>
		</form>
		
		
		
			
		
		</div>
		
		
		
		<div id="rt" style="border-radius: 25px;width:20%;height:460px;float:left;opacity:0.0">
		</div>
		
	  </div>
       <!--main end-->

<%

session.removeAttribute("songList");

%>




<%@include file="footer.jsp"%>