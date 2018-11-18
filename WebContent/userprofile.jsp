<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Shelter Seekers User Profile Page</title>
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
		</style>
</head>
<body>
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
	      <li class="active"><a href="#">Profile</a></li>
	    </ul>
	     <ul class="nav navbar-nav navbar-right">
        	<li><a class="navbar-brand" href="signin.jsp">Sign Out</a></li>
      	</ul>
	  </div>
	</nav>
	<div class="container-fluid"> 
		<div class="col-sm-6">
			<img class="img-fluid img-circle center" alt="Responsive image" id="pic" src="http://www-scf.usc.edu/~csci201/images/jeffrey_miller.jpg" 
				style="margin-top: 20px;  display: block; margin-left: auto; margin-right: auto;  height: 150px; width: 150px;">
			<h3>Contact Information</h3><br>
			Username: <br>
			Email: <br>
			<button  class="btn btn-md btn-default"  id="user_secrity" onclick="userSettings();" >Update Settings</button>
		</div>
		<div class="col-sm-6">
		
			<h3>User Preferences</h3>
			Pets: <br>
			Children: <br>
			Proximity to Resources: <br>
			Pharmacys: <br>
			Grocery Stores: <br>
			Laundromats: <br>
		</div>

	</div>
	<footer class="container-fluid text-center">
	  <p> © 2018 Safe Hands </p>
	</footer>
	
	
	<script>
	function userSettings(){
		location.href="usersettings.jsp";
	}
	</script>
</body>
</html>