<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.btp.User" %>
<%@ page import="com.btp.Testimonial" %>
<%@ page import="com.btp.Recommendation" %>
<%
	User uu = (User)request.getSession().getAttribute("user");
	List<Testimonial> list = Recommendation.getLatestTestimonial(request);
	System.out.println("In following.jsp:" + list.size());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/style.css">
 <script src="//ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
		<%@ include file="header.jsp" %>
		<div class="row" style="margin-bottom: 10%; margin-top: 7%;">
				<div class="col-xs-4" style="width: 25%;">
				</div>
				<div class="col-xs-8">
				<%if(list!=null && !list.isEmpty()){ %>
				<%for(Testimonial t:list) {%>
					<div class="row" style="margin-left: 0px !important; margin-right: 0px !important;">
						<div class="card_testimonial">
							<div class="text_testimonial">
								<h4><%=t.getDiseaseName() %></h4>
								<p><b><%=t.getPathy() %></b></p>
								<p><b><%=t.getUserEmail() %></b></p>
								<p style="line-height:1.2em; height:3.6em; overflow:hidden;"><%=t.getDetails() %> </p>
								<p><a href="testimonialDesc.jsp?testimonialId=<%=t.getId()%>"><u>More</u></a></p>
							</div>
						</div>
					</div>
					<%} %>
					<%} else { %>
					<p>No recent testimonials found!</p>
					<%} %>
					
				</div>
			</div>

</body>
</html>