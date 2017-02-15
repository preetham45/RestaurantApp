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
		<title>Employees - Al Mehfal Restaurant</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />

		<link rel="stylesheet" href="web/css/screen.css" type="text/css" media="screen" />
		<link href="web/css/jquery.ui.css" rel="stylesheet" type="text/css" />
		<link href="web/css/jquery.ui.theme.css" rel="stylesheet" type="text/css" />
		<link href="web/css/jquery.validation.css" rel="stylesheet" type="text/css" />
		
		<script type="text/javascript" src="web/js/jquery.min.js"></script>
		<script src="web/js/jquery.ui.js" type="text/javascript"></script>
		<script src="web/js/jquery.validation.js" type="text/javascript"></script>
		<script src="web/js/jquery.validation-en.js" type="text/javascript"></script>
		
		<style type="text/css">
			input[type="text"] {
				width: 150px;
				font-family: "Arial";
				font-size: 12px;
				height: 19px;
				line-height: 18px;
				color: black;
				background-color: white;
				border: 2px inset #888;
				margin-bottom: 5px;
			}
			input[type="text"].uneditable {
				background: transparent;
				color: black;
				border: none;
			}
		</style>
		
		<script type="text/javascript">
			$(document).ready(function(){
				$("#employee").validationEngine('attach', {
					onValidationComplete: function(form, status) {
						return status;
					},
					showOneMessage: true
				});
				$(".nav ul").find('li').eq(1).attr('class','current');
			});
		</script>
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
						<li><a href='<c:url value="/${role}/expenses" />' class="tab">Expenses</a></li>
						<li><a href='<c:url value="/${role}/employees" />' class="tab active">Employees</a></li>
					</ul>
					<div class="content1" style="color:black;padding-left:30px;">
						<br /><br /><h2> Employee Details </h2><br /><br />
						<form method="post" action='<c:url value="/${role}/${url}" />' name="employee" id="employee">
							<table style="margin-left:30px;">
								<tr>
									<td align="right" style="width:200px;"> Reg No.&nbsp; : &nbsp; </td>
									<td> <input type="text" name="regNum" value="${emp.regNum}" class="uneditable" readonly="readonly" /> </td>
									<td align="right" style="width:200px"> Local Contact Number&nbsp; : &nbsp; </td>
									<td> <input type="text" name="localContactNum" class="validate[required,minSize[3],maxSize[20]]" value="${emp.localContactNum}" /> </td>
								</tr>
								<tr>
									<td align="right" style="width:200px;"> Name&nbsp; : &nbsp; </td>
									<td> <input type="text" name="name" class="validate[required,minSize[3],maxSize[50]]" /> </td>
									<td align="right" style="width:200px"> International Contact Number&nbsp; : &nbsp; </td>
									<td> <input type="text" name="internationalContactNum" value="${emp.internationalContactNum}" class="validate[required,minSize[3],maxSize[20]]" /> </td>
								</tr>
								<tr>
									<td align="right" style="width:200px;"> Gender&nbsp; : &nbsp; </td>
									<td> <select name="gender">
											<option> Male </option>
											<option> Female </option>
										</select>
									</td>
									<td align="right" style="width:200px;"> Visa No.&nbsp; : &nbsp; </td>
									<td> <input type="text" name="visaNum" value="${emp.visaNum}" class="validate[required,minSize[3],maxSize[40]]" /> </td>
								</tr>
								<tr>
									<td align="right" style="width:200px;"> Date of Birth&nbsp; : &nbsp; </td>
									<td> <input type="text" name="dateOfBirth" value="${emp.dateOfBirth}" class="validate[required,custom[date]]" /> </td>
									<td align="right" style="width:200px"> Visa Expiry Date&nbsp; : &nbsp; </td>
									<td> <input type="text" name="visaExpiryDate" value="${emp.visaExpiryDate}" class="validate[required,custom[date]]" /> </td>
								</tr>
								<tr>
									<td align="right" style="width:200px;"> Date of Joining&nbsp; : &nbsp; </td>
									<td> <input type="text" name="dateOfJoining" value="${emp.dateOfJoining}" class="validate[required,custom[date]]" /> </td>
									<td align="right" style="width:200px;"> Health Card Expiry Date 1&nbsp; : &nbsp; </td>
									<td> <input type="text" name="healthCardExpiryDate" value="${emp.healthCardExpiryDate}" class="validate[required,custom[date]]" /> </td>
								</tr>
								<tr>
									<td align="right" style="width:200px;"> Passport No.&nbsp; : &nbsp; </td>
									<td> <input type="text" name="passportNum" value="${emp.passportNum}" class="validate[required,minSize[3],maxSize[40]]" /> </td>
									<td align="right" style="width:200px;"> Health Card Expiry Date 2&nbsp; : &nbsp; </td>
									<td> <input type="text" name="healthCardExpiryDate2" value="${emp.healthCardExpiryDate2}" class="validate[required,custom[date]]" /> </td>
								</tr>
								<tr>
									<td align="right" style="width:200px"> Passport Expiry Date&nbsp; : &nbsp; </td>
									<td> <input type="text" name="passportExpiryDate" value="${emp.passportExpiryDate}" class="validate[required,custom[date]]" /> </td>
								</tr>
								<tr>
									<td colspan="4"> <br /> <h2> Bank Details </h2> </td>
								</tr>
								<tr>
									<td align="right" style="width:200px;"> Bank Name&nbsp; : &nbsp; </td>
									<td> <input type="text" name="bankName" value="${emp.bankName}" class="validate[required,minSize[3],maxSize[50]]" /> </td>
									<td align="right" style="width:200px;"> Branch Name&nbsp; : &nbsp; </td>
									<td> <input type="text" name="branchName" value="${emp.branchName}" class="validate[required,minSize[3],maxSize[30]]" /> </td>
								</tr>
								<tr>
									<td align="right" style="width:200px;"> Account No.&nbsp; : &nbsp; </td>
									<td> <input type="text" name="accountNum" value="${emp.accountNum}" class="validate[required,minSize[3],maxSize[30]]" /> </td>
									<td align="right" style="width:200px;"> Basic Salary&nbsp; : &nbsp; </td>
									<td> <input type="text" name="basicSalary" value="${emp.basicSalary}" class="validate[required,custom[number]]" /> </td>
								</tr>
								<tr>
									<td colspan="2"> <br /> <h2> Address </h2> </td>
									<td colspan="2"> <br /> <h2> &nbsp; &nbsp; &nbsp; Login Details </h2> </td>
								</tr>
								<tr>
									<td align="right" style="width:200px;"> Address Line 1&nbsp; : &nbsp; </td>
									<td> <input type="text" name="addressLine1" value="${emp.addressLine1}" class="validate[required,minSize[3],maxSize[80]]" /> </td>
									<td align="right" style="width:200px;"> Username&nbsp; : &nbsp; </td>
									<td> <input type="text" name="username" value="${emp.username}" class="validate[required,minSize[3],maxSize[20]]" /> </td>
								</tr>
								<tr>
									<td align="right" style="width:200px;"> Address Line 2&nbsp; : &nbsp; </td>
									<td> <input type="text" name="addressLine2" value="${emp.addressLine2}" class="validate[required,minSize[3],maxSize[80]]"  /> </td>
									<td align="right" style="width:200px;"> Password&nbsp; : &nbsp; </td>
									<td> <input type="text" name="password" value="${emp.password}" class="validate[required,minSize[3],maxSize[20]]" /> </td>
								</tr>
								<tr>
									<td align="right" style="width:200px;"> Address Line 3&nbsp; : &nbsp; </td>
									<td> <input type="text" name="addressLine3" value="${emp.addressLine3}" class="validate[required,minSize[3],maxSize[20]]" /> </td>
									<td align="right" style="width:200px;"> Role&nbsp; : &nbsp; </td>
									<td>
										<select name="role" class="validate[required]">
											<option value="ROLE_USER"> Waiter </option>
											<option value="ROLE_CLEANER"> Cleaner </option>
											<option value="ROLE_MANAGER"> Manager </option>
											<option value="ROLE_ADMIN"> Admin </option>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="4" align="center">
										<br /><input type="submit" class="btn" name="Submit" />
									</td>
								</tr>
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
	</body>
</html>