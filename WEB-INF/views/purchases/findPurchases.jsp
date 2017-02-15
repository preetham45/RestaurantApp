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
		<title>Find Purchases - Al Mehfal Restaurant</title>
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
				
				$(".nav ul").find('li').eq(2).attr('class','current');
				
				$("#date2").datepicker({
					dateFormat: 'yy-mm-dd',
					changeMonth: true,
					changeYear: true,
					showWeek: true,
					firstDay: 1
				});
				
				$("table").tablesorter({theme:'default', widgets:['zebra']});
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
						<li><a href='<c:url value="/${role}/findPurchases" />' class="tab active">Purchases</a></li>
						<li><a href='<c:url value="/${role}/viewExpenses" />' class="tab">Expenses</a></li>
						<li><a href='<c:url value="/${role}/salesReports" />' class="tab">Sales</a></li>
						<li><a href='<c:url value="/${role}/showEmployees" />' class="tab">Employees</a></li>
						<li><a href='<c:url value="/${role}/payrolls" />' class="tab">Payrolls</a></li>
						<li><a href='<c:url value="/${role}/completeReports" />' class="tab">Consolidated Reports</a></li>
					</ul>
					<div class="content1" style="color:black;"><br /><br />
						<form method="post" action='<c:url value="/${role}/getPurchases" />'>
							Purchase Date : <input type="text" value="${pDate}" name="pDate" id="date1" style="width: 100px" readonly="readonly" />
							&nbsp; &nbsp; To Date : <input type="text" value="${toDate}" name="toDate" id="date2" style="width: 100px" readonly="readonly" />
							&nbsp; &nbsp; Supplier No : <select name="sNum" id="sNum">
								<option> </option>
								<c:forEach items="${suppliersList}" var="data">
									<option>${data.supplierNum}</option>
								</c:forEach>
							</select>
							<script type="text/javascript">
								$("#sNum").val('${sNum}');
							</script>
							&nbsp; &nbsp; <input type="submit" value=" Find " />
						</form>
						<br /> <br />
						
						<table class="tablesorter">
							<thead><tr>
								<th>Grn No</th>
								<th>Grn Date</th>
								<th>Supplier Name</th>
								<th>Invoice Num</th>
								<th>Invoice Date</th>
								<th>Invoice Amount</th>
								<th>Created On</th>
								<th>Paid Amount</th>
							</tr></thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty list}">
										<c:forEach items="${list}" var="data">
											<tr>
												<td>${data.grnNo}</td>
												<td>${data.purchaseDate}</td>
												<td>${data.supplierName}</td>
												<td>${data.invoiceNum}</td>
												<td>${data.invoiceDate}</td>
												<td>${data.invoiceAmount}</td>
												<td>${data.createdOn}</td>
												<td>${data.paidAmount}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr><td colspan="8" align="center">No Purchases Found</td></tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table><br /><br />
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