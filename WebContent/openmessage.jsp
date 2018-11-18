<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="retrieval.DBHelper, retrieval.Message, retrieval.Mail,  javax.servlet.http.HttpServlet, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, retrieval.CompareMessageByReadAndTime,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Shelter Seekers Open Message</title>
<script src="https://apis.google.com/js/platform.js" async defer></script>
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
</head>
<body>
	<%
		//REPLACE THIS WITH HTTPSESSION GLOBAL INSTANCE OF DB
		DBHelper db = (DBHelper) request.getSession().getAttribute("DBHelper");
		System.out.println(db.didConnect() + "is status");

		Mail mail = new Mail();

		ArrayList<Message> ms = db.getMessages();

		for (int i = 0; i < ms.size(); i++) {
			mail.addMessage(ms.get(i));
		}

		CompareMessageByReadAndTime comp = new CompareMessageByReadAndTime();
		mail.SortByReadAndTime(comp);

		ArrayList<Message> messages = mail.getMessages();
		int id = (Integer) session.getAttribute("messageID");
		
		Message m = new Message();

		for (int i = 0; i < messages.size(); i++) {
			if (messages.get(i).getID() == id) {
				m = messages.get(i);
				m.read();
				break;
			}
		}
	%>
	<div id="top">
		<ul>
			<li><a href="userhomepage.jsp">Search</a></li>
			<li><a href="usermessages.jsp">Messages</a></li>
			<li><a href="usersettings.jsp">Profile</a></li>
		</ul>
	</div>



	<h1 id="subject">
		<%
			out.println(m.getSubject());
		%>
	</h1>
	<h3>
		From
		<%
		out.println(m.getSender());
	%>
	</h3>
	<div id="body_message">
		<%
			out.println(m.getBody());
		%>
		<p id="test"></p>
	</div>
	<button id="back" onclick="writeMessage();">Reply</button>
	<br />
	<button id="back" onclick="goBack();">Go Back to User Message</button>
	<script>
		function goBack() {
			location.href = "usermessages.jsp";
		}

		function writeMessage() {
			location.href = "writemessage.jsp";
		}
	</script>
</body>
</html>