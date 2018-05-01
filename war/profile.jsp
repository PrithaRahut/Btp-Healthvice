<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.btp.User"%>
<%@ page import="com.btp.Database"%>
<%@ page import="com.btp.Testimonial"%>
<%@ page import="com.btp.Recommendation"%>

<%
	User user = (User)request.getSession().getAttribute("user");
	System.out.println("User logged in now:" + user.getFirstName());
	List<Testimonial> list1 = Database.getTestimonialByUser(user.getEmail()); //PREVIOUS TESTIMONIALS ENTERED BY USER
	for(Testimonial t : list1){
		System.out.println(t.getDiseaseName());
	}
	//User uu = (User)request.getSession().getAttribute("user");
	List<Testimonial> list = Recommendation.getLatestTestimonial(request);  //TESTIMONIALS RECOMMENDED TO USER
	System.out.println("In following.jsp:" + list.size());
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SAmple profile</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="./resources/css/style_home.css">
</head>
<body>
	<div class="container-fluid">
		<!-- Header starts -->
		<%@ include file="header.jsp"%>
		<!-- Header ends -->
		<div class="row">
			<div class="col s3">
				<img src="./profile.png"
					style="height: 150px; width: 150px; border-radius: 50%; display: block; margin-left: auto; margin-right: auto; margin-top: 45px;">
				<p style="text-align: center; font-size: 20px;"><%=user.getFirstName() %>
					<%=user.getLastName() %></p>

			</div>
			<div class="col s9">
				<div class="row">
					<div class="col s12">
						<ul class="tabs" id="profileTabs" style="margin-bottom: 8px; margin-top: 50px; margin-right: 40px;">
							<li class="tab col s6"><a class="active" href="#testimonialForm">You</a></li>
							<li class="tab col s6"><a href="#Recommended">Recommended</a></li>
						</ul>
					</div>
				</div>
				<div id="testimonialForm">
					<form class="col s12" style="margin-right: 50px;"
						action="/TestimonialEntry" method="post" enctype="multipart/form-data">
						<div class="row">
							<div class="input-field col s12">
								<input id="name" type="text" class="validate" name="name">
								<label for="name">Name of the Patient</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="email1" type="email" class="validate" name="email">
								<label for="email1">Email of the Patient</label>
							</div>
							<div class="input-field col s6">
								<input id="contact" type="text" class="validate" name="contact">
								<label for="contact">Contact of the Patient</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="age" type="text" class="validate" name="age">
								<label for="age">Age of the Patient</label>
							</div>
							<div class="input-field col s6">
								<select class="select3" name="gender">
									<option value="gender" disabled selected>Gender</option>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="disease" type="text" class="validate" name="disease"> 
								<label for="disease">Disease</label>
							</div>
							<div class="input-field col s6">
								<select class="select2" name="pathy">
									<option value="treatment" disabled selected>Treatment</option>
									<option value="homeopathy">Homeopathy</option>
									<option value="allopathy">Allopathy</option>
									<option value="ayurveda">Ayurveda</option>
									<option value="naturopathy">Naturopathy</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s12">
								<textarea id="textarea1" class="materialize-textarea" name="details"></textarea>
								<label for="textarea1">Details</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s12">
								<div class="file-field input-field">
									<div class="btn">
										<span>Upload File</span> <input type="file" name="file" id="file">
									</div>
									<div class="file-path-wrapper">
										<input class="file-path validate" type="text">
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col s4 offset-s4" style="text-align: center;">
								<button class="waves-effect waves-light btn" type="submit" name="action" style="width: 150px; color: #ffffff; background-color: ##00bfa5;">SUBMIT</button>
							</div>
						</div>

					</form>
					<h4>Shared by You</h4>
					<hr style="background-color: #1de9b6; border-color: #1de9b6;">
					<div class="row">
						<div class="col s12">
							<div class="card-panel" style="background-color: #a7ffeb;">
								<span class="card-title">Arthiritis and frequent cold,HOMEOPATHY</span>
								<hr>
								<p>
									She was suffering with pain in inter-phalangeal joints of hands
									and metatarsal joints of feet since last two years. She would
									have severe continuous pain daily...&nbsp;&nbsp;<a href="#">More</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div id="Recommended">
					<div class="row">
						<div class="col s12">
							<div class="card-panel" style="background-color: #a7ffeb;">
								<span class="card-title">Arthiritis and frequent cold,HOMEOPATHY</span>
								<p>
									She was suffering with pain in inter-phalangeal joints of hands
									and metatarsal joints of feet since last two years. She would
									have severe continuous pain daily...&nbsp;&nbsp;<a href="#">More</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
</body>
<script type="text/javascript">
	var elem1 = document.querySelector('.modal');
  	var instance1 = M.Modal.init(elem1, {
  		"dismissible" : "true",
  		"opacity" : "0.5"
  	});
  	var elem2 = document.querySelector('.tabs');
  	var instance2 = M.Tabs.init(elem2, {
  		"duration" : "300"
  	})
  	var elem3 = document.querySelector('.datepicker');
  	var instance3 = M.Datepicker.init(elem3,{
  		"format" : "dd/mm/yyyy"
  	})
  	var elem4 = document.querySelector('.dropdown-trigger');
  	var instance4 = M.Dropdown.init(elem4,{
  		"alignment" : "bottom",
  		"autoTrigger" : "true",
  		"coverTrigger" : "false",
  		"hover" : "true"
  	})
  	var elem5 = document.querySelector('.select');
  	var instance5 = M.FormSelect.init(elem5, {});

  	var elem6 = document.querySelector('.select2');
  	var instance6 = M.FormSelect.init(elem6, {});

  	var elemg = document.querySelector('.select3');
  	var instanceg = M.FormSelect.init(elemg, {});
  	// var elem7 = document.querySelector('.tabs1');
  	// var instance7 = M.Tabs.init(elem7, {
  	// 	"duration" : "300"
  	// })
  	var elem7 = document.getElementById('profileTabs')
  	var instance7 = M.Tabs.init(elem7, {
  		"duration" : "300"
  	})
</script>
</html>