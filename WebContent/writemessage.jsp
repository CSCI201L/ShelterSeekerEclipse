<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="retrieval.DBHelper, retrieval.Message, retrieval.Mail,  javax.servlet.http.HttpServlet, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, retrieval.CompareMessageByReadAndTime,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Shelter Seekers Write Message</title>
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
	<div id="top">
		<ul>
			<li><a href="userhomepage.jsp">Search</a></li>
			<li><a href="usermessages.jsp">Messages</a></li>
			<li><a href="usersettings.jsp">Profile</a></li>
		</ul>
	</div>
	Send a Message to someone!
	<form id="send_message" onsubmit="return defaultMessage();">
		<!--  method="post" action="Servlet"-->
		To: <input id="recipient" type="text" name="recipient"
			placeholder="Recipient"><br /> Subject: <input id="subject"
			type="text" name="subject" placeholder="Subject" required><br />
		Message:
		<textarea rows='4' cols='50' id="message" name="message"
			placeholder="Message" form='send_message'></textarea>
		<br /> <input type="submit" value="Send">
	</form>

	<button id="back" onclick="goBack();">Go Back to User Messages
	</button>

	<script>
		function goBack() {
			var x = document.getElementById("message").value;
			if (x.length > 0) {
				alert("Your message will not be saved.");
			}
			location.href = "usermessages.jsp";
		}

		function defaultMessage() {

			if (document.getElementById("recipient").value.length < 1) {
				alert("Please input a recipient.");
				return false;
			}

			if (document.getElementById("subject").value.length < 1) {
				alert("Please input a subject.");
				return false;
			}

			if (document.getElementById("message").value.length < 1) {
				alert("Please input a message body.");
				return false;
			}
		}
	<%DBHelper db = (DBHelper) request.getSession().getAttribute("DBHelper");
			System.out.println(db.didConnect() + "is status");
			String subject = request.getParameter("subject");
			String recip = request.getParameter("recipient");
			String body = request.getParameter("message");
			String sender = "example";
			Message m = new Message(subject, body, sender, recip);
			db.sendMessage(m);%>
		
	</script>
</body>
</html>