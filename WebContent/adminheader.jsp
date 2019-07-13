<!Doctype html>
<%@page import="sis.com.user.User"%>
<html>

<title>World Of Music</title>

<head>
<link rel="stylesheet" type="text/css" href="CSS/style.css">

</head>
<body style = "background: url(images/b8.jpg); background-size: 100%;">
<!-- <body>-->
<!--header start-->

<div id="header">
	<div id="top">
		<div id="logo" >
		<img src="images/l9.gif" height=100% width=100%/>
		</div>
		
		<div id="Project" >
			<div id="Project_Name" style = "background: url(images/l10.gif); background-size: 100%;">
			<marquee behavior="alternate" style="color:red;">World Of Music</marquee>
			
			</div>
			
			<div id="Project_Slogan" style="color:blue;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			
				
				
			</div>
		</div>
		
		<div id="Login">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%if(session.getAttribute("admin")!=null){ %>
	           <%
	          String adminLogin =  (String)session.getAttribute("admin");
	          %> 
	         <a href="#"><%=adminLogin%></a>
	 		<a href="Logout.jsp">Logout</a>
	 	 <%}%>	<br>
		</div>
		
	</div>

	<!-- <div id="menu" >
		<ul>
			<li><a href="admin.jsp">Home</a></li>
			
			<li><a href="addBook.jsp">Add New Song</a></li>
			<li><a href="ShowBookController">Show All Songs</a></li>
			<li><a href="CustomerList">Customer List</a></li>
			<li><a href="rentsell.jsp">Sell or rent Book</a></li>
			<li><a href="feedback.jsp">Feedback received</a></li>
			
		</ul>
	</div> -->



	<div id="menu" >
		<ul>
			<li><a href="home.jsp">Home</a></li>
			<li id="dropdown">
				<a href="#" id="dropbtn">Add Song</a>
					<div id="dropdown-content">
						<a href="AddAudio.jsp">Audio</a><br>
						<a href="AddVedio.jsp">Vedio</a><br>
					</div>
			</li>
			
			<li id="dropdown">
				<a href="#" id="dropbtn">Show All Songs</a>
					<div id="dropdown-content">
						<a href="AllAudioSong">Audio</a><br>
						<a href="AllVedioSong">Video</a><br>
					</div>
			</li>
			<li><a href="CustomerList">Customer List</a></li>
			
			<li id="dropdown">
				<a href="#" id="dropbtn">Downloaded Songs</a>
					<div id="dropdown-content">
						<a href="#">Audio</a><br>
						<a href="#">Video</a><br>
					</div>
			</li>
			<li><a href="feedback.jsp">Feedback received</a></li>
			
		</ul>
	</div>





</div>


<!--header end-->