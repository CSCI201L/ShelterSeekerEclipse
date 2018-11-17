<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="retrieval.DBHelper, retrieval.Message, retrieval.Mail,  javax.servlet.http.HttpServlet, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, retrieval.CompareMessageByReadAndTime,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<head>
	<title>Shelter Seekers User Settings</title>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
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
		</style>
	<title>Shelter Seekers Organization Settings</title>
</head>
<%
	DBHelper db =(DBHelper) request.getSession().getAttribute("DBHelper");
	String email= db.user.email;
	String phonenum=db.shInfo.phoneNumber;
	int zip=db.shInfo.zipcode;
	String currpassworderror=(String)request.getAttribute("currpass_err");
	if(currpassworderror==null){
		currpassworderror="";
	}
	String newpassworderror=(String)request.getAttribute("newpass_err");
	if(newpassworderror==null){
		newpassworderror="";
	}
	String ziperror=(String)request.getAttribute("zip_err");
	if(ziperror==null){
		ziperror="";
	}
	String phoneerror=(String)request.getAttribute("phone_err");
	if(phoneerror==null){
		phoneerror="";
	}
%>
<body> <!-- onload="defaultContactInfo();"> -->
 	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	  	<div class="navbar-header">
			 <a class="navbar-brand" href="#">Safe Hands</a>
		</div>
	    <ul class="nav navbar-nav">
	      <li><a href="userhomepage.jsp">Search</a></li>
	      <li><a href="usermessages.jsp">Messages</a></li>
	      <li><a href="orgstats.html">My Stats</a></li>
	    </ul>
	     <ul class="nav navbar-nav navbar-right">
        	<li><a class="navbar-brand" href="signin.jsp">Sign Out</a></li>
      	</ul>
	  </div>
	</nav>
	<div class="container-fluid"> 
		<form action="bUpdateOrg" method="GET"><!-- onsubmit="return validate();"> --><!-- method="POST" action="Servlet" -->
			<div class="col-lg-8">
				<h1>Shelter Description</h1>
				Are you a shelter that allows children ?<br>
				<input type="radio" name="children" value="1" required> Yes<br>
				<input type="radio" name="children" value="0"> No<br>
				Are you a shelter that allows pets ? <br>
				<input type="radio" name="pets" value="1" required> Yes<br>
				<input type="radio" name="pets" value="0"> No<br>
				Are you a shelter that is near a pharmacy within a 5 mile distance? <br>
				<input type="radio" name="pharmacy" value="1" required> Yes<br>
				<input type="radio" name="pharmacy" value="0"> No<br>
				Are you a shelter that is near a grocery within a 5 mile distance? <br>
				<input type="radio" name="grocery" value="1" required> Yes<br>
				<input type="radio" name="grocery" value="0"> No<br>
				Are you a shelter that is near a laundromat within a 5 mile distance? <br>
				<input type="radio" name="laundromat" value="1" required> Yes<br>
				<input type="radio" name="laundromat" value="0"> No<br>
				Organizations Contact Info <br>
				<a href="http://localhost:8080/ShelterSeeker/orgprofile.jsp"><input id="pic" type="text" value="Press to go to Picture" readonly></a><br>
				<br>
				Current Zipcode: 12345<br>
				Update Zipcode: <input id="new_zipcode" type="text" name="new_zipcode" placeholder="Update Zip Code">
				<%= ziperror %>
				<br>
				Current Phone Number: (123)456-7890<br>
				Update Phone Number: <input id="new_phone" type="tel" name="new_phone" placeholder="123-456-7890" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}">
				<%= phoneerror %>
				<br>
			</div>
			<div class="col-lg-4">
				<h1>Security Preferences</h1><br>
				Current Email: currentemail@.com<br>
				<h4>Reset your password here</h4>
				Enter your current password: <input id="curr_pass" type="text" name="current_password" placeholder="Current password">
				<%= currpassworderror %>
				<br> 
				Enter your new password: <input id="new_pass" type="text" name="new_password" placeholder="New password">
				<%= newpassworderror %>
				<br>
			</div>
			<input class="btn btn-lg btn-default" type="submit" value= "Submit">
		</form>
	</div>
	 <footer class="container-fluid text-center">
	  <p> © 2018 Safe Hands </p>
	</footer>
	
<script>
	function validate(){
		var x=document.getElementById("new_email").value;
			y=document.getElementById("curr_pass").value;
			z=document.getElementById("new_pass").value;
			email_errormessage=document.getElementById("email-error");
			curr_passerrormessage=document.getElementById("curr_pass-error");
			new_passerrormessage=document.getElementById("new_pass-error");
		if(x.length<1&&y.length<1){
			alert("emothu");
			email_errormessage.innerHTML="cant be empty";
			curr_passerrormessage.innerHTML="cant be empty";
			return false;
		}
		if(y.length<1&&z.length<1){
			alert("afs");
			curr_passerrormessage.innerHTML="cant be empty";
			new_passerrormessage.innerHTML="cant be empty";
			return false;
		}
	}
	function defaultContactInfo(){
		if(document.getElementById("org_info").value.length<1){
			document.getElementById("org_info").defaultValue="default info, change it";
		}
	}
</script>	
</body>
</html>