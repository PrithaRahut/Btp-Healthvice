<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.btp.ComparisonOfPathy" %>
<%
	HashMap<String,Integer> map = ComparisonOfPathy.comparePathyForDisease("Asthma");
	System.out.println("Testing map:" + map.get("Homeopathy"));

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sample Chart</title>
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<style type="text/css">
#chartdiv {
  width: 100%;
  height: 500px;
}
</style>
</head>
<body>
	<div id="chartdiv"></div>
</body>
<script type="text/javascript">
var chart = AmCharts.makeChart( "chartdiv", {
	  "type": "pie",
	  "theme": "light",
	  "dataProvider": [ {
	    "pathy": "Homeopathy",
	    "count": <%=map.get("Homeopathy")%>
	  }, {
	    "pathy": "Allopathy",
	    "count": <%=map.get("Allopathy")%>
	  }, {
	    "pathy": "Ayurveda",
	    "count": <%=map.get("Ayurvedic")%>
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

</script>
</html>