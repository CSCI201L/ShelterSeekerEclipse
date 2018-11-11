<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="retrieval.DBHelper, retrieval.Message, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<title>Shelter Seekers User Messages Page</title>
	<style>
		li {
    		display: inline;
    		float:left;
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
	DBHelper db = new DBHelper ("test@usc.edu","pass1");
	System.out.println(db.didConnect() + "is status");
	ArrayList<Message> ms= db.getMessages();
	System.out.println(ms.size() + "total messages");
%>
	<div id="top">
	<ul>
		<li><a href="search.jsp">Search</a></li>
		<li><a href="usermessages.jsp">Messages</a></li>
		<li><a href="profile.jsp">Profile</a></li>
	</ul>
	</div>
	<div id="middle">
	List
	<ul>
		<%for(int i = 0; i < ms.size(); i++){
			int sender = ms.get(i).sender;
			String mSubject = ms.get(i).subject;
			String mContent = ms.get(i).body;
			int sendtime = ms.get(i).timeSent;
			boolean r = false;
			if (ms.get(i).read == 1){
				r = true;
			}
			%>
		<div onClick = "seeFullMessage('<%= mSubject %>','<%= sender %>','<%= mContent %>')">
		<li>Message Opened <%=r %></li><br>
		<li>Send time <%=sendtime %></li><br>
		<li>Username of Sender <%=sender %></li><br> 
		<li>Subject of Message <%=mSubject %></li><br>
		<li>First Line of Message <%=mContent %></li><br>
		</div>
		<%} %>
	</ul>
	<form><!--  method="post" action="Servlet"-->
		<input id="search" type="text" name ="search" placeholder ="User Messages" >
		<input type="submit" value= "Search">
		
	</form>	
	
	<br>
	<button id="write" onclick="writeMessage();">Write Message</button> 
	</div>
	<div id="bottom">
	
	</div>
	
	
	<script>
	function writeMessage(){
		location.href="writemessage.jsp";
	}
	</script>
</body>
</html>