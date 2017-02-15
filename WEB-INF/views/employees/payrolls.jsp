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
		<title>Employee Payrolls - Al Mehfal Restaurant</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />

		<link rel="stylesheet" href="web/css/screen.css" type="text/css" />
		<link href="web/css/theme.default.css" rel="stylesheet" type="text/css" />
		
		<script type="text/javascript" src="web/js/jquery.min.js"></script>
		<script src="web/js/jquery.tablesorter.js" type="text/javascript"></script>
		
		<script type="text/javascript">
			$(document).ready(function () {
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
						<li><a href='<c:url value="/${role}/viewExpenses" />' class="tab">Expenses</a></li>
						<li><a href='<c:url value="/${role}/salesReports" />' class="tab">Sales</a></li>
						<li><a href='<c:url value="/${role}/showEmployees" />' class="tab">Employees</a></li>
						<li><a href='<c:url value="/${role}/payrolls" />' class="tab active">Payrolls</a></li>
						<li><a href='<c:url value="/${role}/completeReports" />' class="tab">Consolidated Reports</a></li>
					</ul>
					<div class="content1" style="color:black;">
						<br /><br /><form method="post" action='<c:url value="/${role}/findPayrolls" />' name="payroll" id="payroll">
							Month : <select name="month">
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
							&nbsp; &nbsp; &nbsp; Year : <input type="text" name="year" />
							&nbsp; &nbsp; <input type="submit" value="Produce Payroll" />
						</form><br /><br />
						<table>
							<thead><tr>
								<th>Name</th>
								<th>Salary</th>
								<th>Gross Pay</th>
								<th>Loan Deduction</th>
								<th>Other Deduction</th>
								<th>Net Salary</th>
								<th>Created By</th>
								<th>Created On</th>
							</tr></thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty payrolls}">
										<c:forEach items="${payrolls}" var="payroll">
											<tr>
												<td> ${payroll.name} </td>
												<td> ${payroll.basicSalary} </td>
												<td> ${payroll.grossPay} </td>
												<td> ${payroll.loanDeduction} </td>
												<td> ${payroll.otherDeduction} </td>
												<td> ${payroll.netSalary} </td>
												<td> ${payroll.createdBy} </td>
												<td> ${payroll.createdOn} </td>
											</tr>
										</c:forEach>
										<tr><td colspan="8" align="center"> <br /><input class="btn" type="button" value=" Print " onclick="javascript:window.print();" /> </td> </tr>
									</c:when>
									<c:otherwise>
										<tr><td colspan="8" align="center"> No payrolls found </td> </tr>
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