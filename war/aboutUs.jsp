<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>About us</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
	<link rel="stylesheet" type="text/css" href="./resources/css/style_home.css">
<style>
	#landing-aboutus{
	position: relative;
	/* background-color: #1de9b6; */
	background-image : url(./resources/img/image_about.JPG);
	background-repeat: no-repeat;
	height : 650px;
	width : 100%;
	color : #ffffff;
	height: 650px;
}
#landing-aboutus-content{
	text-align: center;
	/*margin-top: -35px;*/
	*color : #ffffff;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translateX(-50%) translateY(-50%)
}
</style>
</head>

<body>
	<div class="container-fluid">
		<!-- Header starts -->
		<%@ include file="header.jsp" %>
		<!-- Header ends -->
		<div id="landing-aboutus" class="col s12">
			<div id="landing-aboutus-content">
				<p><h2>We are a one-step-solution to your Health-problems</h2></p>
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
  	
	var shouldOpenModal = <%=Boolean.parseBoolean((String)request.getAttribute("openModal"))%>
	if(shouldOpenModal) {
	  	instance_m.open();
	}
</script>
</html>