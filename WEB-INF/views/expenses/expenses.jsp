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
		<link href="web/css/jquery.validation.css" rel="stylesheet" type="text/css" />
		
		<script type="text/javascript" src="web/js/jquery.min.js"></script>
		<script src="web/js/jquery.validation.js" type="text/javascript"></script>
		<script src="web/js/jquery.validation-en.js" type="text/javascript"></script>
		
		<style type="text/css">
			input[type="text"] {
				width: 100%;
				font-family: "Arial";
				font-size: 12px;
				height: 19px;
				line-height: 18px;
				color: black;
				background-color: white;
				border: 2px inset #555;
				margin-bottom: 5px;
			}
		</style>
	</head>
	
	<body>
		<div id="wrapper">
			<jsp:include page="../header.jsp"></jsp:include>
			<div id="content">
				<div class="tabbed_area">
					<ul class="tabs">
						<li><a href='<c:url value="/${role}/rawMaterials" />' class="tab">Raw Materials</a></li>
						<li><a href='<c:url value="/${role}/suppliers" />' class="tab">Suppliers</a></li>
						<li><a href='<c:url value="/${role}/purchases" />' class="tab">Purchases</a></li>
						<li><a href='<c:url value="/${role}/expenses" />' class="tab active">Expenses</a></li>
						<li><a href='<c:url value="/${role}/employees" />' class="tab">Employees</a></li>
					</ul>
					<div class="content1" style="padding-left: 30px;color:black;">
						<form method="post" action='<c:url value="/${role}/${url}" />' id="expenses" name="expenses">
							<br /><br /><h1>Daily Expenses</h1><br /><br />
							<table style="margin-left:30px;">
								<tr>
									<td align="right">Expense Head&nbsp; : &nbsp;</td>
									<td> <input type="hidden" name="expId" value="${expenses.expId}" />
										<input class="validate[required]" type="text" name="expHead" value="${expenses.expHead}" />
									</td>
								</tr>
								<tr>
									<td align="right">Expense Sub Head&nbsp; : &nbsp;</td>
									<td>
										<input class="validate[required]" type="text" name="expSubHead" value="${expenses.expSubHead}" />
									</td>
								</tr>
								<tr>
									<td align="right">Expense Details&nbsp; : &nbsp;</td>
									<td>
										<input class="validate[required]" type="text" name="expDetails" value="${expenses.expDetails}" />
									</td>
								</tr>
								<tr>
									<td align="right">Expense Amount&nbsp; : &nbsp;</td>
									<td>
										<input class="validate[required,custom[number]]" type="text" name="expAmount" value="${expenses.expAmount}" />
									</td>
								</tr>
								<tr>
									<td align="right">Expense Date&nbsp; : &nbsp;</td>
									<td>
										<input class="validate[required,custom[date]]" id="date1" type="text" name="expDate" value="${expenses.expDate}" />
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center"><br />
										<input type="submit" value="Submit" class="btn" />
									</td>
							</table>
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
		
		<script type="text/javascript">
			$(document).ready(function() {
				$(".nav ul").find('li').eq(1).attr('class','current');
				
				$("#expenses").validationEngine('attach',{
					onValidationComplete : function(form, status) {
						if (status == true) {
							return true;
						}
						return false;
					},
					showOneMessage: true
				});
			});
		</script>
	</body>
</html>