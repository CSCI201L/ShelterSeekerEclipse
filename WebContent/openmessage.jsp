<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Shelter Seekers Open Message</title>
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
		
		.segoe{
			font-size: 20px; 
		 	font-weight: 200; 
		 }
		</style>
</head>
<body>
	<nav class="navbar navbar-default">
  		<div class="container-fluid" style="padding-left: 0px;">
		    <div class="navbar-header">
		    	<button onClick = "goBack();" style="padding-top: 5px; padding-left: 10px; border:none; background-color:#c5c1fe; "> <img src="arrow.png" style="width:50px; height: 40px"> </button>
		    </div>
		    <div class="collapse navbar-collapse" id="myNavbar">
		       <ul class="nav navbar-nav navbar-right">
		        <li style="margin-top: 10px; font-size: 20px">Safe Hands</li>
		      </ul>
		    </div>
 		</div>
	</nav>
	<div class="container-fluid"> 
		<h1>Subject line</h1>
		<h3>From senders's username</h3>
		<img src="http://www-scf.usc.edu/~csci201/images/jeffrey_miller.jpg" width="100" height="100">
		Body of Message <br>
	</div>
	<footer class="container-fluid text-center">
	  <p> © 2018 Safe Hands </p>
	</footer>
<script>
	function defaultMessage(){
		if(document.getElementById("message").value.length<1){
			document.getElementById("message").defaultValue=document.getElementById("subject").value;
			alert(document.getElementById("message").defaultValue);
		}
	}
	function goBack(){
		location.href="usermessages.jsp";
	}
	</script>
</body>
</html>