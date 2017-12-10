<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.btp.Testimonial" %>
<%@ page import="com.btp.IndexingWrapper" %>
<%@ page import="com.btp.IndexingWrapper.SearchResult" %>
<%
	/* String searchterm = request.getParameter("searchterm");
	Iterable<Testimonial> testimonials = null ;
	if(searchterm!=null && searchterm.length() > 0){
	
		SearchResult<Testimonial> result = IndexingWrapper.searchTestimonial(searchterm);
       // allShown = result.getNumberFound() == result.getNumberReturned();
        testimonials = result;
	} */

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>INDEX</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/slider1.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flexslider/2.6.4/flexslider.css1">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=PT+Serif|Bitter|Bubblegum+Sans|Open+Sans" rel="stylesheet">
<!--<script src="js/jquery.js"></script>-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--<script src="js/jquery.flexslider-min.js"></script>-->
<script src="./resources/js/kwiks.js"></script>
<style type="text/css">
    /*navbar*/
    nav{
    	padding: 1%;
    }
    .navbar-default{
        background-color: #fff;
        border-color: #fff;
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
    /*navbar ends here */
    .main{
        margin-top: 10%;
        background-color: #fff;
    }
    .content{
        padding-bottom: 75px;
    }
    .content_heading{
        text-align: center;
        color: #247ba0;
        font-family: 'PT-Sans';
        font-weight: bold;
        margin-top: 6%;
        font-size: 48px;
        margin-bottom: 0%;
    }
    .col-xs-8{
        width: 54.9%;
    }
    .col-xs-4{
        width: 35%;
        left: 5%;
    }
    a.donate {
        font: 600 26px/26px 'Open Sans', sans-serif;
        color: #fff;
        display: block;
        margin-top: 3px;
        text-align: center;
        padding: 15px 0 17px;
        text-transform: uppercase;
        background-color: #70c1b3;
        box-shadow: 0px 0px 0px transparent;
        text-decoration: none;
        outline: none;
        border-radius: 3%;
    }
    a.donate:hover {
        position: relative;
        box-shadow: 3px 3px 5px #555;
    }
    .flex-caption{
        background-color: #70c1b3;
    }
    .flex-caption.c2 {
        background-color: #247ba0;
    }

    .text1 {
        padding-top: 23px;
        margin-bottom: 23px;
        font: 300 30px/30px 'Bubblegum', sans-serif;
        color: #247ba0 !important;
        line-height: 33px;
    }
    hr {
        display: inline-block;
        margin-top: 0px !important;
        margin-bottom: 0px !important;
        border: 2px solid #07a3e6;
        border-radius: 5px;
        width: 6%;
        margin-left: 0.5%;
        margin-right: 0.5%;
        margin-bottom: 1%;
    }
    .rhombus{
        width: 13px;
        height: 13px;
        border: 4px solid #0703eb;
        transform: rotate(45deg) !important;
        background: #CCC;
        display: inline-block;
    }
    .hr_part{
        text-align: center;
    }
    .content_para{
        font-size: 1.8rem;
        margin: 3% 5%;
        text-align: center;
        margin-bottom: 8%;
    }
    .content2{
        margin-top: 8%;
        margin-bottom: 8%;
    }
    .column_video_heading{
        width: 45%;
        margin-left: 6%;
        color: #247ba0;
        font-family: 'PT-Sans';
        margin-top: 10%;
    }
    .column_video_heading h1{
        font-size: 27px;
        font-weight: bold;
    }
    .column2_video{
        width: 38%;
        margin-left: 8%;
    }
    .testi-details {
        background: #f9f7f7;
        padding: 14px 24px;
        margin-bottom: 20px;
        box-shadow: 3px 3px 2px 0px rgba(0,0,0,0.18);
        position: relative;
    }
    .testi-details::before {
        content: '';
        visibility: visible;
        background: #f9f7f7;
        padding: 11px 11px;
        margin-bottom: 0px;
        box-shadow: 3px 3px 2px 0px rgba(0,0,0,0.18);
        position: absolute;
        top: 92%;
        transform: rotate(45deg); 
    }
    .testi-details p{
        font-size: 1.5rem;
    }
    
    .testi-info a {
        display: block;
        width: 50px;
        height: 50px;
        background-color: #fff;
        border-radius: 50%;
        float: left;
        margin-right: 10px;
    }
    .testi-info h3 {
        display: inline-block;
        line-height: 22px;
        font-weight: 600;
        color: #000;
        margin-top: 8px;
    }
    .testi-info h3 > span {
        display: block;
        line-height: 16px;
        font-weight: 400;
    }
    .contact_form{
        width: 100% !important;
        box-sizing: border-box;
        border: none !important;
        border-radius: 0px !important;
        font-size: 13px !important;
        background-color: white;
        /*background-image: url('img/search.png');*/
        background-position: 10px 10px; 
        background-repeat: no-repeat;
        padding: 13px !important;
        -webkit-transition: width 0.4s ease-in-out;
        transition: width 0.4s ease-in-out;
    }
    /*contact section*/

    /*.contact-caption {
        background: #3a9dca;
    }*/
    .contact-heading h1{
        color: #fff;
        font-size: 48px;
    }
    .contact-info {
        padding-left: 25px;
    }
    .contact-info h3 {
        padding-left: 0;
        font-size: 25px;
        color: #fff;
        text-transform: uppercase;
        font-weight: bold;
        border-bottom: 1px solid #13849c;
        padding-bottom: 12px;
        margin-bottom: 0;
        text-align: left;
    }
    .contact-form{
        margin-left: 18%;
        width: 40%;
    }
    .contact-form h3 {
        padding-left: 0;
        font-size: 30px;
        color: #fff;
        text-transform: uppercase;
        font-weight: bold;
        border-bottom: 1px solid #13849c;
        padding-bottom: 12px;
        margin-bottom: 0;
    }
    .contact-info ul {
        margin: 0;
        padding: 0;
        list-style: none;
    }
.contact-info ul li {
    font-family: 'Open Sans', sans-serif;
    font-size: 14px;
    color: #fff;
}
.contact-info i.fa {
    font-size: 16px;
    padding-right: 12px;
    width: 25px;
    height: 38px;
}
.contact-info ul li span {
    font-weight: bold;
}
.contact-form input {
    width: 100%;
    height: 40px;
    background: #fff;
    font-size: 13px;
    color: #084a5c;
    font-family: 'Open Sans', sans-serif;
    padding: 12px;
    border: 0;
    margin-bottom: 12px;
}
.contact-form textarea {
    font-family: 'Open Sans', sans-serif;
    padding: 12px;
    width: 100%;
    height: 140px;
    border: 0;
    margin-bottom: 12px;
}
.info-detail {
    border-top: 1px solid #53cde5;
    padding-top: 15px;
}
.form {
    border-top: 1px solid #53cde5;
    padding-top: 15px;
    text-align: right;
}
    .contact-form input.submit-btn {
        width: 120px;
        height: 40px;
        float: right;
        font-size: 20px;
        color: #fff;
        background-repeat: no-repeat;
        padding: 0;
        font-family: 'OpenSans', sans-serif;
        font-weight: bold;
        background-color: #70c1b3;
        border-radius: 10px;
    }
.contact-form {
    padding-right: 40px;
}
</style>
<script>
            $(document).ready(function(){
                $().UItoTop({ easingType: 'easeOutQuart' });
                var owl = $("#owl");
                owl.owlCarousel({
                    items : 4, //10 items above 1000px browser width
                    itemsDesktop : [995,3], //5 items between 1000px and 901px
                    itemsDesktopSmall : [767, 2], // betweem 900px and 601px
                    itemsTablet: [700, 2], //2 items between 600 and 0
                    itemsMobile : [479, 1], // itemsMobile disabled - inherit from itemsTablet option
                    navigation : true,
                });
            })
            var Main = Main || {};
            jQuery(window).load(function() {
                window.responsiveFlag = jQuery('#responsiveFlag').css('display');
                Main.gallery = new Gallery();
                jQuery(window).resize(function() {
                    Main.gallery.update();
                });
            });
            function Gallery(){
                var self = this,
                    container = jQuery('.flexslider'),
                    clone = container.clone( false );
                    this.init = function (){
                        if( responsiveFlag == 'block' ){
                        var slides = container.find('.slides');
                        slides.kwicks({
                            max : 500,
                            spacing : 0
                        }).find('li > a').click(function (){
                            return false;
                        });
                        } else {
                            container.flexslider();
                        }
                    }
                    this.update = function () {
                        var currentState = jQuery('#responsiveFlag').css('display');
                        if(responsiveFlag != currentState) {
                            responsiveFlag = currentState;
                            container.replaceWith(clone);
                            container = clone;
                            clone = container.clone( false );
                            this.init();
                        }
                    }
                this.init();
            }
</script>

</head>
<body>
<%@ include file="header.jsp" %>
<div class="main">
    <div class="content">
        <div class="container">
            <div class="col-xs-8">
                <div class="flexslider">
                    <ul class="slides">
                        <li>
                            <img src="./resources/img/page1_img1.jpg" alt="">
                                <div class="flex-caption">
                                    <p>Hope</p>
                                </div>
                        </li>
                        <li>
                            <img src="./resources/img/page1_img2.jpg" alt="">
                                <div class="flex-caption c2">
                                    <p>Share</p>
                                </div>
                        </li>
                        <li>
                            <img src="./resources/img/page1_img3.jpg" alt="">
                                <div class="flex-caption">
                                    <p>Help</p>
                                </div>
                        </li>
                    </ul>
                </div>
                <span id="responsiveFlag"></span>
            </div>
            <div class="col-xs-4">
                <a href="/TestimonialServlet" class="donate">SHARE EXPERIENCES!</a>
                    <div class="text1">We can change the life of those who have no hope!!</div>
                        <p>We HEALTH-VISE are your friends. Remember when down in pain, all of us reach out for a helping end.</p>
                        <p>To seek some aid, an air of relief. We here, help you reach all those willing hands.</p>
                        <p>We also, we warmly welcome those willing to help your larger family. We are your FAMILY.</p>
                    </div>
            </div>
        </div>
    </div>
</div>
<section class="about" id="about" style="background-color: #e8fbf2;">
<div class="content1">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <h1 class="content_heading">ABOUT US</h1>
                <div class="hr_part"><hr><div class="rhombus"></div><hr></div>
                <div class="content_para">
                    <p>Health-Vise is the one stop solution website for the common people focused on the review based result and experiences shared by common man. Website contains all the major diseases with proper numbering and direct links access from the main home page along with the remedial by different methodology to cure it. Website mainly is designed in such a way so as ease the access by all age group by just one click.</p>
                    <p>It contains genuine reviews and experiences personally verified by our team. We aim to serve as much as common people we can and make them aware of the major diseases and its cure.</p>
                    <p>We also aim to collect the reviews and experiences shared by common people and use them to make others aware about their journey to successfully fight against the diseases. We hereby wants everyone to get informed about the different process and methodology practiced around the  world to fight against the disease.</p>
                </div>
            </div>
            
        </div>
    </div>
</div>
</section>
<section id="video">
    <div class="content2">
        <div class="row" style="margin: 0px !important;">
            <div class="col-xs-6 column_video_heading">
                <h1>Check how it works, Hit the Button</h1>
            </div>
            <div class="col-xs-6 column2_video">
                <!--<iframe width="100%" src="https://www.youtube.com/watch?v=Jijt-hP1jxA" allowfullscreen></iframe>-->
                <embed src="https://www.youtube.com/embed/F9Bo89m2f6g" allowfullscreen="true" width="425" height="344">
            </div>
        </div>
    </div>
</section>

<!-- team section -->
<section id="testimonial" style="background-color: #e8fbf2;">
        <div class="container">
            <div class="row">
                <div class="team-heading">
                    <h1 class="content_heading">TESTIMONIALS</h1>
                    <div class="hr_part">
                        <hr style="width: 13%"><div class="rhombus"></div><hr style="width: 13%">
                    </div>
                </div>
            <div>
            <div class="row" style="margin: 5% 2%;">
                <div class="col-md-4 col-sm-4">
                    <div class="testi-details">
                        <p><b>Arthiritis and frequent cold, HOMEOPATHY &nbsp; &nbsp;</b>She was suffering with pain in inter-phalangeal joints of hands and metatarsal joints of feet since last two years. She would have severe continuous pain daily...&nbsp;&nbsp;<a href="#">More</a></p>
                    </div>
                    <div class="test-info">
                        <a href="#"><img src="./resources/img/thumb1.png" alt="" class="img-responsive"></a>
                        <h3>MRS.&nbsp;<span>KK</span></h3>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4">
                    <div class="testi-details">
                        <p><b>Asthma, AYURVEDIC&nbsp;&nbsp;</b>He had been suffering from asthma for about six months. He complained of breathlessness, palpitation and nasal blockage. Additionally, he was suffering from hyperacidity and indigestion.He had no family.....&nbsp;&nbsp;<a href="#">More</a></p>
                    </div>
                    <div class="test-info">
                        <a href="#"><img src="./resources/img/thumb.png" alt="" class="img-responsive"></a>
                        <h3>RANJIT&nbsp;<span>(changed)</span></h3>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4">
                    <div class="testi-details">
                        <p><b>Backpain, HOMEOPATHY&nbsp;&nbsp;</b>She had difficulty in walking, severe pain in the morning, difficulty in bending and sitting since past few months. She had done an MRI report which concluded herniated discwith moderate pressure phenomenon...&nbsp;&nbsp;<a href="#">More</a></p>
                    </div>
                    <div class="test-info">
                        <a href="#"><img src="./resources/img/thumb1.png" alt="" class="img-responsive"></a>
                        <h3>MS.&nbsp;<span>S.N.</span></h3>
                    </div>
                </div>
            </div>
        </div>
</section>
<section class="contact" style="background-color: #3a9dca;">
        <div class="container">
            <div class="row" style="margin-bottom: 3%;">
                <div class="contact-caption clearfix">
                    <div class="contact-heading text-center content_heading">
                        <h1>CONTACT US</h1>
                        <div class="hr_part">
                            <hr style="width: 10%; border: 2px solid #fff;"><div class="rhombus" style="border: 4px solid #606060;"></div><hr style="width: 10%; border: 2px solid #fff;">
                        </div>
                    </div>
                    <div class="col-md-5 contact-info text-left">
                        <h3 class="content_heading">contact information</h3>
                        <div class="info-detail">
                            <!--<ul><li><i class="fa fa-calendar"></i><span>Monday - Friday:</span> 9:30 AM to 6:30 PM</li></ul>-->
                            <ul><li><i class="fa fa-map-marker"></i><span>Address:</span> The LNM Institute of Information Technology</li></ul>
                            <ul><li><i class="fa fa-phone"></i><span>Phone:</span> (032) 987-1235</li></ul>
                            <!--<ul><li><i class="fa fa-fax"></i><span>Fax:</span> (123) 984-1234</li></ul>-->
                            <ul><li><i class="fa fa-envelope"></i><span>Email:</span> info@healthvice.com</li></ul>
                        </div>
                    </div>
                    <div class="col-md-6 col-md-offset-1 contact-form">
                        <h3 class="content_heading" style="text-align: left; font-size: 25px;">leave us a message</h3>

                        <form class="form">
                            <input class="name contact_form" type="text" placeholder="Name">
                            <input class="email contact_form" type="email" placeholder="Email">
                            <input class="phone contact_form" type="text" placeholder="Phone No:">
                            <textarea class="message contact_form" name="message" id="message" cols="30" rows="10" placeholder="Message"></textarea>
                            <input class="submit-btn" type="submit" value="SUBMIT">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>	

</body>
</html>