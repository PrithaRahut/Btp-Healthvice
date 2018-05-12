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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/css/style_home.css">

</head>
<body>
<%@ include file="header.jsp" %>
<div style="margin:40px;">
		<%
			if (testimonials != null) {
		%>
		<%
			for (Testimonial t : testimonials) {
		%>
		<div class="row">
			<div class="col s12">
				<div class="card-panel">
					<span class="card-title"><b><a href="testimonialDesc.jsp?testimonialId=<%=t.getId()%>"
							style="color: #00bfa5;"><%=t.getDiseaseName()%>,<%=t.getPathy()%></a></b></span>
					<hr>
					<p style="line-height: 1.2em; height: 3.6em; overflow: hidden;">
						<%=t.getDetails()%>
					</p>
				</div>
			</div>
		</div>
		<%
			}
		%>
		<%
			}
		%>

	</div>


<%@ include file="footer.jsp" %>
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
  	
	var elem7 = document.getElementById('diseaseTabs')
  	var instance7 = M.Tabs.init(elem7, {
  		"duration" : "300"
  	})
  	
	var shouldOpenModal = <%=Boolean.parseBoolean((String)request.getAttribute("openModal"))%>
	if(shouldOpenModal) {
	  	instance_m.open();
	}
</script>
</html>