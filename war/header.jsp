<%@ page import="com.btp.User" %>
<%
	User u=(User)request.getSession().getAttribute("user");
	Boolean incorrectInfo = Boolean.parseBoolean((String)request.getAttribute("incorrectInfo"));
	Boolean pwdUnmatch = Boolean.parseBoolean((String)request.getAttribute("pwdUnmatch"));
	//String msg=(String)request.getAttribute("msg");
%>
		<nav>
			<div class="nav-wrapper" style="box-shadow: 0px 0px 0px;">
      		<a href="index.jsp" class="brand-logo">HEALTHVICE</a>
      		<!-- <ul id="nav-mobile" style="margin: 0 auto; padding-left: 250px;">
      			<li>
        			<form action="SearchResult.jsp" method="post">
      					<input type="text" name="searchterm"  placeholder="Search" style="border: 1px solid grey; background-color: #ffffff; padding-left: 5px;">
      					<button class="waves-effect waves-light btn" style="width: 100px; background-color: #ffffff; color: #1de9b6;">SEARCH</button>
      				</form>
        		</li>
      		</ul> -->
      		<ul id="nav-mobile" class="right" style="margin: 0 auto;">
        		<li><a href="aboutUs.jsp">About Us</a></li>
        		<li><a href="TestimonialServlet">Share your experience!</a></li>
        		<li><a class='dropdown-trigger nooutline' href="#" data-target='diseaseDropDown'>Diseases</a></li>
        		<%if(u == null){ %>
        		<li><a class="modal-trigger" href="#LoginModal">Login</a></li>
        		<%} else { %>
        		<li><a href="Logout">Logout</a></li>
        		<%} %>
      		</ul>
    		</div>
		</nav>
		<ul id="diseaseDropDown" class='dropdown-content'>
			<li><a href="Disease.jsp?val=Arthritis">Arthritis</a></li>
            <li><a href="Disease.jsp?val=Asthma">Asthma</a></li>
            <li><a href="Disease.jsp?val=Slip Disc">Slip Disc</a></li>
            <li><a href="Disease.jsp?val=Migraine">Migraine</a></li>
            <li><a href="Disease.jsp?val=Piles">Piles</a></li>
            <li><a href="Disease.jsp?val=Cough and Cold">Cough and Cold</a></li>
            <li><a href="Disease.jsp?val=Brain Tumour">Brain Tumour</a></li>
            <li><a href="Disease.jsp?val=Gallstones">Gallstones</a></li>
            <li><a href="Disease.jsp?val=Psoriasis">Psoriasis</a></li>
		</ul>
		<div id="LoginModal" class="modal">
			<div class="modal-content">
				<div class="row">
					<div class="col s12">
					<ul class="tabs" style="margin-bottom: 8px;">
      					<li class="tab col s6"><a class="active" href="#Login">Login</a></li>
      					<li class="tab col s6"><a href="#SignUp">SignUp</a></li>
      				</ul>
      				<div id="Login">
      					<!-- <p>Login Form will be here</p> -->
      					<form class="col s12" action="/LoginUser" method="post">
      						<div class="row">
      						    <div class="fb-login-button" data-max-rows="1" data-size="medium" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div>
      						</div>
      						<div class="row">
      							<div class="input-field col s12">
      								<input type="email" id="email" name="email">
      								<label for="email">Email</label>
      							</div>
      						</div>
      						<div class="row">
						        <div class="input-field col s12">
						          <input id="password" type="password" class="validate" name="password">
						          <label for="password">Password</label>
						        </div>
						    </div>
						   <%if(incorrectInfo) {%>
						   		<% System.out.println("isLoggedin is false"); %>
						   		<p style="color: red;">Incorrect Email or password!</p>
						   <%} %>
						    <div class="row">
						    	<div class="col s4">
						    		
						    	</div>
						    	<div class="col s4" style="border: 2px solid #00bfa5; text-align: center; padding: 0px;">
						    	 	<button class="waves-effect waves-teal btn-flat" type="submit" name="action" style="color: #00bfa5; text-align: center; width: 100%;">Submit</button>
						    	</div>
						    	
						    </div>
						    
      					</form>
      				</div>
      				<div id="SignUp">
      					<!-- <p>SignUp form will be here</p> -->
      					<form class="col s12" action="/SignupUser" method="post">
      						<div class="row">
      							<div class="input-field col s6">
      								<input type="text" id="fname" name="firstname">
      								<label for="uname">First Name</label>
      							</div>
      							<div class="input-field col s6">
      								<input type="text" id="lname" name="lastname">
      								<label for="uname">Last Name</label>
      							</div>
      						</div>
      						<div class="row">
      							<div class="input-field col s6">
      								<input type="text" class="datepicker" name="dob">
      								<label for="dob">Date of Birth</label>
      								
      							</div>
      							<div class="input-field col s6">
							        <select class="select" name="gender">
	      								<option value="gender" disabled selected>Gender</option>
	      								<option value="male">Male</option>
	      								<option value="female">Female</option>
	    							</select>
						    	</div>
      						</div>
      						<div class="row">
						        <div class="input-field col s6">
						          <input id="email" type="email" class="validate" name="email">
						          <label for="email">Email</label>
						        </div>
						        <div class="input-field col s6">
						          <input id="contact" type="text" class="validate" name="number">
						          <label for="contact">Contact</label>
						        </div>
						    </div>
      						<div class="row">
						        <div class="input-field col s12">
						          <input id="password" type="password" class="validate" name="password">
						          <label for="password">Password</label>
						        </div>
						    </div>
						    <div class="row">
						        <div class="input-field col s12">
						          <input id="cpass" type="password" class="validate" name="cpass">
						          <label for="cpass">Confirm Password</label>
						        </div>
						    </div>
						    <%if(pwdUnmatch){ %>
          						<p style="color:red;">Passwords do not match</p>
          					<%} %>
						     <div class="row">
						    	<div class="col s4">
						    		
						    	</div>
						    	<div class="col s4" style="border: 2px solid #00bfa5; text-align: center; padding: 0px;">
						    	 	<button class="waves-effect waves-teal btn-flat" type="submit" name="action" style="color: #00bfa5; text-align: center; width: 100%;">Submit</button>
						    	</div>
						    	
						    </div>
      					</form>
      				</div>
					</div>
				</div>
    		</div>
		</div>