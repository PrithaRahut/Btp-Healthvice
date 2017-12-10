<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.btp.Testimonial" %>
<%@ page import="com.btp.IndexingWrapper" %>
<%@ page import="com.btp.IndexingWrapper.SearchResult" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
		String searchterm = request.getParameter("searchterm");
		
		Iterable<Testimonial> testimonials = null ;
		if(searchterm!=null && searchterm.length() > 0){
		
			SearchResult<Testimonial> result = IndexingWrapper.searchTestimonial(searchterm);
		   // allShown = result.getNumberFound() == result.getNumberReturned();
		    testimonials = result;
		}
		/* request.setAttribute("testimonials", testimonials);
		RequestDispatcher req = request.getRequestDispatcher("SearchResult.jsp");
		req.forward(request, response); */
%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Search Result</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=PT+Serif|Bitter|Bubblegum+Sans|Open+Sans" rel="stylesheet">
<link rel="stylesheet" href="./resources/css/style.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<style>
.col-xs-12{
  width: 85%;
}
.card_testimonial{
    width: 103% !important;
    box-shadow: 2px 2px 2px 2px grey;
    /*padding-top: 6%;*/
    margin-top: 10%;
    margin-top: 8%;
    margin-left: 7%;
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
<body>
<%@ include file="header.jsp" %>

<div class="content">        
  <div class="col-xs-12">
  <% for(Testimonial t:testimonials){ %>
    <div class="row" style="margin-left: 0px !important; margin-right: 0px !important;">
      <div class="card_testimonial">
        <div class="text_testimonial">
          <h4><%=t.getDiseaseName() %></h4>
            <p><b>Name: <%=t.getName() %></b></p>
            <p><b>Age: <%=t.getAge() %></b></p>
            <p><b>Sex: <%=t.getSex() %></b></p>
            <p style="line-height:1.2em; height:3.6em; overflow:hidden;"><%=t.getDetails() %> </p>
			<p><a href="more"><u>More</u></a></p>
        </div>
      </div>
    </div>
    <%} %>
  </div>
</div>
</body>
</html>