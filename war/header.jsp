<%@ page import="com.btp.User" %>
<%
	User user=(User)request.getSession().getAttribute("user");
%>
<div class="bs-example">
    <nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.jsp">HEALTHVISE</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <form class="navbar-form navbar-left" action="SearchResult.jsp" method="post">
        <div class="form-group">
          <input type="text" class="form-control search" placeholder="Search" id="mySearch" name="searchterm">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="index.jsp">HOME</a></li>
        <li><a href="#about">ABOUT</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">DISEASES<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="Disease.jsp?val=Artheritis">Artheritis</a></li>
            <li><a href="Disease.jsp?val=Asthma">Asthma</a></li>
            <li><a href="Disease.jsp?val=Slip Disc">Slip Disc</a></li>
            <li><a href="Disease.jsp?val=Migraine">Migraine</a></li>
            <li><a href="Disease.jsp?val=Piles">Piles</a></li>
            <li><a href="Disease.jsp?val=Cough and Cold">Cough and Cold</a></li>
            <li><a href="Disease.jsp?val=Brain Tumour">Brain Tumour</a></li>
            <li><a href="Disease.jsp?val=Gallstones">Gallstones</a></li>
            <li><a href="Disease.jsp?val=Psoriasis">Diabaties</a></li>
          </ul>
        </li>
        <li class="dropdown">
        	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">TREATMENT<span class="caret"></span></a>
        	<ul class="dropdown-menu">
        		<li><a href="#">Allopathy</a></li>
        		<li><a href="#">Homeopathy</a></li>
        		<li><a href="#">Ayurveda</a></li>
        		<li><a href="#">Naturopathy</a></li>
        	</ul>
        </li>
        <li><a href="#testimonial">TESTIMONIAL</a></li>
        <%if(user == null) {%>
        <li><a href="login.jsp">LOGIN</a></li>
        <%}else{ %>
        <li><a href="Logout">LOGOUT</a></li>
        <%} %>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</div>