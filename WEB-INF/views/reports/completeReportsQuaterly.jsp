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
		<link href="web/css/theme.default.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="web/js/jquery.min.js"></script>
		<script type="text/javascript" src="web/js/jquery.tablesorter.js"></script>
		<!--[if lte IE 8]>
			<script type="text/javascript" src="web/js/excanvas.min.js"></script>
		<![endif]-->
		<script type="text/javascript" src="web/js/jquery.flot.min.js"></script>
		<script type="text/javascript" src="web/js/jquery.flot.categories.min.js"></script>
		
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
			#chart1 {
				width: 400px;
				height: 300px;
			}
		</style>
		
		<script type="text/javascript">
			$(document).ready(function(){
				$(".nav ul").find('li').eq(2).attr('class','current');
				$("#table1").tablesorter({theme:'default', widgets:['zebra']});
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
						<li><a href='<c:url value="/${role}/payrolls" />' class="tab">Payrolls</a></li>
						<li><a href='<c:url value="/${role}/completeReports" />' class="tab active">Consolidated Reports</a></li>
					</ul>
					<div class="content1" style="color:black;padding-top:30px;">
						<ul class="tabs">
							<li><a href='<c:url value="/${role}/completeReportsMonthly" />' class="tab">Monthly Reports</a></li>
							<li><a href='<c:url value="/${role}/completeReportsQuaterly" />' class="tab active">Quaterly Reports</a></li>
							<li><a href='<c:url value="/${role}/completeReportsHalfYearly" />' class="tab">Half Yearly Reports</a></li>
							<li><a href='<c:url value="/${role}/completeReportsAnnually" />' class="tab">Annual Reports</a></li>
						</ul>
						<div class="content1" style="color:black;padding-top:40px;padding-left: 50px;">
							<form action='<c:url value="/${role}/reportQuartely" />' method="post">
								Select: <select name="month" id="month">
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
								</select> &nbsp to &nbsp; <span id="month1">Mar</span>
								<script type="text/javascript">
									var months = ['Mar','Apr','May','June','July','Aug','Sept','Oct','Nov','Dec'];
									var m1 = '${r.month}';
									$("#month1").html(months[m1-1]);

									if(m1<=9)
										m1 = '0' + m1;
									$("select").val(m1);
									$("select").change(function(){
										var x = parseInt($(this).val());
										$("#month1").html(months[x-1]);
									});
								</script>
								&nbsp; &nbsp; Year: &nbsp; <input type="text" style="width:70px;" name="year" value="${r.year}" />
								&nbsp; &nbsp; <input type="submit" value=" Get Reports " />
							</form><br /><br /><br />
							
							<c:if test="${not empty r.reports}">
								<table style="width:auto;" align="center"><tr>
									<td>
										<div id="chart1"></div>
										<script type="text/javascript">
											$(function() {
									
												var data = ${r.graphData};
												var options = {
													series: {
														bars: {
															show: true,
															barWidth: 0.3,
															align: "center"
														}
													},
													xaxis: {
														mode: "categories",
														tickLength: 0
													}
												};
												
												$.plot("#chart1", [ data ], options);
											});
										</script>
									</td>
								</tr></table> <br /><br />
								<h3>Supplier's Due : ${r.totalSuppliersDue}</h3><br />
								<table id="table1">
									<thead><tr>
										<th>Month</th>
										<th>Sales Amount</th>
										<th>Purchases Amount</th>
										<th>Expenses Amount</th>
										<th>Payrolls</th>
									</tr></thead>
									<tbody>
										<c:forEach items="${r.reports}" var="report">
											<tr>
												<c:forEach items="${report}" var="data">
													<td>${data}</td>
												</c:forEach>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<td></td>
											<th>${r.totalSalesAmount}</th>
											<th>${r.totalPurchasesAmount}</th>
											<th>${r.totalExpensesAmount}</th>
											<th>${r.totalPayrollAmounts}</th>
										</tr>
									</tfoot>
								</table>
								<br /><br />
								<h1> Profit: ${r.finalAmount}</h1>
							</c:if> <br /> <br />
						</div>
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