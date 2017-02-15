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
		<link rel="stylesheet" type="text/css" href="web/css/theme.default.css" />
		<script type="text/javascript" src="web/js/jquery.min.js"></script>
		<script type="text/javascript" src="web/js/jquery.tablesorter.js"></script>
		
		<style type="text/css">
			.labelText {
				color: #444;
				font-size: 14px;
			}
			.labelSlash {
				color: #555;
				font-weight: bold;
				font-size: 15px;
				padding-left: 8px;
				padding-right: 8px;
			}
			.hyperlink {
				font-size: 14px;
			}
		</style>
		
		<script type="text/javascript">
			$(document).ready(function(){
				$("table").tablesorter({theme:'default', widgets:['zebra']});
				$("ul.nav").find('li').eq(2).attr('class','current');
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
						<li><a href='<c:url value="/${role}/completeReports" />'  class="tab">Consolidated Reports</a></li>
					</ul>
					<div class="content1" style="color:black;">
						<br /><br /><a class="hyperlink" href='<c:url value="/${role}/salesReports" />'>Sales Report</a><label class="labelSlash">/</label><label class="labelText">Date wise Reports</label><br /><br /><br />
						From: &nbsp; <b> ${fDate}</b> &nbsp; &nbsp;
						To: &nbsp; <b> ${tDate} </b> <br /><br />
						<table class="tablesorter">
							<thead><tr>
								<th> Date </th>
								<th> No. of Sales </th>
								<th> Sales Amount </th>
							</tr></thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty list}">
										<c:forEach items="${list}" var="data">
											<tr>
												<c:forEach items="${data}" var="col">
													<td> ${col} </td>
												</c:forEach>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr><td colspan="3">No results found</td></tr>
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