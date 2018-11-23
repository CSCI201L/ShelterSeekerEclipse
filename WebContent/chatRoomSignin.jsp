<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
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
		html, body{
			margin: 0;
   			height: 100%;
			font-family: 'Quicksand', sans-serif;
			background-image: linear-gradient(to right, #7a5ce5, #a490ea, #7a5ce5);
		}
		
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
		input[type=text] {
		    width: 40%;
		    padding: 12px 20px;
		    margin-left: 30%;
		    border-radius: 25px;
		}
		#text{
			text-align:center; 
			font-size: 25px; 
			margin-top:15%; 
		}
	</style>
	<script>
	function sendUserName(e) {
		console.log("IN send user name");
		if(e.keyCode == 13){
			console.log("username = " + document.getElementById("user").value);
			sessionStorage.setItem('username', document.getElementById("user").value);
			window.location.href ='http://localhost:8080/ShelterSeeker/chat.jsp';
		}
	}
	</script>
	</head>
	
	<body id="background">
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
	      <li><a href="usermessages.jsp">Messages</a></li>
	      <li><a href="orgstats.html">My Stats</a></li>
	    </ul>
	     <ul class="nav navbar-nav navbar-right">
        	<li><a class="navbar-brand" href="signin.jsp">Sign Out</a></li>
      	</ul>
	  </div>
	</nav>
	
		<p id="text">Before entering the chat room please enter a username:<br></p>
		<input style="text-color: gray" id="user" type="text" name="username" placeholder="Enter username here..." onkeyup="sendUserName(event);">
	
	
	</body>
	<footer class="container-fluid text-center">
	  <p> © 2018 Safe Hands </p>
	</footer>
</html>