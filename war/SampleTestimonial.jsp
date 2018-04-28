<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Alice|Monoton|Roboto+Condensed|Stint+Ultra+Expanded|Vast+Shadow" rel="stylesheet"> 
 <script src="//ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
<title>Sample testimonial Entry</title>
<style>
	nav{
    	padding: 1%;
    }
    .navbar-default{
        background-color: #fff;
        border-color: #fff;
        padding: 1%;
    }
    .navbar-default .navbar-brand{
        color: #1976d2 !important;
    }
    .navbar-header{
        margin-left: 5% !important;
        font-family: 'PT serif', serif;
    }
    .navbar-brand{
        font-size: 35px;
        /* font-weight: bold; */
        font-color: #1976d2 !important;
    }
    .navbar-right{
        margin-right: 5%;
    }
    .navbar-default .navbar-nav > li > a {
        color: #1976d2;
    }
    .nav > li > a{
        padding: 10px 10px;
        font-size: 15px;
       /*  font-weight: bold; */
        /* font-family: 'Open Sans', sans-serif */;
    }
    .btn-default{
        background-color: #1976d2;
        border-color: #1976d2;
        font-weight: bold;
        color: #fff;
    }
    .search{
        /*border: none;*/
        border: 0;
    }
	/*.nav-bar {
    	margin-top: 29px;
	}*/
	ul, nav{
		margin: 0;
		padding: 0;
	}
	.profile_col{
		/*background-color: #dedede;*/
		padding-top: 10%;
		padding-left: 0%;
		width: 25%;
		margin-left: 2%;
	}
	.profile_detail{
		text-align: center;
		padding-top: 30%;
	}
	.testimonial_tagline{
		text-align: center;
    	font-size: 35px;
	    margin-top: 5%;
	}
</style>
</head>
<body>
	<%@ include file="header.jsp" %> 

	
	
	<div class="row">
		<div class="col s4 profile_col">
			<div class="profile_detail">
				<img src="./resources/img/user.png"></br>
				<%-- <h1><%=user.getFirstName() %> <%=user.getLastName() %></h1> --%>
				<h1>ABC</h1>
				<hr style="border-top: 1px solid #c7c7c7;">
				<!-- <p class="desciption">hege ehflw ehwlknw whgwb wghwl wheg gg</p> -->
			</div>
		
		</div>
		<div class="col s8">
			<h3 class="testimonial_tagline">Share Your Experiences with us!<h3>
			<form class="col s8">
		      <div class="row">
		        <div class="input-field col s4">
		          <input id="first_name" type="text" class="validate">
		          <label for="first_name">First Name</label>
		        </div>
		        <div class="input-field col s4">
		          <input id="last_name" type="text" class="validate">
		          <label for="last_name">Last Name</label>
		        </div>
		      </div>
		      <div class="row">
		      	<div class="input-field col s4">
		          <input id="email" type="email" class="validate">
		          <label for="email">Email</label>
		        </div>
		        <div class="input-field col s4">
		          <input id="contact" type="text" class="validate">
		          <label for="contact">Contact</label>
		        </div>
		      </div>
		      <div class="row">
		      	<div class="input-field col s4">
		          <input id="age" type="text" class="validate">
		          <label for="age">Age</label>
		        </div>
		        <div class="input-field col s4">
		          	<select>
				      <option value="Gender" disabled selected>Gender</option>
				      <option value="Male">Male</option>
				      <option value="Female">Female</option>
				    </select>
		        </div>
		      </div>
		      <div class="row">
		      	<div class="input-field col s8">
				    <select>
				      <option value="" disabled selected>Choose your option</option>
				      <option value="1">Option 1</option>
				      <option value="2">Option 2</option>
				      <option value="3">Option 3</option>
				    </select>
				    <label>Materialize Select</label>
				</div>
		      </div>
	      
	    </form>
		
		</div>
	
	</div>
</body>
</html>