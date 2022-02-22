<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reports</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<style>
	.logout {
      margin-right:10px;
    }
    .reports {
    margin-left:150px;
    }
    .filter{
        margin-right:100px;
    }
    table {
        counter-reset: tableCount;
        table-layout: fixed;
        margin: auto;
    }
    td {
       word-wrap:break-word;
       text-align: center;
    }
    tr {
      text-align: center;
    }
    .counterCell:before {
        content: counter(tableCount);
        counter-increment: tableCount;
    }
    </style>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: black">
			<div>
				<form accept-charset="UTF-8" method="POST" action="/tax-office/service/logout" class = "logout">
                <button type="submit" class="btn btn-primary">Logout</button>
                </form>
            </div>
            <div>
                <form action="/tax-office/service/toHome" method="GET">
                <button type="submit" class="btn btn-primary">Home</button>
                </form>
            </div>
		</nav>
	</header>
 <br>
	<h3 class="text-center">List of Reports</h3>
    <hr>
 <p>
      <form action = "/tax-office/service/filterClientReports" class = "filter" align="right">
      <div class="form-group">
         <label for="name">Choose a date:</label>
           <input type="date" name="date"
            min="01-01-2010" max="12-31-2100"/>
         <label for="name">Choose a status:</label>
            <select name="status">
              <option value="">status</option>
              <option value="SUBMITTED">SUBMITTED</option>
              <option value="ACCEPTED">ACCEPTED</option>
              <option value="UNACCEPTED">UNACCEPTED</option>
              <option value="EDITED">EDITED</option>
            </select>
         <label for="name">Choose a type:</label>
            <select name="type">
              <option value="">type</option>
              <option value="income statement">income statement</option>
              <option value="income tax">income tax</option>
              <option value="single tax">single tax</option>
            </select>
         <input type="hidden" name="clientId" value="${user.id}"/>
         <button type="submit" class="btn btn-outline-dark">Filter</button>
      </div>
      </form>
 <p>
      <form action = "/tax-office/service/allReportsByClient"  method="GET" align="left" class = "reports">
          <input type="hidden" name="clientId" value="${user.id}"/>
          <button type="submit" class="btn btn-primary">All my reports</button>
      </form>
<br>
			<table class=" table-bordered " width="1200">
			<col style="width:4%">
				<thead>
					<tr>
					    <th>№</th>
                        <th>Title</th>
                        <th>Date</th>
                        <th>Type</th>
                        <th>Status</th>
                        <th>Info</th>
                        <th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${reports}" var="report">
						<tr>
						    <td class="counterCell"></td>
							<td><a href="showReport?clientId=${user.id}&title=<c:out value='${report.title}'/>"target="_blank">${report.title}</a></td>
							<td><c:out value="${report.date}" /></td>
                            <td><c:out value="${report.type}" /></td>
                            <td><c:out value="${report.status}" /></td>
                            <td><c:out value="${report.info}" /></td>
							<td>
							   <form action="/tax-office/service/editReport" method="GET" >
                                  <input type="hidden" name="id" value="${report.id}"/>
                                  <input type="hidden" name="clientId" value="${user.id}"/>
                                  <input type="hidden" name="title" value="${report.title}"/>
                                  <input type="hidden" name="date" value="${date}"/>
                                  <input type="hidden" name="statusFilter" value="${status}"/>
                                  <input type="hidden" name="type" value="${type}"/>
                                  <button type="submit" class="btn btn-outline-primary" >Edit</button>
                               </form>
							   <a href="showReport?clientId=${user.id}&title=<c:out value='${report.title}'/>" download >
							   <button  class="btn btn-outline-primary">Download</button>
							   </a>
							   <form action="/tax-office/service/deleteReportById" method="POST" onSubmit='return confirm("Are you sure?");'>
                                  <input type="hidden" name="id" value="${report.id}"/>
                                  <input type="hidden" name="clientId" value="${user.id}"/>
                                  <input type="hidden" name="title" value="${report.title}"/>
                                  <input type="hidden" name="date" value="${date}"/>
                                  <input type="hidden" name="statusFilter" value="${status}"/>
                                  <input type="hidden" name="type" value="${type}"/>
                                  <button type="submit" class="btn btn-outline-danger">Delete</button>
                               </form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br>
	</div>
</body>
</html>
