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

		<link rel="stylesheet" href="web/css/screen.css" type="text/css" media="screen" />
		<script type="text/javascript" src="web/js/jquery.min.js"></script>
		
		<style type="text/css">
			input[type="text"] {
				font-family: "Arial";
				font-size: 12px;
				height: 19px;
				line-height: 18px;
				color: black;
				background-color: white;
				border: 2px inset #555;
				margin-bottom: 5px;
				margin-right: 5px;
				
			}
			input[type="text"].uneditable {
				background: transparent;
				color: black;
				border: none;
			}
		</style>
		
		<script type="text/javascript">
			$(document).ready(function () {
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
					<div class="content1" style="color:black;"><br /><br />
						<form method="post" action='<c:url value="/${role}/savePayroll" />' name="payrolls" id="payrolls">
							<b>Payroll Month & Year : </b> &nbsp; &nbsp;
							<input type="text" name="month" value="${month}" style="width:30px;" class="uneditable" readonly /> &nbsp; &nbsp;
							<input type="text" name="year" value="${year}" style="width:30px;" class="uneditable" readonly />
							<br /> <br />
							<table>
								<tr>
									<td><b>Reg No.</b></td>
									<td><b>&nbsp; Name</b></td>
									<td><b>Salary</b></td>
									<td><b>Gross Pay</b></td>
									<td><b>Loan Deduction</b></td>
									<td><b>Other Deduction</b></td>
									<td><b>Net Salary</b></td>
									<td><b>Created By</b></td>
									<td><b>Created On</b></td>
								</tr>
								<c:choose>
									<c:when test="${not empty empList}">
										<c:forEach items="${empList}" var="emp" varStatus="status">
											<tr>
												<td> <input type="text" value="${emp.regNum}" name="payrolls[${status.index}].regNum" class="uneditable" style="width:40px;" readonly="readonly" /> </td>
												<td> <input type="text" value="${emp.name}" name="payrolls[${status.index}].name" class="uneditable" style="width:140px;" readonly="readonly" /> </td>
												<td> <input type="text" value="${emp.basicSalary}" name="payrolls[${status.index}].basicSalary" class="uneditable" style="width:100px;" readonly="readonly" /> </td>
												<td> <input type="text" name="payrolls[${status.index}].grossPay" style="width:100px;" /> </td>
												<td> <input type="text" name="payrolls[${status.index}].loanDeduction" style="width:100px;" /> </td>
												<td> <input type="text" name="payrolls[${status.index}].otherDeduction" style="width:100px;" /> </td>
												<td> <input type="text" name="payrolls[${status.index}].netSalary" style="width:100px;" /> </td>
												<td> <input type="text" class="uneditable" value="${user}" name="payrolls[${status.index}].createdBy" style="width:100px;" readonly="readonly" /> </td>
												<td> <input type="text" class="uneditable" value="${user}" name="payrolls[${status.index}].createdOn" style="width:100px;" readonly="readonly" /> </td>
											</tr>
										</c:forEach>
										<tr> <td colspan="8" align="center"> <br /><input type="submit" value=" Submit " class="btn" /> </td> </tr>
									</c:when>
									<c:otherwise>
										<tr><td colspan="8"> No Employees found </td> </tr>
									</c:otherwise>
								</c:choose>
							</table><br /><br />
						</form>
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