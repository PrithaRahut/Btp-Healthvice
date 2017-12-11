<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String msg=(String)request.getAttribute("msg");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
  <meta charset="UTF-8">
  <title>Sign-Up/Login Form</title>
  <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
  <link href="https://fonts.googleapis.com/css?family=PT+Serif|Bitter|Bubblegum+Sans|Open+Sans" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="./resources/css/font-awesome.min.css">
  <link rel="stylesheet" href="./resources/css/style_login1.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
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
        font-size: 13px;
        font-weight: bold;
        font-family: 'Open Sans', Sans-serif;
    }
    .navbar-default .navbar-nav > li > a {
        color: #247ba0;
    }
    .nav > li > a{
        padding: 10px 10px;
        font-size: 13px;
        font-weight: bold;
        font-family: 'Open Sans', Sans-serif;
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
</style>
  
</head>

<body>
<%@ include file="header.jsp" %>
  <div class="form">
      
      <ul class="tab-group">
      	<li class="tab active"><a href="#login">Log In</a></li>
        <li class="tab"><a href="#signup">Sign Up</a></li>
        
      </ul>
      <div class="tab-content">
        <div id="login">   
          <h1>Welcome Back!</h1>
          
          <form action="/LoginUser" method="post">
          
            <div class="field-wrap">
         
            <input type="email" name="email" placeholder="Email*" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            
            <input type="password" name="password" placeholder="Password*" required autocomplete="off"/>
          </div>
          <%if(msg != null){ %>
          	<p><%=msg %></p>
          <%} %>
          
          <p class="forgot"><a href="#forgot_pwd">Forgot Password?</a></p>
          
          <button class="button button-block"/>Log In</button>
          
          </form>

        </div>
        
        <div id="signup">   
          <h1>Sign Up for Free!</h1>
          
          <form action="/SignupUser" method="post">
          
          <div class="top-row">
            <div class="field-wrap">
              
              <input type="text" name="firstname" placeholder="First Name*" required autocomplete="off" />
            </div>
        
            <div class="field-wrap">
             
              <input type="text" name="lastname" placeholder="Last Name*" required autocomplete="off"/>
            </div>
          </div>

          <div class="field-wrap">
            
            <input type="email" name="email" placeholder="Email*" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
           
            <input type="password" name="password" placeholder="Password*" required autocomplete="off"/>
          </div>

          <div class="field-wrap">
           
            <input type="password" name="cpass" placeholder="Confirm Password*" required autocomplete="off"/>
          </div>

          <div class="field-wrap">
            
            <input type="text" name="number" placeholder="Contact Number*" required autocomplete="off"/>
          </div>
          
          <button type="submit" class="button button-block"/>Get Started</button>
          
          </form>

        </div>
        <!--<div id="forgot_pwd">
          <h1>Enter your Email ID</h1>
          <form action="/" method="post">
            <div class="field-wrap">
              <label>
                Email Address<span class="req">*</span>
              </label>
              <input type="email" required autocomplete="off">
            </div>
            <button class="button button-block"/>SUBMIT</button>
          </form>
        </div>-->
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script  src="./resources/js/index.js"></script>

</body>
</html>
