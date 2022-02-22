<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
    <body>
    <script>
    function close_window() {
      if (confirm("Close Window?")) {
        close();
      }
    }
    </script>
    <p>
<div class="container">
  <h1>Report info:</h1>
  <div class="card">
   <div class="card-body">
    <form>

     <div class="form-group row">
      <label for="login" class="col-sm-2 col-form-label">Person(natural,legal)</label>
      <div class="col-sm-7">
       <input type="text" value = "${reportParameters.person}" class="form-control" name="person"
         readonly disabled>
      </div>
     </div>

     <div class="form-group row">
      <label for="password" class="col-sm-2 col-form-label">Nationality</label>
      <div class="col-sm-7">
       <input type="text" value = "${reportParameters.nationality}" class="form-control" name="nationality"
         readonly disabled>
      </div>
     </div>

     <div class="form-group row">
      <label for="password" class="col-sm-2 col-form-label">Year</label>
      <div class="col-sm-7">
       <input type="text" value = "${reportParameters.year}" class="form-control" name="year"
         readonly disabled>
      </div>
     </div>

     <div class="form-group row">
      <label for="password" class="col-sm-2 col-form-label">Quarter(1,2,3,4)</label>
      <div class="col-sm-7">
       <input type="number" min = "1" max = "4" value = "${reportParameters.quarter}" class="form-control" name="quarter"
         readonly disabled>
      </div>
     </div>

     <div class="form-group row">
      <label for="password" class="col-sm-2 col-form-label">Number of Month</label>
      <div class="col-sm-7">
       <input type="number" min = "1" max = "12" value = "${reportParameters.month}" class="form-control" name="month"
         readonly disabled>
      </div>
     </div>

     <div class="form-group row">
      <label for="surname" class="col-sm-2 col-form-label">Group(I,II,III,IV)</label>
      <div class="col-sm-7">
       <input type="text" value = "${reportParameters.group}" class="form-control" name="group"
         readonly disabled>
      </div>
     </div>

     <div class=" form-group row">
      <label for="itn" class="col-sm-2 col-form-label">Activity</label>
      <div class="col-sm-7">
       <input type="text" value = "${reportParameters.activity}" class="form-control" name="activity"
         readonly disabled>
      </div>
     </div>

     <div class="form-group row">
      <label for="login" class="col-sm-2 col-form-label">Income</label>
      <div class="col-sm-7">
       <input type="text" value = "${reportParameters.income}" class="form-control" name="income"
         readonly disabled>
      </div>
     </div>
    </form>
    <br>
    <input type="button" class="btn btn-secondary" onclick="close_window();return false;" value="Back"/>
   </div>
  </div>
 </div>
</body>
</html>