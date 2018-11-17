<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<%@ page import="java.util.Base64, retrieval.DBHelper, retrieval.Message, retrieval.Mail,  javax.servlet.http.HttpServlet, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, retrieval.CompareMessageByReadAndTime,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Shelter Seekers User Messages Page</title>
<head>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<link href="https://fonts.googleapis.com/css?family=Nunito+Sans" rel="stylesheet">
	<style>
		 .navbar {
		 	background-color: #c5c1fe;
		 	border-color:#c5c1fe;
	      	margin-bottom: 0;
	      	border-radius: 0;
	      	color:white; 
	    }
		.navbar-default .navbar-brand {
		    color: white;
		}
		.navbar-default .navbar-nav>li>a {
		    color: white;
		}
		.navbar-default .navbar-nav>.active>a{
			color: grey; 
			background-color: white; 
		}
		.navbar-brand{
    		padding: 0px 15px;
    		margin-right: -15px;
		}
		.navbar-right{
			margin-right: 0px;
		}
	    body{
			background-image: linear-gradient(to right, #7a5ce5, #a490ea, #7a5ce5);
			font-family: 'Nunito Sans', sans-serif;
			color:white; 
			height: 100%; 
		}  
	    footer {
	      background-color: #c5c1fe;
	      color: white;
	      padding: 15px;
	      position: fixed;
		  bottom: 0;
		  width: 100%;
		  height: 5%; 
	   
		}
		
		.blueFont {
			color: blue;
			opacity:0.9;
			filter: grayscale(80%);
		}
		
		.segoe{
			font-size: 20px; 
		 	font-weight: 200; 
		 
		 }
		</style>
</head>
<body>
	<% 
	//REPLACE THIS WITH HTTPSESSION GLOBAL INSTANCE OF DB
	DBHelper db =(DBHelper) request.getSession().getAttribute("DBHelper");
	System.out.println(db.didConnect() + "is status");
	System.out.println("at " +db.user.username);
	Mail mail = new Mail();
	String s = db.getImages(db.user.username);
	//decoded= decoded.substring(19);
	ArrayList<Message> ms = db.getMessages();
	
	for(int i = 0; i < ms.size(); i++){
		mail.addMessage(ms.get(i));
	}
	
	//CompareMessageByReadAndTime comp = new CompareMessageByReadAndTime();
	//mail.SortByReadAndTime(comp);
	
	ArrayList<Message> messages = mail.getMessages();
	
	System.out.println(messages.size() + "total messages");
%>
<<<<<<< HEAD
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	  	<div class="navbar-header">
		 	<figure class="navbar-brand">
			  <img src="bed.png" style="width: 30px;height: 40px;">
			</figure>	
		</div>
	    <ul class="nav navbar-nav">
	   	 	<li><a style="font-size: 20px">Safe Hands</a></li>
	      <li><a href="userhomepage.jsp">Search</a></li>
	      <li class="active"><a href="#">Messages</a></li>
	      <li><a href="userprofile.jsp">Profile</a></li>
	    </ul>
	     <ul class="nav navbar-nav navbar-right">
        	<li><a class="navbar-brand" href="signin.jsp">Sign Out</a></li>
      	</ul>
	  </div>
	</nav>
	<div class="container-fluid "> 
		<div class="col col-sm-6 ">
			<h3>Search Messages</h3>
			<div style="border: 1px double white; height:435px;" >
				<form>
				<div class="formgroup" style="margin-top: 20px ;margin-left:20px;">
					<input id="search" type="text" style="background-color:white; width: 375px;" class="segoe blueFont" name="search" placeholder="Enter sender's name..."> 
					<input class="btn btn-md btn-default" type="submit" value="Look Up">
				</div>
	
				</form>
				<!-- Message table should pop up below? -->
				<table>
				<%
					for(int i = 0; i < messages.size(); i++){
						out.println("<tr>" + "<td>" + messages.get(i).readable());
						out.println("<form action='' id='send'>");
						out.println("Subject: " + "<input type='text'>");
						out.println("<textarea rows='4' cols='50' name='body' form='send'>");
						out.println("</td>" + "</tr>");
					}
				%>
			</table>
			</div>
		</div>
		<div class="col col-sm-6 ">
			<h3>New Message</h3>
			<div style="border: 1px double white;">
				<form onsubmit="defaultMessage();"><!--  method="post" action="Servlet"-->
				<div class="form-group" style="margin-top: 20px ;margin-left:20px;">
					To: <br><input style="width: 400px;"id="recipient" type="text" class="segoe blueFont" name="recipient">
				</div>
				<div class="form-group" style="margin-left:20px;">
					Subject:<br><input style="width: 400px;" id="subject" type="text" class="segoe blueFont" name="subject" required>
				</div>
				<div class="form-group" style="margin-left:20px;">
					<input id="message" style="padding: 0px; height: 195px; width: 400px;"type="text" class="segoe blueFont" name="message">
				</div>
				<input class="btn btn-lg btn-default" style="margin-bottom: 20px; margin-left:20px; width: 400px"  type="submit" value= "Send">
			</form>
			</div>
		</div>
		</div>
	<footer class="container-fluid text-center">
	  <p> © 2018 Safe Hands </p>
	</footer>
=======
	<div id="top">
		<ul>
		<li><a href="userhomepage.jsp">Search</a></li>
		<li><a href="usermessages.jsp">Messages</a></li>
		<li><a href="usersettings.jsp">Profile</a></li>
		</ul>
	</div>
	IMAGE
	<img style="height:100px; width:100px;"src="<%=s %>">
	<div id="middle">
		<table>
			<%
				for(int i = 0; i < messages.size(); i++){
					out.println("<tr>" + "<td>" + messages.get(i).readable());
					out.println("<button id='write' onclick='writeMessage();'>Reply</button>");
					out.println("</td>" + "</tr>");
				}
			%>
		</table>
			
		<form>
			<!--  method="post" action="Servlet"-->
			<input id="search" type="text" name="search"
				placeholder="User Messages"> <input type="submit"
				value="Search">

		</form>

		<br>
		<button id="write" onclick="writeMessage();">Write Message</button>
	</div>
	<div id="bottom"></div>
>>>>>>> dev


	<script>
		function defaultMessage(){
			if(document.getElementById("message").value.length<1){
				document.getElementById("message").defaultValue=document.getElementById("subject").value;
				alert(document.getElementById("message").defaultValue);
			}
		}
		function writeMessage() {
			location.href = "writemessage.jsp";
		}
	</script>
</body>
</html>