<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.btp.User" %>
<%@ page import="com.btp.Database" %>
<%@ page import="com.btp.Testimonial" %>
    
<%
	User user = (User)request.getSession().getAttribute("user");
	System.out.println("User logged in now:" + user.getFirstName());
	List<Testimonial> list = Database.getTestimonialByUser(user.getEmail());
	for(Testimonial t : list){
		System.out.println(t.getDiseaseName());
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Testimonial.html</title>
<meta charset="utf-8">

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Alice|Monoton|Roboto+Condensed|Stint+Ultra+Expanded|Vast+Shadow" rel="stylesheet"> 
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
        color: #247ba0 !important;
    }
    .navbar-header{
        margin-left: 5% !important;
        font-family: 'PT Serif', serif;
    }
    .navbar-brand{
        font-size: 35px;
        font-weight: bold;
        font-color: #247ba0 !important;
    }
    .navbar-right{
        margin-right: 5%;
    }
    .navbar-default .navbar-nav > li > a {
        color: #247ba0;
    }
    .nav > li > a{
        padding: 10px 10px;
        font-size: 15px;
        font-weight: bold;
    }
    .btn-default{
        background-color: #247ba0;
        border-color: #247ba0;
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
	.profile{
		background-color: #e8fbf2;
	}
	.top-header{
		background-color: #a4a4ff;
	}
	.footer_healthvise a{
		text-decoration: none;
	}
	.footer_row{
		padding-top: 1%;
		padding-bottom: 1%;
	}
	.footer-para{
		margin-left: 7%;
	}
	.container-fluid{
		padding-left: 0px;
		padding-right: 0px;
	}
	.profile_col{
		/*background-color: #dedede;*/
		padding-top: 4%;
		padding-left: 0%;
		width: 25%;
		margin-left: 2%;
	}
	.profile_detail{
		text-align: center;
	}
	hr{
		margin-right: 15%;
		margin-left: 15%;
	}
	.desciption{
		padding: 0px 50px;
	}
	
	.testimonial_card{
		box-shadow: 2px 2px 2px grey;
	}
	.form_card{
		margin: 7% 10%;
	}
	.testimonial_tagline{
		text-align: center;
    	font-size: 35px;
	    margin-top: 5%;
	}
	label{
		font-size: 16px;
	}
	.gender{
		font-size: 20px;
	}
	select{
		font-size: 15px;
	}
	textarea{
		width: 685px;
		height: 154px;
	}
	.card_testimonial{
		width: 103% !important;
		box-shadow: 2px 2px 2px 2px grey;
		/*padding-top: 6%;*/
		margin-top: 10%;
		margin-left: 2%;
		background-color: #Fff;
	}
	.text_testimonial{
		padding: 3%;
	}
	.row{
		margin-left: 0px !important;
		margin-right: 0px !important;
	}


</style>
</head>
<%@ include file="header.jsp" %>
	<section class="profile">
		<div class="content">
		<div class="container-fluid">
			<div class="row" style="margin-left: 0px !important; margin-right: 0px !important; margin-top: 10%;">
				<div class="col-xs-4 profile_col">
					<div class="profile_detail">
						<img src="./resources/img/user.png"></br>
						<h1><%=user.getFirstName() %> <%=user.getLastName() %></h1>
						<hr style="border-top: 1px solid #c7c7c7;">
						<!-- <p class="desciption">hege ehflw ehwlknw whgwb wghwl wheg gg</p> -->
					</div>
				</div>
				<div class="col-xs-8 testimonial_card">
					<div class="row">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#">YOU</a></li>
							<li><a href="following">FOLLOWING</a></li>
						</ul>
					</div>
					<div class="row">
						<h3 class="testimonial_tagline">Share Your Experiences with us!<h3>
						<div class="form form_card">
							<form action="/TestimonialEntry" method="post">
								<div class="form-group">
									<label for="name">Name:</label>
									<input type="text" class="form-control" id="name" placeholder="Enter your Full Name" name="name">
								</div>
								<div class="form-group">
									<label for="email">Email*:</label>
									<input type="text" class="form-control" id="email" placeholder="Enter your Email Address" name="email" required>
								</div>
								<div class="form-group">
									<label for="age">Age*:</label>
									<input type="text" class="form-control" id="age" placeholder="Enter your age" name="age" required>
								</div>
								<div class="form-group">
									<label for="contact">Contact No:</label>
									<input type="text" class="form-control" id="contact" placeholder="Enter your contact number" name="contact">
								</div>
								<div class="form-group">
									<label for="name">Sex*:</label></br>
									<input type="radio" id="gender" name="gender" value="male" checked><span class="gender">&nbsp;Male</span>
									<input type="radio" id="gender" name="gender" value="Female"><span class="gender">&nbsp;Female</span>
									<input type="radio" id="gender" name="gender" value="other"><span class="gender">&nbsp;Other</span>
								</div>
								<div class="form-group">
									<label for="diseases">Disease*: &nbsp;&nbsp;</label>
									<input type="text" class="form-control" id="disease" placeholder="Enter Disease" name="disease">
									<label for="diseases">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Healthcare Treatments*: &nbsp;&nbsp;</label>
									<select name="pathy">
										<option value="Homeopathy">Homeopathy</option>
										<option value="Allopathy">Allopathy</option>
										<option value="Ayurvedic">Ayurvedic</option>
										<option value="others">Others</option>
									</select>
								</div>
								<div class="form-group">
									<label for="Details">Details*:</label>
									<textarea class="form-control" rows="5" id="details" name="details">
									</textarea>
								</div>
								<div class="form-group">
									<label for="additional-info">Additional Info:</label>
									<textarea class="form-control" rows="5" id="additional-info" name="addInfo">
									</textarea>
								</div>
								<div class="form-group">
									   <button type="submit" class="button button-block"/>Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="margin-bottom: 10%;">
				<div class="col-xs-4" style="width: 25%;">
				</div>
				<div class="col-xs-8">
				<%if(list!=null){ %>
				<%for(Testimonial t:list) {%>
					<div class="row" style="margin-left: 0px !important; margin-right: 0px !important;">
						<div class="card_testimonial">
							<div class="text_testimonial">
								<h4><%=t.getDiseaseName() %></h4>
								<p><b><%=t.getPathy() %></b></p>
								<p style="line-height:1.2em; height:3.6em; overflow:hidden;"><%=t.getDetails() %> </p>
								<p><a href="more"><u>More</u></a></p>
							</div>
						</div>
					</div>
					<%} %>
					<%} %>
					
				</div>
			</div>
		</div>
	</div>
	</section>
	<!--<footer class="footer_healthvise" style="background-color: #a4a4ff; margin-top: 10%;">
		<div class="container">
			<div class="row footer_row" >
				<div class="col-xs-6 footer-para">
					<p>&copy; All Right Reserved</p>
				</div>
				<div class="col-xs-6 footer_fa_icons">
					<a href=""><i class="fa fa-facebook"></i></a>
					<a href=""><i class="fa fa-twitter"></i></a>
					<a href=""><i class="fa fa-instagram"></i></a>
				</div>
			</div>
		</div>
	</footer>-->

</body>
</html>

