<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<%@ page import="retrieval.DBHelper, retrieval.Message, retrieval.Mail,  javax.servlet.http.HttpServlet, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, retrieval.CompareMessageByReadAndTime,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Shelter Seekers User Messages Page</title>
<style>
li {
	display: inline;
	float: left;
}

#top ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: blue;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}
</style>
<script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
<body>
	<% 
	//REPLACE THIS WITH HTTPSESSION GLOBAL INSTANCE OF DB
	DBHelper db =(DBHelper) request.getSession().getAttribute("DBHelper");
	System.out.println(db.didConnect() + "is status");
	
	Mail mail = new Mail();
	
	ArrayList<Message> ms = db.getMessages();
	
	for(int i = 0; i < ms.size(); i++){
		mail.addMessage(ms.get(i));
	}
	
	//CompareMessageByReadAndTime comp = new CompareMessageByReadAndTime();
	mail.SortByReadAndTime(comp);
	
	ArrayList<Message> messages = mail.getMessages();
	
	System.out.println(messages.size() + "total messages");
%>
	<div id="top">
		<ul>
		<li><a href="userhomepage.jsp">Search</a></li>
		<li><a href="usermessages.jsp">Messages</a></li>
		<li><a href="usersettings.jsp">Profile</a></li>
		</ul>
	</div>
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


	<script>
		function writeMessage() {
			location.href = "writemessage.jsp";
		}
	</script>
</body>
</html>