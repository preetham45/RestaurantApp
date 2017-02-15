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
		<title>SuppliersPage - Al Mehfal Restaurant</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" href="web/css/screen.css" type="text/css" />
		<link href="web/css/theme.default.css" rel="stylesheet" type="text/css" />
		
		<script type="text/javascript" src="web/js/jquery.min.js"></script>
		<script src="web/js/jquery.tablesorter.js" type="text/javascript"></script>
		
		<script type="text/javascript">
			$(document).ready(function(){
				$(".tablesorter").tablesorter({theme:'default', widgets:['zebra']});
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
						<li><a href='<c:url value="/${role}/listSuppliers" />' class="tab active">Suppliers</a></li>
						<li><a href='<c:url value="/${role}/findPurchases" />' class="tab">Purchases</a></li>
						<li><a href='<c:url value="/${role}/viewExpenses" />' class="tab">Expenses</a></li>
						<li><a href='<c:url value="/${role}/salesReports" />' class="tab">Sales</a></li>
						<li><a href='<c:url value="/${role}/showEmployees" />' class="tab">Employees</a></li>
						<li><a href='<c:url value="/${role}/payrolls" />' class="tab">Payrolls</a></li>
						<li><a href='<c:url value="/${role}/completeReports" />' class="tab">Consolidated Reports</a></li>
					</ul>
					<div class="content1" style="color:black;">
						<br /><br /><h1>Suppliers List</h1><br /><br />
						<table class="tablesorter">
							<thead>
								<tr>
									<th>Suplier Id</th>
									<th>Supplier Name</th>
									<th>Contact No.</th>
									<th>Mobile No.</th>
									<th>Amount</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty list}">
										<c:forEach items="${list}" var="supplier">
											<tr>
												<td>${supplier.supplierNum}</td>
												<td>${supplier.supplierName}</td>
												<td>${supplier.firstContactNum}</td>
												<td>${supplier.firstMobileNum}</td>
												<td>${supplier.amount}</td>
												<td align="center">
													<a href='<c:url value="/${role}/editSupplier" />?id=${supplier.supplierNum}'>Edit</a>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr><td colspan="6" align="center">No Suppliers exists</td></tr>
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