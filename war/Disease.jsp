<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.btp.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="com.btp.Disease" %>
<%@ page import="com.btp.Testimonial" %>

<%
	String val = request.getParameter("val");
	//System.out.println("Disease 1:" +val);
	//log(val);
	Disease d = Database.getDisease(val);
	//System.out.println("Disease 2:" +d.getName());
	//log(d.getName());
	List<Testimonial> list = null;
	if(d != null){
		list = Database.getTestimonialByDisease(d.getName());
		for(Testimonial t:list){
			System.out.println("From testimonial list:" + t.getDiseaseName());
		}
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>disease.html</title>
<meta charset="utf-8">

<!--<link rel="stylesheet" href="CSS/style.css">-->
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

    .content_column{
        /*background-color: #c7c7c7;*/
        margin-left: 3%;
        width: 13%;
    }
    .open-book{
        transform: rotate(-5deg); 
        margin-bottom: 2%;
    }
    .content_column2{
        border-left: 1px solid #cfcfcf;
        height: 1650px;
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
    .col-xs-1{
        width: 2%;
    }
    .col-xs-9{
        width: 75%;
    }
    .row{
        margin-left: 0px !important;
        margin-right: 0px !important;
    }
    .col-xs-9 h1{
        font-weight: bold;
        font-family: 'Open Sans';
        color: #508AA8;
        font-size: 45px;
    }
    .col-xs-4{
        width: 47%;
    }
</style>

</head>
<body>
<%@ include file="header.jsp" %>
<div class="content">
    <div class="row" style="margin-top: 9%; margin-bottom: 5%;">
        <div class="col-xs-2 content_column">
            <img src="./resources/img/notebook.png" alt="book" class="open-book">
            <p>Advices that matters!</p>
            <hr>
            <a href="#definition"><p><%=d.getName() %></p></a>
            <a href="#symptoms"><p>Symptoms</p></a>
            <a href="#cause"><p>Cause</p></a>
            <a href="testimonial"><p>Latest Testimonials</p></a>
        </div>
        <div class="col-xs-1 content_column2">
        </div>
        <div class="col-xs-9">
            <div class="row" id="definition" style="margin-bottom: 5%;">
                <h1><%=d.getName() %></h1>
                <hr>
             	<p><%=d.getDesc() %></p>
            </div>
            <div class="row" id="symptoms"  style="margin-bottom: 5%;">
                <h1>Symptoms</h1>
                <hr>
               	<p><%=d.getSymptoms() %></p>   
            </div>
            <div class="row" id="cause"  style="margin-bottom: 5%;">
                <h1>Causes</h1>
                <hr>
                <p><%=d.getCause() %></p>
            </div>
            <div class="row" id="testimonials"  style="margin-bottom: 5%;">
                <h1>Latest Testimonials</h1>
                <hr>
               <!--  <div class="row">
                    <div class="col-xs-4">
                        <div class="card_testimonial">
                            <div class="text_testimonial">
                                <h4>Disease Name</h4>
                                <p><b>Name: MONIKA SINGH(Changed)</b></p>
                                <p><b>Age: 25</b></p>
                                <p><b>Sex: Female</b></p>
                                <p>He had been suffering from asthma for about six months. He complained of breathlessness, palpitation and nasal blockage. Additionally, he was suffering from hyperacidity and indigestion. He had no family history of asthma nor was he suffering from blood pressure or blood sugar..<a href="more"><u>More</u></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-4" style="margin-left: 5%;">
                        <div class="card_testimonial">
                            <div class="text_testimonial">
                                <h4>Disease Name</h4>
                                <p><b>Name: MONIKA SINGH(Changed)</b></p>
                                <p><b>Age: 25</b></p>
                                <p><b>Sex: Female</b></p>
                                <p>He had been suffering from asthma for about six months. He complained of breathlessness, palpitation and nasal blockage. Additionally, he was suffering from hyperacidity and indigestion. He had no family history of asthma nor was he suffering from blood pressure or blood sugar..<a href="more"><u>More</u></a></p>
                            </div>
                        </div>
                    </div>
                </div> -->
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
</div>

</body>
</html>
