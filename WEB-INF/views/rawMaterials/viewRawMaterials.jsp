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
		<title>Raw Materials - Al Mehfal Restaurant</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" href="web/css/screen.css" type="text/css" />
		<script src="web/js/jquery.min.js" type="text/javascript"></script>
		
		<script type="text/javascript">
			$(document).ready(function(){
				$(".nav ul").find('li').eq(2).attr('class','current');
			});
		</script>
		<link href="web/css/theme.default.css" rel="stylesheet" type="text/css" />
		<script src="web/js/jquery.tablesorter.js" type="text/javascript"></script>
		<link href="web/css/jquery.ui.css" rel="stylesheet" type="text/css" />
		<link href="web/css/jquery.ui.theme.css" rel="stylesheet" type="text/css" />
		<script src="web/js/jquery.ui.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(document).ready(function () {
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
						<li><a href='<c:url value="/${role}/viewRawMaterials" />' class="tab active">Raw Materials</a></li>
						<li><a href='<c:url value="/${role}/listSuppliers" />' class="tab">Suppliers</a></li>
						<li><a href='<c:url value="/${role}/findPurchases" />' class="tab">Purchases</a></li>
						<li><a href='<c:url value="/${role}/viewExpenses" />' class="tab">Expenses</a></li>
						<li><a href='<c:url value="/${role}/salesReports" />' class="tab">Sales</a></li>
						<li><a href='<c:url value="/${role}/showEmployees" />' class="tab">Employees</a></li>
						<li><a href='<c:url value="/${role}/payrolls" />' class="tab">Payrolls</a></li>
						<li><a href='<c:url value="/${role}/completeReports" />' class="tab">Consolidated Reports</a></li>
					</ul>
					<div class="content1">
						<br /><br /><h1 style="color:black;">Raw Materials List</h1><br /><br />
						<table class="tablesorter">
							<thead>
								<tr>
									<th>Raw Material ID</th>
									<th>Raw Material Description</th>
									<th>Raw Material Uom</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty list}">
										<c:forEach items="${list}" var="rawMaterial">
											<tr>
												<td>${rawMaterial.id}</td>
												<td>${rawMaterial.desc}</td>
												<td>${rawMaterial.uom}</td>
												<td><div class="btn" id="${rawMaterial.sno}">Edit</div></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="3" align="center">No Raw Materials</td>
										</tr>
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
		
		<div id="part1" title="Select billing method">
			<form method="post" action='<c:url value="/${role}/editRawMaterial" />' name="editRawMaterial" id="editForm">
				<table border="0">
					<tr>
						<td align="right"> Raw Material ID : </td>
						<td> <input type="hidden" name="sno" id="sno"/> <input type="text" name="id" id="name" /> </td>
					</tr>
					<tr>
						<td align="right"> Raw Material Desc : </td>
						<td> <input type="text" name="desc" id="desc" /> </td>
					</tr>
					<tr>
						<td align="right"> Raw Material Uom : </td>
						<td> <input type="text" name="uom" id="uom" /> </td>
					</tr>
					<tr>
						<td colspan="2" align="right"> <input type="submit" value=" Update " /> </td>
					</tr>
				</table>
			</form>
		</div>
		
		<script type="text/javascript">
			$(document).ready(function () {
				$("#part1").dialog({
					autoOpen: false,
					resizable: false,
					width: 400,
					modal: true
				});
				
				$(document).on("click","div.btn",function(){
					var row1 = $(this).parent().parent();
					$("#part1 #sno").val($(this).attr('id'));
					$("#part1 #name").val(row1.find('td').eq(0).html());
					$("#part1 #desc").val(row1.find('td').eq(1).html());
					$("#part1 #uom").val(row1.find('td').eq(2).html());
					$("#part1").dialog("open");
				});
			});
		</script>
	</body>
</html>