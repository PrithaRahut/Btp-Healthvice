<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.btp.Testimonial" %>
<%@ page import="com.btp.Database" %>
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
	if(t.getUserUpvote().isEmpty() == false){
		numOfLikes = t.getUserUpvote().size();
		if(t.getUserUpvote().contains(uu.getEmail()) == true){
			isLikedByUser = true;
		}
	}
	if(t.getUserDownvote().isEmpty() == false){
		numOfDislikes = t.getUserDownvote().size();
		
		if(t.getUserDownvote().contains(uu.getEmail()) == true){
			isDislikedByUser = true;
		}
	}
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <link rel="stylesheet" href="./resources/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <style>
    .card {
      margin: 8px;
      border: 1px solid #eee;
      box-shadow: 1px 2px 1px grey;
    }
    .vote-btn {
      background-color: #0171d4;
      color: white;
    }
    .vote-btn.active {
      background-color: green;
    }
  </style>
  </head>

  <body>
    <%@ include file="header.jsp" %>
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <p>&nbsp;</p>
        </div>
        <div class="col-sm-12">
          <div class="row card">
            <div class="col-sm-12">
              <div class="row">
                <div class="col-sm-8">
                  <h4><%=t.getDiseaseName() %> (<%= t.getPathy() %>)</h4>
                </div>
               <%--  <div class="col-sm-4">
                  <h5 class="text-right"><%= DATE:TIME %></h5>
                </div> --%>
              </div>
              <div class="row">
                <div class="col-sm-12">
                  <p>
                    <%=t.getName() %><br/>
                    <%=t.getAge() %><br/>
                    <%=t.getSex() %><br/>
                  </p>
                </div>
                <div class="col-sm-12">
                  <p>
                    <%=t.getDetails() %>
                  </p>
                </div>
                <div class="col-sm-12">
                  <hr/>
                </div>
                <div class="col-sm-12">
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
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <script type="text/javascript">
    var testimonialId = <%= testimonialId %>;
    var isLikedByUser = <%= isLikedByUser %>;
    var isDislikedByUser = <%= isDislikedByUser %>;
    var numOfLikes = <%= numOfLikes %>;
    var numOfDislikes = <%= numOfDislikes %>;
    $("#like-btn").click(function(){
      $.ajax({url: "http://localhost:8888/UpvoteDownvote?likedByUser=true&tid=" + testimonialId, success: function(result){
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
      $.ajax({url: "http://localhost:8888/UpvoteDownvote?disLikedByUser=true&tid=" + testimonialId, success: function(result){
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
</html>
