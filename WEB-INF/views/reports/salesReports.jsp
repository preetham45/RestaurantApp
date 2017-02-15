<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<sec:authorize ifAnyGranted="ROLE_USER">
	<c:set var="role" value="user"></c:set>
</sec:authorize>
<sec:authorize ifAnyGranted="ROLE_MANAGER">
	<c:set var="role" value="manager" ></c:set>
</sec:authorize>
<sec:authorize ifAnyGranted="ROLE_ADMIN">
	<c:set var="role" value="admin"></c:set>
</sec:authorize>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<title>Sales Report - Al Mehfal Restaurant</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="web/css/screen.css" />
		<link href="web/css/jquery.ui.css" rel="stylesheet" type="text/css" />
		<link href="web/css/jquery.ui.theme.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="web/js/jquery.min.js"></script>
		<script type="text/javascript" src="web/js/jquery.ui.js"></script>
		
		<style type="text/css">
			input[type="text"] {
				font-family: "Arial";
				font-size: 12px;
				height: 19px;
				line-height: 18px;
				color: black;
				background-color: white;
				border: 2px inset #cccccc;
			}
		</style>
		
		<script type="text/javascript">
			$(document).ready(function(){
				$("#date1").datepicker({
					dateFormat: 'yy-mm-dd',
					changeMonth: true,
					changeYear: true,
					showWeek: true,
					firstDay: 1
				});
				
				$(".nav ul").find('li').eq(2).attr('class','current');
				
				$("#date2").datepicker({
					dateFormat: 'yy-mm-dd',
					changeMonth: true,
					changeYear: true,
					showWeek: true,
					firstDay: 1
				});
			});
		</script>
	</head>

	<body>
		<div id="wrapper">
			<jsp:include page="../header.jsp"></jsp:include>
			<div id="content">
				<div class="tabbed_area">
					<ul class="tabs">
						<li><a href='<c:url value="/${role}/viewRawMaterials" />' class="tab">Raw Materials</a></li>
						<li><a href='<c:url value="/${role}/listSuppliers" />' class="tab">Suppliers</a></li>
						<li><a href='<c:url value="/${role}/findPurchases" />' class="tab">Purchases</a></li>
						<li><a href='<c:url value="/${role}/viewExpenses" />' class="tab">Expenses</a></li>
						<li><a href='<c:url value="/${role}/salesReports" />' class="tab active">Sales</a></li>
						<li><a href='<c:url value="/${role}/showEmployees" />' class="tab">Employees</a></li>
						<li><a href='<c:url value="/${role}/payrolls" />' class="tab">Payrolls</a></li>
						<li><a href='<c:url value="/${role}/completeReports" />' class="tab">Consolidated Reports</a></li>
					</ul>
					<div class="content1" style="color:black;">
						<br /><br /><h2> Date wise Reports </h2><br />
						<form method="post" action='<c:url value="/${role}/dateWiseReport" />'>
							From Date : <input type="text" value="${pDate}" name="fDate" id="date1" style="width: 100px" readonly="readonly" />
							&nbsp; &nbsp; To Date : <input type="text" value="${toDate}" name="tDate" id="date2" style="width: 100px" readonly />
							&nbsp; &nbsp; <input type="submit" value=" Get Reports " />
						</form><br /><br />
						<h2> Month wise Reports </h2><br />
						<form method="post" action='<c:url value="/${role}/monthWiseReport" />'>
							From Month : <select name="fMonth">
								<option value="01">Jan</option>
								<option value="02">Feb</option>
								<option value="03">Mar</option>
								<option value="04">Apr</option>
								<option value="05">May</option>
								<option value="06">June</option>
								<option value="07">July</option>
								<option value="08">Aug</option>
								<option value="09">Sept</option>
								<option value="10">Oct</option>
								<option value="11">Nov</option>
								<option value="12">Dec</option>
							</select> &nbsp; &nbsp;
							To Month : <select name="tMonth">
								<option value="01">Jan</option>
								<option value="02">Feb</option>
								<option value="03">Mar</option>
								<option value="04">Apr</option>
								<option value="05">May</option>
								<option value="06">June</option>
								<option value="07">July</option>
								<option value="08">Aug</option>
								<option value="09">Sept</option>
								<option value="10">Oct</option>
								<option value="11">Nov</option>
								<option value="12">Dec</option>
							</select>
							&nbsp; &nbsp; Year: &nbsp; <input type="text" style="width:100px;" name="year" />
							&nbsp; &nbsp; <input type="submit" value=" Get Reports " />
						</form><br /><br />
					</div>
				</div>
			</div>
			<div id="footer">
				<div id="footer_info">
					<p>&copy; 2013, Al Mehfal Restaurant, All Rights Reserved</p>
				</div>
			</div>
		</div>
	</body>
</html>