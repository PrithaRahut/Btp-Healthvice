<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Disease Entry</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Enter Disease</h2>
  <form class="form-horizontal" action="/DiseaseEntryServlet" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="diseaseName">Disease Name:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="diseaseName" name="diseaseName">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="desc">Description:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="desc" name="desc">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="symptom">Symptoms:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="symptom" name="symptom">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="cause">Cause:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="cause" name="cause">
      </div>
    </div>
    
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">Submit</button>
      </div>
    </div>
  </form>
</div>

</body>
</html>