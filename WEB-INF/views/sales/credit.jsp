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
		<title>Credit Details - Al Mehfal Restaurant</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="web/css/screen.css" />
		<link rel="stylesheet" type="text/css" href="web/css/theme.default.css" />
		<link href="web/css/jquery.ui.css" rel="stylesheet" type="text/css" />
		<link href="web/css/jquery.ui.theme.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="web/js/jquery.min.js"></script>
		<script type="text/javascript" src="web/js/jquery.ui.js"></script>
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
	</head>

	<body>
		<div id="wrapper">
			<jsp:include page="../header.jsp"></jsp:include>
			<div id="content">
				<a class="hyperlink" href='<c:url value="/${role}/sales" />'>Sales</a><label class="labelSlash">/</label><label class="labelText">Credit Details</label><br />
				<table class="tablesorter">
					<thead><tr>
						<th> Name </th>
						<th> Mobile </th>
						<th> Address </th>
						<th> Due </th>
						<th></th>
						<th></th>
					</tr></thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty list}">
								<c:forEach items="${list}" var="array">
									<tr>
										<c:forEach items="${array}" var="item">
											<td> ${item} </td>
										</c:forEach>
										<td> <div class="btn" id="pay"> Pay </div> </td>
										<td> <a class="btn" target="_blank" href='<c:url value="/${role}/printCreditBill" />?creditId=${array[1]}'>Bill Receipt</a> </td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="6" align="center">No credit customer exists</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<div id="footer">
				<div id="footer_info">
					<p>&copy; 2013, Al Mehfal Restaurant, All Rights Reserved</p>
				</div>
			</div>
		</div>
		
		<div id="part1" title="Pay Due Amount">
			<form id="payForm" name="payForm" method="post" action='<c:url value="/${role}/payBill" />'>
				<table border="0">
					<tr>
						<td align="right"> Customer Name : </td>
						<td id="custName"></td>
					</tr>
					<tr>
						<td align="right"> Customer Mobile : </td>
						<td id="custMobile"></td>
					</tr>
					<tr>
						<td align="right"> Due : </td>
						<td id="dueAmount"></td>
					</tr>
					<tr>
						<td align="right"> Paid Amount : </td>
						<td> <input type="hidden" name="mobile" id="mobile" />
							<input type="text" name="paidAmount" id="paidAmount" /> </td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<input type="submit" value=" Pay " />
						</td>
					</tr>
				</table>
			</form>
		</div>
		
		<script type="text/javascript">
			$(document).ready(function () {
				$("table").tablesorter({theme:'default', widgets:['zebra']});
				
				$("#part1").dialog({
					autoOpen: false,
					resizable: false,
					width: 400,
					modal: true
				});
				
				$(document).on("click", "div#pay", function() {
					var row1 = $(this).parent().parent();
					$("#custName").html(row1.find('td').eq(0).html());
					$("#custMobile").html(row1.find('td').eq(1).html());
					$("#mobile").val(row1.find('td').eq(1).html());
					$("#dueAmount").html(row1.find('td').eq(3).html());
					$("#part1").dialog("open");
				});
			});
		</script>
	</body>
</html>