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
		<title>ExpensesPage - Al Mehfal Restaurant</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" href="web/css/screen.css" type="text/css" />
		<link href="web/css/jquery.ui.css" rel="stylesheet" type="text/css" />
		<link href="web/css/theme.default.css" rel="stylesheet" type="text/css" />
		
		<script src="web/js/jquery.min.js" type="text/javascript"></script>
		<script src="web/js/jquery.ui.js" type="text/javascript"></script>
		<script src="web/js/jquery.tablesorter.js" type="text/javascript"></script>
		
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
				
				$("#date2").datepicker({
					dateFormat: 'yy-mm-dd',
					changeMonth: true,
					changeYear: true,
					showWeek: true,
					firstDay: 1
				});
				
				$("table").tablesorter({theme:'default', widgets:['zebra']});
				$(".nav ul").find('li').eq(2).attr('class','current');
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
						<li><a href='<c:url value="/${role}/viewExpenses" />' class="tab active">Expenses</a></li>
						<li><a href='<c:url value="/${role}/salesReports" />' class="tab">Sales</a></li>
						<li><a href='<c:url value="/${role}/showEmployees" />' class="tab">Employees</a></li>
						<li><a href='<c:url value="/${role}/payrolls" />' class="tab">Payrolls</a></li>
						<li><a href='<c:url value="/${role}/completeReports" />' class="tab">Consolidated Reports</a></li>
					</ul>
					<div class="content1" style="color:black;"><br /><br />
						<form method="post" action='<c:url value="/${role}/getExpenses" />'>
							From Date : <input type="text" id="date1" name="fDate" value="${fDate}" style="width: 100px" />
							&nbsp; &nbsp; To Date : <input type="text" id="date2" name="tDate" value="${tDate}" style="width: 100px" />
							&nbsp; &nbsp; <input type="submit" value=" Find " />
						</form>
						<br /> <br />
						<table class="tablesorter">
							<thead><tr>
								<th>Exp.Head</th>
								<th>Exp.Sub Head</th>
								<th>Exp.Details</th>
								<th>Exp.Amount</th>
								<th>Exp.Date</th>
								<th>Created By</th>
								<th>Created On</th>
								<th>Last Updated By</th>
								<th>Last Updated On</th>
							</tr></thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty list.expenses}">
										<c:forEach items="${list.expenses}" var="data">
											<tr>
												<td>${data.expHead}</td>
												<td>${data.expSubHead}</td>
												<td>${data.expDetails}</td>
												<td>${data.expAmount}</td>
												<td>${data.expDate}</td>
												<td>${data.createdBy}</td>
												<td>${data.createdOn}</td>
												<td>${data.lastUpdatedBy}</td>
												<td>${data.lastUpdatedOn}</td>
												<td><a href='<c:url value="/${role}/editExpenses" />?id=${data.expId}'>Edit</a></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr><td colspan="10" align="center">No Expenses Found</td></tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
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