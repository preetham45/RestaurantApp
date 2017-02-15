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
		<title>Purchases Page - Al Mehfal Restaurant</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		
		<link rel="stylesheet" href="web/css/screen.css" type="text/css" />
		<link href="web/css/jquery.validation.css" rel="stylesheet" type="text/css" />
		<link href="web/css/jquery.ui.css" rel="stylesheet" type="text/css" />
		<link href="web/css/theme.default.css" rel="stylesheet" type="text/css" />
		
		<script src="web/js/jquery.min.js" type="text/javascript"></script>
		<script src="web/js/jquery.tablesorter.js" type="text/javascript"></script>
		<script src="web/js/jquery.ui.js" type="text/javascript"></script>
		<script src="web/js/jquery.validation.js" type="text/javascript"></script>
		<script src="web/js/jquery.validation-en.js" type="text/javascript"></script>
		
		<style type="text/css">
			#table1 {
				border: none;
				border-collapse: collapse;
				margin-left: 30px;
			}
			#table1 tr td {
				padding: 3px;
				border: none;
				font-size: 12px;
			}
			#table1 tr td input[type="text"] {
				font-family: "Arial";
				font-size: 12px;
				height: 19px;
				line-height: 18px;
				color: black;
				background-color: white;
				margin-bottom: 5px;
				border: 2px inset #777;
			}
			#table1 tr td input[type="text"].uneditable {
				background: transparent;
				color: black;
				border: none;
			}
			div#menuButton {
				display: inline-block;
				color: black;
				text-align: center;
				border: 2px outset #cccccc;
				background: #d5d5d5;
				pointer: cursor;
				font-size: 12px;
				font-family: Arial;
				cursor: pointer;
			}
			div#menuButton:hover {
				background: #b5b5b5;
			}
			#table2 {
				min-width: 600px;
				margin-left: 30px;
				border: 1px solid #aaa;
				border-collapse: collapse;
			}
			#table2 tr th {
				background: #629cd7;
				color: white;
				text-align: center;
				font-size: 13px;
				line-height: 19px;
				font-weight: bold;
			}
			#table2 tr td {
				padding: 2px;
				border: 1px solid #aaa;
			}
			#table2 tr td.noBorder {
				border: none;
			}
			#table2 tr td img {
				cursor: pointer;
			}
			#table2 tr td input[type="text"] {
				font-family: "Arial";
				font-size: 12px;
				height: 19px;
				line-height: 18px;
				color: black;
				background-color: white;
				border: 2px inset #cccccc;
			}
			#table2 tr td input[type="text"].uneditable {
				background: transparent;
				color: black;
				border: none;
			}
			#table4 {
				border-collapse: collapse;
			}
			#table4 tr td,#table4 tr th {
				padding: 5px;
				text-align: left;
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
						<li><a href='<c:url value="/${role}/purchases" />' class="tab active">Purchases</a></li>
						<li><a href='<c:url value="/${role}/expenses" />' class="tab">Expenses</a></li>
						<li><a href='<c:url value="/${role}/employees" />' class="tab">Employees</a></li>
					</ul>
					<div class="content1" style="padding-left: 30px;color: black;">
						<br /><br /><h1>New Purchases</h1><br /><br />
						<form name="purchases" id="purchases" method="post" action='<c:url value="/${role}/savePurchases" />'>
							<table id="table1">
								<tr>
									<td align="right">GRN <b>:</b> &nbsp;</td>
									<td><input class="uneditable" type="text" name="grp" value="${purchases.grnNo}" readonly="readonly" /></td>
									<td align="right">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Invoice Date <b>:</b> &nbsp;</td>
									<td><input type="text" id="invoiceDate" name="invoiceDate" value="${purchases.invoiceDate}" class="validate[required]" readonly="readonly" /></td>
								</tr>
								<tr>
									<td align="right">Date of Purchase <b>:</b> &nbsp;</td>
									<td><input type="text" id="purchaseDate" name="purchaseDate" class="validate[required]" readonly="readonly" /></td>
									<td align="right">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Paid Amount <b>:</b> &nbsp; </td>
									<td><input class="validate[required]" type="text" name="paidAmount" /></td>
								</tr>
								<tr>
									<td align="right">Supplier# <b>:</b> &nbsp;</td>
									<td>
										<input type="text" name="supplierNum" id="supplierNum" class="validate[required]" placeHolder="SUPPLIER_NO" readonly="readonly" />
										<div id="menuButton">&nbsp; ... &nbsp;</div>
										<input type="text" name="supplierName" id="supplierName" class="validate[required]" placeHolder="SUPPLIER_NAME" readonly="readonly" />
									</td>
									<td align="right">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Invoice Amount <b>:</b> &nbsp; </td>
									<td><input type="text" id="invoiceAmount" value="0" class="uneditable" name="invoiceAmount" readonly="readonly" /></td>
								</tr>
								<tr>
									<td align="right">Invoice No. <b>:</b> &nbsp;</td>
									<td><input type="text" name="invoiceNum" class="validate[required]" /></td>
									<td align="right">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Created On <b>:</b> &nbsp; </td>
									<td><input type="text" class="uneditable" name="createdOn" value="${purchases.createdOn}" readonly="readonly" /></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td align="right">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Created By <b>:</b> &nbsp; </td>
									<td><input type="text" name="createdBy" class="uneditable" value="${purchases.createdBy}" readonly="readonly" /></td>
								</tr>
							</table>
							<br /> <br />
							<table id="table2">
								<tr>
									<td colspan="6" align="right" class="noBorder" style="padding-top:5px;padding-bottom:5px;">
										<input id="open" type="button" class="btn" value="Raw Materials" /> 
										&nbsp; &nbsp; <input type="submit" class="btn" value="Save" />
									</td>
								</tr>
								<tr>
									<th>Raw<br />Marerial ID</th>
									<th>Raw Marerial<br />Description</th>
									<th>Unit of<br />Measure</th>
									<th><br />Quantity</th>
									<th><br />Amount</th>
									<th></th>
								</tr>
								<tr>
									<td></td><td></td><td></td><td></td>
									<td><input type="text" class="uneditable" id="totalAmt" name="totalAmount" readonly="readonly" /></td>
									<td> &nbsp; &nbsp; &nbsp; &nbsp;</td>
								</tr>
							</table>
						</form>
						<br /><br />
					</div>
				</div>
			</div>
			<div id="footer">
				<div id="footer_info">
					<p>&copy; 2013, Al Mehfal Restaurant, All Rights Reserved</p>
				</div>
			</div>
		</div>
		
		<div id="dialog">
			<table id="table4" class="tablesorter">
				<thead>
					<tr>
						<th>Supplier No.</th>
						<th>Supplier Name</th>
						<th>Invoice Amount</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty amounts}">
							<c:forEach items="${amounts}" var="data">
								<tr>
									<td>${data.supplierNum}</td>
									<td>${data.supplierName}</td>
									<td>${data.amount}</td>
									<td>${data.invoiceDate}</td>
									<td><a id="selectSupplier" href="javascript:void(0)"> Select </a></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4" align="center">No supplier exists</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	
		<div id="dialog1">
			<table id="table4" class="tablesorter">
				<thead>
					<tr>
						<th>Raw Material ID</th>
						<th>Raw Material Name</th>
						<th>Unit of Measure</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty materials}">
							<c:forEach items="${materials}" var="data1">
								<tr>
									<td>${data1.id}</td>
									<td>${data1.desc}</td>
									<td>${data1.uom}</td>
									<td>
										<a id="selectSupplier" href="javascript:void(0)"> Select </a>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4" align="center">No raw material exists</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	
		<script type="text/javascript">
			$(document).ready(function() {
				$(".tablesorter").tablesorter({theme:'default', widgets:['zebra']});
				$(".nav ul").find('li').eq(1).attr('class','current');
				
				$("#invoiceDate").datepicker({
					dateFormat: 'yy-mm-dd',
					changeMonth: true,
					changeYear: true,
					showWeek: true,
					firstDay: 1
				});
				
				$("#purchaseDate").datepicker({
					dateFormat: 'yy-mm-dd',
					changeMonth: true,
					changeYear: true,
					showWeek: true,
					firstDay: 1
				});
				
				$("#dialog").dialog({
					autoOpen: false,
					title: 'Suppliers List',
					hide: 'slide',
					width: 450,
					height: 350,
					closeOnEscape: true,
					resizable: true,
					modal: false,
					show: 'slide',
					open : function (event, ui) {
						$("#accordion").css('display','block');
					}
				});
				$("#dialog").dialog("widget").draggable("option","containment","none");
				
				$("#dialog1").dialog({
					autoOpen: false,
					title: 'Raw Material List',
					hide: 'slide',
					width: 450,
					height: 350,
					closeOnEscape: true,
					resizable: true,
					modal: false,
					show: 'slide',
					open : function (event, ui) {
						$("#accordion").css('display','block');
					}
				});
				$("#dialog1").dialog("widget").draggable("option","containment","none");
				
				$(document).on("click","#dialog #selectSupplier", function(event) {
					var cols = $(this).parent().parent().find('td');
					var supplierNum = $.trim(cols.eq(0).html());
					var supplierName = $.trim(cols.eq(1).html());
					var invoiceAmount = $.trim(cols.eq(2).html());
					var invoiceDate = $.trim(cols.eq(3).html());
					
					$("#supplierNum").val(supplierNum);
					$("#supplierName").val(supplierName);
					$("#invoiceAmount").val(invoiceAmount);
					$("#invoiceDate").val(invoiceDate);
				});
				
				$(document).on("click", "#dialog1 #selectSupplier", function(event) {
					var cols = $(this).parent().parent().find('td');
					var id = $.trim(cols.eq(0).html());
					var desc = $.trim(cols.eq(1).html());
					var uom = $.trim(cols.eq(2).html());
					
					var flag = false;
					var count = $("#table2 tr").length;
					$('#table2 tr').each(function(index) {
						if(index > 1 && index < count-1) {
							var itemData = $(this).find("td").eq(1).find('input').eq(0).val();
							if(itemData == desc)
								flag = true;
						}
					});

					if(flag==false) {
						var index = $("#table2 tr").length-3;
						$('<tr>' +
							'<td> <input type="text" name="materials['+index+'].rawMaterialId" value="' + id + '" class="validate[required]" /> </td>' +
							'<td> <input type="text" name="materials['+index+'].rawMaterialDesc" value="' + desc + '" class="validate[required]" /> </td>' +
							'<td> <input type="text" name="materials['+index+'].rawMaterialUom" value="' + uom + '" class="validate[required]" /> </td>' +
							'<td> <input type="text" name="materials['+index+'].rawMaterialQty" class="validate[required,customer[integer]]" /> </td>' +
							'<td> <input type="text" id="materialAmount" name="materials['+index+'].rawMaterialAmount" class="validate[required,custom[number]]" /> </td>' +
							'<td> <img src="web/images/delete.png" width="20px" height="20px" /> </td>' +
						'</tr>').insertAfter($("#table2 tr:eq(-2)"));
					}
				});
				
				$("#table1 td div#menuButton").click(function(event) {
					$("#dialog").dialog('option','position',[event.clientX, event.clientY]);
					$("#dialog").dialog("open");
				});
				
				$("#open").click(function(event) {
					$("#dialog1").dialog('option','position',[event.clientX, event.clientY]);
					$("#dialog1").dialog("open");
				});
				
				$(document).on("mousedown", "div#menuButton", function(event) {
					$(this).css({'border': '2px inset #cccccc'});
					$(this).css({'background': '#8fca10'});
				});
	
				$(document).on("mouseup", "div#menuButton", function(event) {
					$(this).css({'border': '2px outset #cccccc'});
					$(this).css({'background': '#d5d5d5'});
				});
				
				$(document).on("click", "#table2 tr td img", function(event) {
					var rowIndex = $('#table2 tr').length - 4;
					if(rowIndex <= 0) {
						alert("Must contain atleast one raw material details");
					}
					else {
						var removeConfirm = confirm("Are you sure do you want to remove?");
						if(removeConfirm == true) {
							var row = $(this).parent().parent();
							row.remove();
						}
					}
				});
				
				$("#purchases").validationEngine('attach', {
					onValidationComplete: function(form, status) {
						if(status == true) {
							if($('#table2 tr').length <= 3) {
								alert("There should be atleast raw material");
								return false;
							}
							var count = $('#table2 tr').length();
							$('#table2 tr').each(function(index) {
								if(index >= 1 && index < (count-2)) {
									var one = $(this).find("td").eq(0).find('input').eq(0);
									var newName = one.attr('name').replace(/\[[0-9]+\]/i, '[' + (index-2) + ']');
									one.attr('name', newName);

									var two = $(this).find("td").eq(2).find('input').eq(0);
									newName = two.attr('name').replace(/\[[0-9]+\]/i, '[' + (index-2) + ']');
									two.attr('name', newName);

									var three = $(this).find("td").eq(3).find('input').eq(0);
									newName = three.attr('name').replace(/\[[0-9]+\]/i, '[' + (index-2) + ']');
									three.attr('name', newName);
									
									var four = $(this).find("td").eq(4).find('input').eq(0);
									newName = four.attr('name').replace(/\[[0-9]+\]/i, '[' + (index-2) + ']');
									three.attr('name', newName);
									
									var five = $(this).find("td").eq(5).find('input').eq(0);
									newName = five.attr('name').replace(/\[[0-9]+\]/i, '[' + (index-2) + ']');
									three.attr('name', newName);
								}
							});
							return true;
						}
						return false;
					},
					showOneMessage: true
				});
				
				function calculateTotal() {
					var count = $('#table2 tr').length;
					var total = 0.0;
					$('#table2 tr').each(function(index) {
						if(index >= 1 && index < (count-1)) {
							var n = parseFloat($(this).find('td').eq(4).find('input').eq(0).val());
							if(isNaN(n))
								n = 0.0;
							total += n;
						}
					});
					
					$("#totalAmt").val(total);
				}
				
				$(document).on("keyup","#table2 #materialAmount", function() {
					calculateTotal();
				});
			});
		</script>
	</body>
</html>