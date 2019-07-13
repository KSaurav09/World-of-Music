<%@page import="sis.com.admin.SongList"%>

<%if(session.getAttribute("user")!=null){ %>
<%@include file="header.jsp"%>

<%}else{ %>
<%@include file="adminheader.jsp"%>
<%} %>
<%
	String idStr = request.getParameter("id");
	SongList song = null;
	long id = Long.parseLong(idStr);
	song= new SongList();
	song.setSongId(id);

%>



<video height="450" width="1300" controls autoplay loop>
    <source src="RunVedioDownlaodController?doc_id=<%=song.getSongId()%>" type="video/mp4" />
    </video>



	  
<%@include file="footer.jsp"%>	  