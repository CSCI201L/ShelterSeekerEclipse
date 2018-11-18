<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page
	import="retrieval.DBHelper, retrieval.Message, retrieval.Mail,  javax.servlet.http.HttpServlet, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, retrieval.CompareMessageByReadAndTime,java.util.*"%>
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

table {
	overflow-y: scroll;
	height: 450px;
	width: 600px;
	display: block;
	table-layout: fixed;
	border: 1px solid black;
	border-collapse: collapse;
	text-align: left;
}

table, tr {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	height: 60px;
	width: 600px;
}

#left, #right {
	float: left;
	width: 50%;
}

#right {
	text-align: left;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
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
		<div id="left">
			<br>
			<form>
				<!--  method="post" action="Servlet"-->
				<input id="search" type="text" name="search"
					placeholder="User Messages"> <input type="submit"
					value="Search">
			</form>
			<%
				out.println("<div>" + mail.getUnread() + " new messages.</div>");
			%>
			<table id="message_table">
				<%
					for (int i = 0; i < messages.size(); i++) {
						if (messages.get(i).getRead() == 1) {
							out.println("<tr>" + "<td id ='" + messages.get(i).getID() + "'; onclick='openMessage();'>"
									+ messages.get(i).readable());
						}

						if (messages.get(i).getRead() == 0) {
							out.println("<tr>" + "<td id ='" + messages.get(i).getID() + "'; onclick='openMessage();'>" + "<b>"
									+ messages.get(i).readable() + "</b>");
						}
						out.println("</td>" + "</tr>");
					}
				%>
			</table>
		</div>

		<div id="right">
			<br> Send a Message to someone!
			<form id="send_message" onsubmit="return defaultMessage();">
				<!--  method="post" action="Servlet"-->
				To: <input id="recipient" type="text" name="recipient"
					placeholder="Recipient"><br /> Subject: <input
					id="subject" type="text" name="subject" placeholder="Subject"
					required><br />
				<textarea rows='20' cols='100' id="message" name="message"
					placeholder="Message" form='send_message'></textarea>
				<br /> <input type="submit" value="Send">
			</form>
		</div>

	</div>
	<div id="bottom"></div>

	<script>
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
	<%System.out.println(db.didConnect() + "is status");
			String subject = request.getParameter("subject");
			String recip = request.getParameter("recipient");
			String body = request.getParameter("message");
			String sender = "example";
			Message m = new Message(subject, body, sender, recip);
			db.sendMessage(m);%>
		function openMessage() {
			location.href = "openmessage.jsp";
		}

		$(document).ready(function() {
			$('#message_table td').click(function(event) {
				sessionStorage.messageID = $(this).attr('id');
				alert(sessionStorage.messageID);
			});
		});
	</script>
</body>
</html>