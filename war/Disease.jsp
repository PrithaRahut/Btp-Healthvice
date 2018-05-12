<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.btp.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="com.btp.Disease" %>
<%@ page import="com.btp.Testimonial" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.btp.ComparisonOfPathy" %>

<%
	String val = request.getParameter("val");
	log("Disease 1:" +val);
	//log(val);
	Disease d= null;
	try{
		d = Database.getDisease(val);
	}catch(Exception e){
		
	}
	
	System.out.println("Disease 2:" +d.getName());
	log(d.getName());
	List<Testimonial> list = null;
	if(d != null){
		//System.out.println("d is not null!");
		list = Database.getTestimonialByDisease(d.getName());
		
		/* for(Testimonial t:list){
			log("inside for loop");
			log("From testimonial list:" + t.getDiseaseName());
		} */
	}
	HashMap<String, Integer> map = ComparisonOfPathy.comparePathyForDisease(d.getName());
	/* List<HashMap> listmap = ComparisonOfPathy.comparePathyForDisease(d.getName());
	HashMap<String, Integer> map1 = listmap.get(1);		//mapUpvotes
	HashMap<String, Integer> map2 = listmap.get(2);		//mapCount */
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>DISEASES</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
	<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
	<script src="https://www.amcharts.com/lib/3/pie.js"></script>
	<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
	<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
	<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
	<link rel="stylesheet" type="text/css" href="./resources/css/style_home.css">
</head>
<body>
	<div class="container-fluid">
		<!-- Header starts -->
		<%@ include file="header.jsp" %>
		<!-- Header ends -->
		<div class="disease-content" style="margin:100px;">
			<div class="row">
				<div class="col s3">
					<h5><%=d.getName() %></h5>
				</div>
			</div>
			<div class="row">
				<div class="col s12">
					<p><%=d.getDesc() %></p>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col s3">
					<h5>Symptoms</h5>
				</div>
			</div>
			<div class="row">
				<div class="col s12">
					<p><%=d.getSymptoms() %></p>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col s3">
					<h5>Causes</h5>
				</div>
			</div>
			<div class="row">
				<div class="col s12">
					<p><%=d.getCause() %></p>
				</div>
			</div>
			<br>
			<!-- TO CREATE PIE CHART -->
			<div class="row">
				<div class="col s6">
					<h5>Comparison by no. of testimonials for each pathy</h5>
				</div>
			</div>
			<div class="row" id="charts">
                <div class = "col s6">
                    <div id="chartdiv" style="height:300px;"></div>
                </div>
            </div>
            <br>
            <div class="row">
            	<div class="col s3"><h5>Testimonials</h5></div>
            </div>
            <div class="row">
				<div class="col s12">
					<ul class="tabs" id="diseaseTabs">
						<li class="tab col s3"><a class="active" href="#Homeopathy">Homeopathy</a></li>
						<li class="tab col s3"><a href="#Allopathy">Allopathy</a></li>
						<li class="tab col s3"><a href="#Ayurveda">Ayurveda</a></li>
						<li class="tab col s3"><a href="#Naturopathy">Naturopathy</a></li>
					</ul>
				</div>
			</div>
			<div id="Homeopathy">
				<%
					if (list != null) {
				%>
				<%
					for (Testimonial t : list) {
				%>
				<%
					if (t.getPathy().equalsIgnoreCase("Homeopathy")) {
				%>
				<div class="row">
					<div class="col s12">
						<div class="card-panel">
							<span class="card-title"><%=t.getDiseaseName() %>,<%=t.getPathy() %></span>
							<hr>
							<p style="line-height:1.2em; height:3.6em; overflow:hidden;"><%=t.getDetails() %> </p>
                            <p><a href="testimonialDesc.jsp?testimonialId=<%=t.getId()%>"><u>More</u></a></p>
						</div>
					</div>
				</div>

				<%
					}
				%>
				<%
					}
				%>
				<%
					}
				%>
			</div>
			<div id="Allopathy">
				<%
					if (list != null) {
				%>
				<%
					for (Testimonial t : list) {
				%>
				<%
					if (t.getPathy().equalsIgnoreCase("Allopathy")) {
				%>
				<div class="row">
					<div class="col s12">
						<div class="card-panel">
							<span class="card-title"><%=t.getDiseaseName() %>,<%=t.getPathy() %></span>
							<hr>
							<p style="line-height:1.2em; height:3.6em; overflow:hidden;"><%=t.getDetails() %> </p>
                            <p><a href="testimonialDesc.jsp?testimonialId=<%=t.getId()%>"><u>More</u></a></p>
						</div>
					</div>
				</div>

				<%
					}
				%>
				<%
					}
				%>
				<%
					}
				%>	
			</div>
			<div id="Ayurveda">
				<%
					if (list != null) {
				%>
				<%
					for (Testimonial t : list) {
				%>
				<%
					if (t.getPathy().equalsIgnoreCase("Ayurveda")) {
				%>
				<div class="row">
					<div class="col s12">
						<div class="card-panel">
							<span class="card-title"><%=t.getDiseaseName() %>,<%=t.getPathy() %></span>
							<hr>
							<p style="line-height:1.2em; height:3.6em; overflow:hidden;"><%=t.getDetails() %> </p>
                            <p><a href="testimonialDesc.jsp?testimonialId=<%=t.getId()%>"><u>More</u></a></p>
						</div>
					</div>
				</div>

				<%
					}
				%>
				<%
					}
				%>
				<%
					}
				%>
			</div>
			<div id="Naturopathy">
				<%
					if (list != null) {
				%>
				<%
					for (Testimonial t : list) {
				%>
				<%
					if (t.getPathy().equalsIgnoreCase("Naturopathy")) {
				%>
				<div class="row">
					<div class="col s12">
						<div class="card-panel">
							<span class="card-title"><%=t.getDiseaseName() %>,<%=t.getPathy() %></span>
							<hr>
							<p style="line-height:1.2em; height:3.6em; overflow:hidden;"><%=t.getDetails() %> </p>
                            <p><a href="testimonialDesc.jsp?testimonialId=<%=t.getId()%>"><u>More</u></a></p>
						</div>
					</div>
				</div>

				<%
					}
				%>
				<%
					}
				%>
				<%
					}
				%>
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
  	
	var elem7 = document.getElementById('diseaseTabs')
  	var instance7 = M.Tabs.init(elem7, {
  		"duration" : "300"
  	})
  	
	var shouldOpenModal = <%=Boolean.parseBoolean((String)request.getAttribute("openModal"))%>
	if(shouldOpenModal) {
	  	instance_m.open();
	}
</script>
<script type="text/javascript">
var chart = AmCharts.makeChart( "chartdiv", {
      "type": "pie",
      "theme": "light",
      "dataProvider": [ {
        "pathy": "Homeopathy",
        "count": <%=map.get("homeopathy")%>
      }, {
        "pathy": "Allopathy",
        "count": <%=map.get("allopathy")%>
      }, {
        "pathy": "Ayurveda",
        "count": <%=map.get("ayurveda")%>
      }, {
          "pathy": "Naturopathy",
          "count": <%=map.get("naturopathy")%>
        } ],
      "valueField": "count",
      "titleField": "pathy",
       "balloon":{
       "fixedPosition":true
      },
      "export": {
        "enabled": true
      }
    } );
setInterval(function(){
    var element = document.getElementById('chartdiv');
    if(element) {
      var anchor = element.getElementsByTagName('a')[0];
      if(anchor) {
        anchor.style.display = 'none';
      }
    }
  }, 1000, 5);
    
<%-- var chart1 = AmCharts.makeChart( "chartdiv1", {
      "type": "pie",
      "theme": "light",
      "dataProvider": [ {
        "pathy": "Homeopathy",
        "count": <%=map1.get("Homeopathy")%>
      }, {
        "pathy": "Allopathy",
        "count": <%=map1.get("Allopathy")%>
      }, {
        "pathy": "Ayurveda",
        "count": <%=map1.get("Ayurvedic")%>
      } ],
      "valueField": "count",
      "titleField": "pathy",
       "balloon":{
       "fixedPosition":true
      },
      "export": {
        "enabled": true
      }
    } ); --%>

</script>

</html>
