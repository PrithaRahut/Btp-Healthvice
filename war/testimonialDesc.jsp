<%@page import="com.oreilly.servlet.Base64Encoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.btp.User" %>
<%@ page import="com.btp.Testimonial" %>
<%@ page import="com.btp.Database" %>
<%@ page import="com.btp.CloudStorageHelper" %>
<%
	User uu = (User)request.getSession().getAttribute("user");
	boolean isLikedByUser = false;
	boolean isDislikedByUser = false;
	int numOfLikes = 0;
	int numOfDislikes = 0;
	String testimonialId = request.getParameter("testimonialId");
	System.out.println("In testimonial Description:" + testimonialId);
	Testimonial t = Database.getTestimonialById(Long.parseLong(testimonialId));
	System.out.println("In testimonialDesc.jsp:" + t.getDiseaseName());
	if(t.getUserUpvote() != null && !t.getUserUpvote().isEmpty()){
		numOfLikes = t.getUserUpvote().size();
		if(t.getUserUpvote().contains(uu.getEmail()) == true){
			isLikedByUser = true;
		}
	}
	if(t.getUserDownvote() != null && !t.getUserDownvote().isEmpty()){
		numOfDislikes = t.getUserDownvote().size();
		
		if(t.getUserDownvote().contains(uu.getEmail()) == true){
			isDislikedByUser = true;
		}
	}
	System.out.println("Processing done till here!");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Testimonial</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
	<link rel="stylesheet" type="text/css" href="./resources/css/style_home.css">
</head>
<body>
	<div class="container-fluid">
		<!-- Header starts -->
		<%@ include file="header.jsp"%>
		<!-- Header ends -->

		<div id="content" style="margin: 100px;">
			<div class="row">
				<div class="col s3">
					<p style="color: grey; font-size: 15px;">Testimonial ID</p>
					<h6><a href="#"><%=t.getYear() %></a>/<a href="#"><%=t.getDiseaseName() %></a>/<%=t.getId() %></h6>
				</div>
			</div>
			<div class="row">
				<div class="col s3">
					<p style="color: grey; font-size: 15px;">Name</p>
					<h4><%=t.getName() %></h4>
				</div>
				<div class="col s3">
					<p style="color: grey; font-size: 15px;">Age</p>
					<h4><%=t.getAge() %></h4>
				</div>
			</div>
			<div class="row">
				<div class="col s3">
					<p style="color: grey; font-size: 15px;">Disease</p>
					<h4><%=t.getDiseaseName() %></h4>
				</div>
				<div class="col s3">
					<p style="color: grey; font-size: 15px;">Treatment</p>
					<h4><%=t.getPathy() %></h4>
				</div>
			</div>
			<div class="row">
				<div class="col s12">
					<p><%=t.getDetails() %></p>
				</div>
			</div>
			<%
				if (t.getFileName() != null && !t.getFileName().isEmpty()) {
					Byte[] fileBytes = CloudStorageHelper.getFile(t.getFileName());
					byte[] bytes = new byte[fileBytes.length];
					int j = 0;
					for (Byte b : CloudStorageHelper.getFile(t.getFileName()))
						bytes[j++] = b.byteValue();
					String base64 = Base64Encoder.encode(bytes);
					String imgUrl = String.format("data:image/jpg;base64,%s", base64);
				
			%>
			<div class="row">
				<div class="col s12">
					<img src="<%=imgUrl%>">
				</div>
			</div>
			<%} %>
			<div class="row">
				<!-- <div class="col s3">
				
				</div>
				<div class="col s3">
				
				</div> -->
				<button class='btn vote-btn <%= isLikedByUser ? "active" : "" %>' id="like-btn">
                    <%= isLikedByUser ? "Liked" : "Like" %>&nbsp;
                    <span class="badge" id="numOfLikes"><%= numOfLikes %></span>
                  </button>
                  <button class='btn vote-btn <%= isDislikedByUser ? "active" : "" %>' id="dislike-btn">
                    <%= isDislikedByUser ? "Disliked" : "Dislike" %>&nbsp;
                    <span class="badge" id="numOfDislikes"><%= numOfDislikes %></span>
                  </button>
			</div>
		</div>

		<%@ include file="footer.jsp"%>
	</div>
</body>
  <script type="text/javascript">
    var testimonialId = <%= testimonialId %>;
    var isLikedByUser = <%= isLikedByUser %>;
    var isDislikedByUser = <%= isDislikedByUser %>;
    var numOfLikes = <%= numOfLikes %>;
    var numOfDislikes = <%= numOfDislikes %>;
    $("#like-btn").click(function(){
      $.ajax({url: "http://localhost:8888/UpvoteDownvote?likedByUser=true&tid=" + testimonialId, type:"POST", success: function(result){
        if (isLikedByUser) {
          // if the testimonial was earlier liked by user then remove it
          isLikedByUser = false;
          numOfLikes--;
          $("#like-btn").removeClass("active");
        } else {
          isLikedByUser = true;
          numOfLikes++;
          $("#like-btn").addClass("active");
        }
        $("#numOfLikes").html(numOfLikes);
      }});
    });
    $("#dislike-btn").click(function(){
      $.ajax({url: "http://localhost:8888/UpvoteDownvote?disLikedByUser=true&tid=" + testimonialId, type:"POST", success: function(result){
        if (isDislikedByUser) {
          // if the testimonial was earlier liked by user then remove it
          isDislikedByUser = false;
          numOfDislikes--;
          $("#dislike-btn").removeClass("active");
        } else {
          isDislikedByUser = true;
          numOfDislikes++;
          $("#dislike-btn").addClass("active");
        }
        $("#numOfDislikes").html(numOfDislikes);
      }});
    });
  </script>
  
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

</html>
