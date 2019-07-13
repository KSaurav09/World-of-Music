<!Doctype html>
<%@page import="sis.com.user.User"%>
<html>

<title>World Of Music</title>

<head>
<link rel="stylesheet" type="text/css" href="CSS/style.css">

</head>
<body style = "background: url(images/b8.jpg); background-size: 100%;">
<!--<body>-->
<!--header start-->

<div id="header">
	<div id="top">
		<div id="logo" >
		<img src="images/l1.gif" height=100% width=100%/>
		</div>
		
		<div id="Project" >
			<div id="Project_5Name"  style = "background: url(images/l3.gif); background-size: 100%"; >
			<marquee behavior="alternate" style="color:red;">World Of Music</marquee>
			
			</div>
			
			<!-- <div id="Project_Slogan" style="color:blue;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			
				
				
			</div> -->
		</div>
		
		<div id="Login">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%if(session.getAttribute("user")!=null){ %>
	          <%
	          User user =  (User)session.getAttribute("user");
	          %>
	         <a href="profile.jsp"><%=user.getName()%></a>
	 		<a href="Logout.jsp">Logout</a>
	 	 <%}else{ %>	
	 		<a href="Login.jsp">Login</a>
	 		<a href="signupemail.jsp">Sign Up</a> 
	 	 <%} %>	<br>
		</div>
		
	</div>

	<div id="menu" >
		<ul>
			<li><a href="home.jsp">Home</a></li>
			<li id="dropdown">
				<a href="#" id="dropbtn">Categories</a>
					<div id="dropdown-content">
						<a href="AllAudioSong">Audio</a><br>
						<a href="AllVedioSong">Vedio</a><br>
					</div>
			</li>
			
			
			
			<li><a href="aboutus.html">About Us</a></li>
			<li><a href="contactus.html">Contact Us</a></li>
			
		</ul>
	</div>

</div>


<!--header end-->