<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- sign up section onsubmit="return !!(validateEmail() & validateUsername() & validatePassword() & validateZip());" -->
<%
	String err = (String) request.getAttribute("err");
	if (err==null){
		err = "";
	}
	%>
<!DOCTYPE html>
<html>
<head>
	<title>Shelter Seekers User Register</title>
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
		 background-color:  #c5c1fe;
	      margin-bottom: 0;
	      border-radius: 0;
	      border-color: #c5c1fe;
	    }
	    body{
			background-image: linear-gradient(to right, #7a5ce5, #a490ea, #7a5ce5);
			font-family: 'Nunito Sans', sans-serif;
			color:white; 
			height: 100%; 
		}  
	    footer {
	      background-color:  #c5c1fe;
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
<body >
	<nav class="navbar navbar-default">
  		<div class="container-fluid" style="padding-left: 0px;">
		    <div class="navbar-header" >
		    	<button onClick = "redirectHome();" style="padding-top: 5px; padding-left: 10px; border:none; background-color:#c5c1fe; "> <img src="arrow.png" style="width:50px; height: 40px"> </button>
		    </div>
		    <div class="collapse navbar-collapse" id="myNavbar">
		       <ul class="nav navbar-nav navbar-right" style="margin-top: 10px; font-size: 20px">
		       	<li style="padding-right:15px; margin-top:-10px;"><img src="bed.png" style="width: 30px;height: 40px;"></li>
		       	<li >Safe Hands</li>
		      </ul>
		    </div>
 		</div>
	</nav>
	<div class="container-fluid text-center"> 
		<h1>Registration</h1>
		<div class="col col-sm-6 " style="margin-left: 25%;">
			<form style="border: 2px double white; text-align: center;" name="signup"  action="oSignUp1" method="GET" ><!-- method="POST" action ="Servlet" -->
			<h3 class="blueFont">Please enter your organization's information below:</h3>
			<p class = "segoe" style = "font-size: 20px; font-weight: bold;color: red"><%= err %></p>
			<div class="form-group">
				<input id="email" type="email" class = "segoe blueFont" name ="email" placeholder ="Email" required> <br>
			</div>
			<div class="form-group">
				<input id="un" type="text" class = "segoe blueFont" name ="username" placeholder ="Username" required> <br>
			</div>
			<div class="form-group">
				<input id="pwd" type="text" class = "segoe blueFont" name ="password" placeholder ="Password" required> <br>
			</div>
			<div class="form-group">
				<input id="zip" type="text"class = "segoe blueFont" name ="zipcode" placeholder ="Zipcode" required > <br>
			</div>
			<div class="form-group">
				<input id="zip" type="text"class = "segoe blueFont" name ="phone" placeholder ="Phone Number" required > <br>
			</div>
			<input type="submit" class ="btn btn-lg btn-default"  style="margin-bottom: 20px" value= "Continue">
		</form>
	</div> 
	</div>
	
	<footer class="container-fluid text-center">
	  <p> © 2018 Safe Hands </p>
	</footer>
	
	<script>
	function redirectHome(){
		location.href="signin.jsp";
	}
	//validate email
	function validateEmail(){
		var x=document.getElementById("email").value;
			unerrormessage=document.getElementById("email-error");
		if(!x.length){
			alert("lmao");
			unerrormessage.innerHTML="must have input";
			return false;
		}
		 if (!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(signup.email.value))){
			 alert("false");
			 unerrormessage.innerHTML="not valid, needs to contain @";
			 return false;
		 }

	}
	//validate username
	function validateUsername(){
		var x=document.getElementById("un").value;
			unerrormessage=document.getElementById("un-error");
		if(!x.length){
			alert("lmao");
			unerrormessage.innerHTML="must have input";
			return false;
		}
	}
	//validate password
	function validatePassword(){
		var x=document.getElementById("pwd").value;
			unerrormessage=document.getElementById("pw-error");
		if(!x.length){
			alert("lmao");
			unerrormessage.innerHTML="must have input";
			return false;
		}
	}
	//validate zip code
	function validateZip(){
		var x=document.getElementById("zip").value;
			errormessage=document.getElementById("zip-error");
		if(x.length<5){
			alert("af");
			errormessage.innerHTML="input is too short. zip must be 5 numbers";
			return false;
		}
		if(x.length>5){
			errormessage.innerHTML="input is too long. zip must be 5 numbers";
			return false;
		}if(isNaN(x)){
			errormessage.innerHTML="zip must be numbers";
			return false;
		}
	}
	
/* 	var x = document.getElementById("loc");

	function getLocation() {
	    if (navigator.geolocation) {
	        navigator.geolocation.getCurrentPosition(showPosition, showError);
	    } else {
	        x.innerHTML = "Geolocation is not supported by this browser.";
	    }
	}
	
	function showPosition(position) {
	    var latlon = position.coords.latitude + "," + position.coords.longitude;
	    var img_url = "https://maps.googleapis.com/maps/api/staticmap?center="
	    +latlon+"&zoom=14&size=400x300&key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU";
	    document.getElementById("mapholder").innerHTML = "<img src='"+img_url+"'>";
	} */
	
	
	</script>
	
	
	
	
	
</body>
</html>