<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HOME</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
	<link rel="stylesheet" type="text/css" href="./resources/css/style_home.css">
</head>
<body>
	<div id="fb-root"></div>
	<script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.12&appId=1221013798030224&autoLogAppEvents=1';
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script>

	<div class="container-fluid">
		<!-- Header starts -->
		<%@ include file="header.jsp" %>
		<!-- Header ends -->
		<div id="landing" class="col s12">
			<div id="landing-content">
				<p><h2>Your personal wikipedia for health tips</h2></p>
				<a class="btn-flat learnMoreButton" href="#aboutus">Learn More</a>
			</div>
		</div>
		<div id="aboutus" class="col s12">
			<div class="row">
				<div class="col s8">
					<h4>About Us</h4>
					<hr style="background-color: #1de9b6; border-color: #1de9b6;">
					<p>Health-Vise is the one stop solution website for the common people focused on the review based result and experiences shared by common man. Website contains all the major diseases with proper numbering and direct links access from the main home page along with the remedial by different methodology to cure it. Website mainly is designed in such a way so as ease the access by all age group by just one click.</p>
		            <p>It contains genuine reviews and experiences personally verified by our team. We aim to serve as much as common people we can and make them aware of the major diseases and its cure.</p>
		            <p>We also aim to collect the reviews and experiences shared by common people and use them to make others aware about their journey to successfully fight against the diseases. We hereby wants everyone to get informed about the different process and methodology practiced around the  world to fight against the disease.</p>
				</div>
			</div>
		</div>
		<div id="share" class="col s12">
			<div id="share-content">
				<p><h2>Share your experience with others.</h2></p>
				<a class="btn-flat addTestimonialbtn" href="TestimonialServlet">Add Testimonial</a>	
			</div>
			<!-- <div class="row">
				<div id="content" class="col s6">
					<p>Some content..</p>
					<p>Some content..</p>
					<p>Some content..</p>	
				</div>
				<div id="addTestimonial" style="position: relative;" class="col s6">
					<a class="btn-flat addTestimonialbtn" href="#" style="position: absolute;">Add Testimonial</a>
				</div>
			</div> -->
		</div>
		<div id="recent-story" class="col s12">
			<h4>Recent Stories</h4>
			<hr style="background-color: #1de9b6; border-color: #1de9b6;">
			<div class="row" style="padding-top:50px;">
				<div class="col s4">
					<div class="story-section">
						<div class="story-content">
						<p><b>Arthiritis and frequent cold, HOMEOPATHY &nbsp; &nbsp;</b>She was suffering with pain in inter-phalangeal joints of hands and metatarsal joints of feet since last two years. She would have severe continuous pain daily...&nbsp;&nbsp;<a href="#">More</a></p>	
						<img src=".resources/css/profile.png" style="height: 50px; width: 50px; border-radius: 50%; float: left;">					
						</div>
						<!-- <div class="story-info">
							<img src="./profile.png" style="height: 50px; width: 50px; border-radius: 50%; float: left;">
							<span style="font-size: 20px;">  Mrs. Guha</span>
						</div> -->
						
					</div>
					
				</div>
				<div class="col s4">
					<div class="story-section">
						<div class="story-content">
						<p><b>Arthiritis and frequent cold, HOMEOPATHY &nbsp; &nbsp;</b>She was suffering with pain in inter-phalangeal joints of hands and metatarsal joints of feet since last two years. She would have severe continuous pain daily...&nbsp;&nbsp;<a href="#">More</a></p>	
						<img src=".resources/css/profile.png" style="height: 50px; width: 50px; border-radius: 50%; float: left;">				
						</div>
						
						
					</div>
					
					
				</div>
				<div class="col s4">
					<div class="story-section">
						<div class="story-content">
						<p><b>Arthiritis and frequent cold, HOMEOPATHY &nbsp; &nbsp;</b>She was suffering with pain in inter-phalangeal joints of hands and metatarsal joints of feet since last two years. She would have severe continuous pain daily...&nbsp;&nbsp;<a href="#">More</a></p>
						<img src=".resources/css/profile.png" style="height: 50px; width: 50px; border-radius: 50%; float: left;">						
						</div>
						
					</div>
					
					
				</div>
			</div>
			<div class="row">
				<div class="col s4">
					
				</div>
				<div class="col s4" style="text-align: center;">
					<a href="#" style="font-size: 20px; color: black;">Read More</a>
					<hr style="width: 200px; background-color: #1de9b6; border-color: #1de9b6;">
				</div>
				
			</div>
			
		</div>
		<%@ include file="footer.jsp" %>
	</div>

</body>
<script type="text/javascript">

	var elem_m = document.querySelector('.modal');
  	var instance_m = M.Modal.init(elem_m, {
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
  	
	var shouldOpenModal = <%=Boolean.parseBoolean((String)request.getAttribute("openModal"))%>
	if(shouldOpenModal) {
	  	instance_m.open();
	}
</script>

<!-- FB Login -->

<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1221013798030224',
      cookie     : true,
      xfbml      : true,
      version    : 'v2.12'
    });
      
    FB.AppEvents.logPageView();   
      
  };

  if (false) {

	  FB.getLoginStatus(function(response) {
	      statusChangeCallback(response);
	  });
  }
</script>
</html>