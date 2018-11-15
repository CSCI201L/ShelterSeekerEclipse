<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Shelter Seekers Write Message</title>
<script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
<body>
	Send a Message to someone!
	<form id="send_message" onsubmit="defaultMessage();">
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
			}

			if (document.getElementById("subject").value.length < 1) {
				alert("Please input a subject.");
			}
			
			if (document.getElementById("message").value.length < 1) {
				alert("Please input a message body.");
			}
			
			<% 
			String subject = request.getParameter("subject");
			String recip = request.getParameter("recipient");
			String body = request.getParameter("message");
			//Message m = new Message();
			%>
			
		}
	</script>
</body>
</html>