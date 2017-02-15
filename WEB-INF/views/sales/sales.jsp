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
		<title>Sales Page - Al Mehfal Restaurant</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="web/css/screen.css" />
		<link rel="stylesheet" type="text/css" href="web/css/sales.css" />
		<link rel="stylesheet" type="text/css" href="web/css/theme.default.css" />
		<script type="text/javascript" src="web/js/jquery.min.js"></script>
		<script type="text/javascript" src="web/js/jquery.tablesorter.js"></script>
		<!--[if lte IE 8]>
			<script type="text/javascript" src="web/js/excanvas.min.js"></script>
		<![endif]-->
		<script type="text/javascript" src="web/js/jquery.flot.min.js"></script>
		<script type="text/javascript" src="web/js/jquery.flot.categories.min.js"></script>
		
		<c:if test="${not billToPrint}">
			<link href="web/css/jquery.ui.css" rel="stylesheet" type="text/css" />
			<link href="web/css/jquery.ui.theme.css" rel="stylesheet" type="text/css" />
			<link href="web/css/jquery.validation.css" rel="stylesheet" type="text/css" />
			<script src="web/js/jquery.ui.js" type="text/javascript"></script>
			<script src="web/js/jquery.validation.js" type="text/javascript"></script>
			<script src="web/js/jquery.validation-en.js" type="text/javascript"></script>
		</c:if>
		<style type="text/css">
			#table3 {
				width: 430px;
				margin-left: 10px;
				margin-top: 15px;
				border-spacing: 10px;
				padding: 10px;
				border: 1px solid #aaa;
				border-collapse: collapse;
				color: #111;
			}
			#table3 tr td.border {
				padding: 4px;
				border-top: 1px solid #aaa;
				border-bottom: 1px solid #aaa;
				font-size: 13px;
				font-family: Arial;
			}
			#table3 tr td {
				padding: 4px;
				border: none;
				font-size: 13px;
				font-family: Arial;
			}
			#table3 tr td hr {
				border-color: #aaa;
			}
		</style>
	</head>

	<body>
		<div id="wrapper">
			<jsp:include page="../header.jsp"></jsp:include>
			<div id="content">
				<div class="cols2">
					<div class="box1">
						<c:choose>
							<c:when test="${billToPrint}">
								<h2> Bill Receipt </h2>
								<table id="table3">
									<tr>
										<td colspan="4" align="center">
											<b>AL MEHFAL RESTAURANT<br /> ${orderForm.billDate}<br />
											<c:if test="${orderForm.salesType eq 'Al-a-Carte'}">
												Table No.: <b>${orderForm.tableNum}</b> &nbsp;&nbsp;
											</c:if>Bill No.: ${orderForm.billNum}</b><br />
										</td>
									</tr>
									<tr><td colspan="4"><hr /></td></tr>
									<tr>
										<td>&nbsp;&nbsp;<b>Item</b></td>
										<td><b>Price</b></td>
										<td><b>Qty</b></td>
										<td align="right"><b>Amt</b>&nbsp;&nbsp;</td>
									</tr>
									<c:forEach items="${orderForm.orderedItems}" var="orderItem">
										<tr>
											<td>&nbsp;&nbsp;${orderItem.itemName}</td>
											<td>${orderItem.itemCost}</td>
											<td>${orderItem.quantity}</td>
											<c:set var="cost" value="${orderItem.quantity * orderItem.itemCost}" />
											<td align="right">${cost}&nbsp;&nbsp;</td>
										</tr>
									</c:forEach>
									<tr><td colspan="4"><hr /></td></tr>
									<tr>
										<td colspan="3" align="right"> Total Amount: </td>
										<td align="right"> <b>${orderForm.billAmount}</b>&nbsp;&nbsp; </td>
									</tr>
									<c:set var="discount" value="${orderForm.discount}"/>
									<c:if test="${discount > 0}">
										<tr>
											<td colspan="3" align="right"> Discount: </td>
											<td align="right"> <b>${orderForm.discount}</b>&nbsp;&nbsp; </td>
										</tr>
										<tr>
											<td colspan="3" align="right"> Total to Pay: </td>
											<td align="right"> <b>${orderForm.billNetAmount}</b>&nbsp;&nbsp; </td>
										</tr>
									</c:if>
									<tr><td colspan="4"><hr /></td></tr>
									<tr>
										<td colspan="4" align="center">
											<c:choose>
												<c:when test="${orderForm.billType eq 'Credit'}">
													<a class="btn" target="_blank" href='<c:url value="/${role}/printCreditBill" />?creditId=${orderForm.creditId}'>
														Print Complete Credit Bill Receipt
													</a>
												</c:when>
												<c:otherwise>
													<a class="btn" target="_blank" href='<c:url value="/${role}/printBill" />?billNum=${orderForm.billNum}'>Print Bill Receipt</a>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</table>
							</c:when>
							<c:otherwise>
								<h3>Restaurant Bills</h3><br />
								<form name="orderForm" id="orderForm" method="post" action='<c:url value="/${role}/saveOrder" />'>
									<table id="table1">
										<colgroup>
											<col id="col1" />
											<col id="col2" />
											<col id="col3" />
											<col id="col4" />
										</colgroup>
										<tr>
											<td align="right"> Bill No <b>:</b>&nbsp; </td>
											<td>
												<input class="uneditable" type="text" id="billNum" name="billNum" value="${orderForm.billNum}" readonly="readonly" />
											</td>
		
											<td align="right"> Bill Date <b>:</b>&nbsp; </td>
											<td>
												<input class="uneditable1" type="text" id="billDate" name="billDate" value="${orderForm.billDate}" readonly="readonly" />
											</td>
										</tr>
										<tr>
											<td align="right"> Bill Amount <b>:</b>&nbsp; </td>
											<td>
												<input class="uneditable" type="text" id="billAmount" name="billAmount" value="${orderForm.billAmount}" readonly="readonly" />
											</td>
											<td align="right"> Discount <b>:</b>&nbsp; </td>
											<td>
												<input type="text" class="validate[required,custom[number]]" id="billDiscount" name="discount" value="${orderForm.discount}" />
											</td>
										</tr>
										<tr>
											<td align="right"> Net Amount <b>:</b>&nbsp; </td>
											<td>
												<input class="uneditable" type="text" id="billNetAmount" name="billNetAmount" value="${orderForm.billNetAmount}" readonly="readonly" />
											</td>
											<td align="right"> Sales Type <b>:</b>&nbsp; </td>
											<td>
												<c:choose>
													<c:when test="${billToOpen}">
														<input type="text" class="uneditable" name="salesType" value="${orderForm.salesType}" readonly="readonly" />
													</c:when>
													<c:otherwise>
														<select name="salesType" id="salesType">
															<option selected="selected"> Al-a-Carte </option>
															<option> Parcel </option>
															<option> Bulk </option>
														</select>
														<script type="text/javascript">
															$(document).ready(function() {
																$("#salesType").val('${orderForm.salesType}');
																$("#salesType").change(function() {
																	var myvalue = $.trim($("#salesType").val());
																	
																	if(myvalue=='Parcel' || myvalue=='Bulk') {
																		$("#tableNum").attr('disabled', 'disabled');
																	}
																	else {
																		$("#tableNum").removeAttr('disabled');
																	}
																});
															});
														</script>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td align="right"> Created By <b>:</b>&nbsp; </td>
											<td>
												<input class="uneditable" type="text" name="createdBy" value="${orderForm.createdBy}" readonly="readonly" />
											</td>
											<td align="right"> Table# <b>:</b>&nbsp; </td>
											<td>
												<c:choose>
													<c:when test="${billToOpen}">
														<input type="text" class="uneditable" name="tableNum" value="${orderForm.tableNum}" />
													</c:when>
													<c:otherwise>
														<select name="tableNum" id="tableNum">
															<option selected="selected"> T01 </option>
															<option> T02 </option>
															<option> T03 </option>
															<option> T04 </option>
															<option> T05 </option>
															<option> T06 </option>
															<option> T07 </option>
															<option> T08 </option>
														</select>
														<script type="text/javascript">
															$("#tableNum").val('${orderForm.tableNum}');
														</script>
													</c:otherwise>
												</c:choose>
												<input type="hidden" id="creditId" name="creditId" />
												<input type="hidden" id="billType" name="billType" value="cash" />
												<input type="hidden" id="paidAmt" name="paidAmount" value="0.00" />
											</td>
										</tr>
									</table>
									<table id="table2" class="menuitems">
										<tr>
											<td class="noBorder" align="right" colspan="5"><br /><br />
												<div class="btn" id="newBill"> New Bill </div>
												<div class="btn" id="saveBill"> Save Bill </div>
												<div class="btn" id="cancelBill"> Cancel Bill </div>
												<div class="btn" id="printBill"> Print Bill </div>
												<div class="btn" id="openMenu"> Menu Items </div>
												<br /> <br />
											</td>
										</tr>
										<tr>
											<th> <br />Menu Item </th>
											<th> <br />Price </th>
											<th> <br />Quantity </th>
											<th> Bill Line<br />Amount </th>
											<th> <img src="web/images/remove.png" width="18px" height="18px" /> </th>
										</tr>
										<c:forEach items="${orderForm.orderedItems}" var="orderItem" varStatus="status">
											<tr>
												<td>
													<input type="text" id="tag" name="orderedItems[${status.index}].itemName" class="uneditable" value="${orderItem.itemName}" readonly="readonly" />
												</td>
												<td>
													<input class="uneditable" type="text" name="orderedItems[${status.index}].itemCost" value="${orderItem.itemCost}" readonly="readonly" />
												</td>
												<td>
													<input type="text" id="qty" class="validate[required,custom[integer]]" name="orderedItems[${status.index}].quantity" value="${orderItem.quantity}" />
												</td>
												<td>
													<c:set var="billLineAmt" value="${orderItem.itemCost * orderItem.quantity} "/>
													<input class="uneditable" type="text" value="${billLineAmt}" disabled="disabled" />
												</td>
												<td><img src="web/images/delete.png" width="18px" height="18px" /></td>
											</tr>
										</c:forEach>
									</table>
								</form>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="cols2">
					<div class="box2">
						<table width="100%">
							<tr>
								<td><h3> Current Bills </h3></td>
								<td align="right">
									<h4>
										<a target="_blank" href='<c:url value="/${role}/creditDetails" />'>Credit Reminder</a>
									</h4>
								</td>
							</tr>
						</table>
						<table class="tablesorter" id="currentBills">
							<thead>
								<tr>
									<th> Bill No. </th>
									<th> Bill Date </th>
									<th> Net Amount </th>
									<th> Table# </th>
									<th> </th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty pendingOrders}">
										<c:forEach items="${pendingOrders}" var="prevOrderForm">
											<c:choose>
												<c:when test="${orderForm.billNum != prevOrderForm.billNum}">
													<tr>
														<td> ${prevOrderForm.billNum} </td>
														<td> ${prevOrderForm.billDate} </td>
														<td> ${prevOrderForm.billNetAmount} </td>
														<td> ${prevOrderForm.tableNum} </td>
														<td> <input type="button" value="Open Order" class="button" id="openOrder" /> </td>
													</tr>
												</c:when>
											</c:choose>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5" align="center">
												No pending orders
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<table border="0" id="graphTable" width="100%">
							<tr>
								<td align="center"><br />
									<select name="month" id="month">
										<option value="0">All</option>
										<option value="1">Jan</option>
										<option value="2">Feb</option>
										<option value="3">Mar</option>
										<option value="4">Apr</option>
										<option value="5">May</option>
										<option value="6">June</option>
										<option value="7">July</option>
										<option value="8">Aug</option>
										<option value="9">Sept</option>
										<option value="10">Oct</option>
										<option value="11">Nov</option>
										<option value="12">Dec</option>
									</select>
									&nbsp; <input type="text" name="year" id="year" size="4" value="${year}" />
									&nbsp; <input type="button" value=" Get " id="update" class="button" />
								</td>
							</tr>
						</table><br />
						<div id="chart1"></div>
						<script type="text/javascript">
							$(function() {
					
								var data = ${sales};
								var options = {
									series: {
										bars: {
											show: true,
											barWidth: 0.1,
											align: "center"
										}
									},
									xaxis: {
										mode: "categories",
										tickLength: 0
									}
								};
								
								$.plot("#chart1", [ data ], options);
								$("#month").val('${month}');
								
								$("#update").click(function(){
									var m = $("#month").val();
									var y = $("#year").val();
									var url = '<c:url value="/${role}/salesByMonth" />?month='+m+'&year='+y;
									$.ajax({
										url: url,
										success: function(data1) {
											var obj = jQuery.parseJSON(data1);
											data = obj.sales;
											$.plot("#chart1", [ data ], options);
										}
									});
								});
							});
						</script>
					</div>
				</div>
			</div>
			<div id="footer">
				<div id="footer_info">
					<p>&copy; 2013, Al Mehfal Restaurant, All Rights Reserved</p>
				</div>
			</div>
		</div>
		
		<c:if test="${not billToPrint}">
			<div id="dishItems">
				<div id="accordion" style="display:none;">
					<c:forEach items="${dishItems}" var="cateory">
						<h3>${cateory.description}</h3>
						<div>
							<c:forEach items="${cateory.dishItems}" var="item">
								<div id="menuButton" class="${item.itemCost}"> ${item.itemName} </div>
							</c:forEach>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<div id="part1" title="Select billing method">
				Select: <select name="billing" id="billing">
						<option selected="selected"> Cash </option>
						<option> Credit </option>
				</select> <br /> <br />
				<span id="cashOrCredit">
				</span>
				<script type="text/javascript">
					$(document).ready(function() {
						$("#billing").change(function() {
							var myvalue = $.trim($(this).val());
							if(myvalue=="Credit") {
								$("span#cashOrCredit").html(
									'&nbsp; &nbsp; &nbsp; <input type="radio" name="grp" value="New" /> New Customer &nbsp; <br />' + 
									'&nbsp; &nbsp; &nbsp; <input type="radio" name="grp" value="Existing" checked /> Existing Customer');
							}
							else
								$("span#cashOrCredit").html('');
						});
					});
				</script>
			</div>
			
			<div id="part2" title="New Customer">
				<table>
					<tr>
						<td align="right"> Customer Name: </td>
						<td> <input type="text" id="name" class="validate[required]" /> </td>
					</tr>
					<tr>
						<td align="right"> Customer Address: </td>
						<td> <input type="text" id="address" class="validate[required]"/> </td>
					</tr>
					<tr>
						<td align="right"> Customer Mobile: </td>
						<td> <input type="text" id="mobile" class="validate[required]"/> </td>
					</tr>
					<tr>
						<td colspan="2" id="part2error">
						</td>
					</tr>
				</table>
			</div>
			
			<div id="part3" title="Existing Customer">
				<table>
					<tr>
						<td align="right"> Customer Mobile: </td>
						<td> <input type="text" id="verifyMobile" /> </td>
					</tr>
					<tr>
						<td colspan="2" id="part3error">
						</td>
					</tr>
				</table>
			</div>
			
			<div id="part4" title="Existing Customer">
				<div id="part4msg"></div> <br />
				Paid amount : <input type="text" id="acceptAmt" />
			</div>
			
			<script type="text/javascript">
				$(document).ready(function () {
					
					$("#part1").dialog({
						autoOpen: false,
						resizable: false,
						width: 300,
						modal: true,
						buttons: {
							Ok: function() {
								$(this).dialog("close");
								var myvalue1 = $.trim($("#billing").val());
								if(myvalue1=="Cash") {
									var myselect2 = document.getElementById("billing");
									var myvalue2 = myselect2.options[myselect2.selectedIndex].value;
									$("#billType").val(myvalue2);
									var url  = '<c:url value="/${role}/printOrder" />';
									$("form").attr('action', url);
									$("form").submit();
								}
								else {
									var value = $("input:radio[name=grp]:checked").val();
									if(value=="New")
										$("#part2").dialog("open");
									else if(value=="Existing")
										$("#part3").dialog("open");
								}
							},
							Cancel: function() {
								$(this).dialog("close");
							}
						}
					});
					
					$("#part2").dialog({
						autoOpen: false,
						resizable: false,
						width: 400,
						modal: true,
						buttons: {
							Save: function() {
								var cname = $("#name").val();
								var caddress = $("#address").val();
								var cmobile = $("#mobile").val();
								$.ajax({
									type: "POST",
									url: '<c:url value="/${role}/addCustomer" />',
									data: {
										name: cname,
										address: caddress,
										mobile: cmobile
									},
									success: function(msg) {
										$("#name").val(''); $("#address").val(''); $("#mobile").val('');
										var myselect3 = document.getElementById("billing");
										var myvalue3 = myselect3.options[myselect3.selectedIndex].value;
										var obj = jQuery.parseJSON(msg);
										if(obj.msg == undefined) {
											$("#part2error").html(obj.error);
										}
										else {
											$("#part2error").html('');
											$("#part2").dialog("close");
											$("#billType").val(myvalue3);
											$("#creditId").val(cmobile);
											var url  = '<c:url value="/${role}/printOrder" />';
											$("form").attr('action', url); $("form").submit();
										}
									},
									error: function(xhr, status, error) {
										$("#part2error").html(' <b>Request Status:</b> ' + xhr.status + 
												'<br /> <b>Status Text:</b> ' + xhr.statusText + 
												'<br /> <b>Response Text:</b> ' + xhr.responseText);
									}
								});
							},
							Back: function() {
								$(this).dialog("close");
								$("#part1").dialog("open");
							}
						}
					});
					
					$("#part3").dialog({
						autoOpen: false,
						resizable: true,
						width: 400,
						modal: true,
						buttons: {
							Check: function() {
								var cmobile = $("#verifyMobile").val();
								$.ajax({
									type: "POST",
									url: '<c:url value="/${role}/verifyCustomer" />',
									data: {
										verifyMobile: cmobile
									},
									success: function(msg) {
										var obj = jQuery.parseJSON(msg);
										if(obj.error == undefined) {
											$("#verifyMobile").val('');
											
											var bill1 = $("#billNetAmount").val();
											var total1 = parseFloat(obj.due) + parseFloat(bill1);
											var info = 'Name: ' + obj.name + '<br />' +
														'Mobile: ' + cmobile + '<br />' +
														'Prev. Due: ' + obj.due + '<br />' +
														'Present Bill: ' + bill1 + '<br />' +
														'Total Due: ' + total1;
											
											$("#part4msg").html(info);
											var myselect4 = document.getElementById("billing");
											var myvalue4 = myselect4.options[myselect4.selectedIndex].value;
											$("#billType").val(myvalue4);
											$("#creditId").val(cmobile);
											$("#part3").dialog("close");
											$("#part4").dialog("open");
										}
										else {
											$("#part3error").html(obj.error);
										}
									},
									error: function(xhr, status, error) {
										$("#part3error").html(' <b>Request Status:</b> ' + xhr.status + 
												'<br /> <b>Status Text:</b> ' + xhr.statusText + 
												'<br /> <b>Response Text:</b> ' + xhr.responseText);
									}
								});
							},
							Back: function() {
								$(this).dialog("close");
								$("#part1").dialog("open");
							}
						}
					});
					
					$("#part4").dialog({
						autoOpen: false,
						resizable: false,
						width: 400,
						modal: true,
						buttons: {
							Ok: function() {
								$(this).dialog("close");
								var paidAmt = $("#acceptAmt").val();
								$("#paidAmt").val(paidAmt);
								var url = '<c:url value="/${role}/printOrder" />';
								$("form").attr('action', url); $("form").submit();
								$(this).dialog("close");
							},
							Cancel: function() {
								$(this).dialog("close");
								$("#part1").dialog("open");
							}
						}
					});
					
					$("#dishItems").dialog({
						autoOpen: false,
						title: 'Menu Items',
						hide: 'slide',
						width:420,
						height: 280,
						closeOnEscape: true,
						resizable: true,
						modal: false,
						show: 'slide',
						open : function (event, ui) {
							$("#accordion").css('display','block');
						}
					});
					
					$("#dishItems").dialog("widget").draggable("option","containment","none");
					
					$("#accordion").accordion({
						collapsible: true,
						heightStyle: "content"
					});
					
					function calculateBill() {
						var sum = 0.00;
						$('.menuitems tr').each(function() {
							if(this.rowIndex > 1)
								var cost = 0;
								cost = $(this).find("td").eq(3).find('input').val();
								if(cost=='' || isNaN(cost))
									cost = 0.00;
								else
									cost = parseFloat(cost);
								sum += cost;
						});
						$('#billAmount').val(sum);
						var discount = $('#billDiscount').val();
						if(isNaN(discount))
							discount = 0;
						else
							discount = parseFloat(discount);
						$('#billNetAmount').val(sum - discount);
					}
					
					$(document).on("keyup", "input#billDiscount", function() {
						calculateBill();
					});
	
					$(document).on("keyup", "input#qty", function() {
						var quantity = $(this).val();
						var cost = $(this).parent().prev().find("input").eq(0).val();
						$(this).parent().next().find("input").eq(0).val(quantity*cost);
						calculateBill();
					});
					
					$("#orderForm").validationEngine('attach', {
						onValidationComplete: function(form, status) {
							if(status == true) {
								if($('.menuitems tr').length <= 2) {
									alert("There should be atleast one item to order");
									return false;
								}
								calculateBill();
								$('.menuitems tr').each(function(index) {
									if(index > 1) {
										var one = $(this).find("td").eq(0).find('input').eq(0);
										var newName = one.attr('name').replace(/\[[0-9]+\]/i, '[' + (index-2) + ']');
										one.attr('name', newName);
										var two = $(this).find("td").eq(1).find('input').eq(0);
										newName = two.attr('name').replace(/\[[0-9]+\]/i, '[' + (index-2) + ']');
										two.attr('name', newName);
										var three = $(this).find("td").eq(2).find('input').eq(0);
										newName = three.attr('name').replace(/\[[0-9]+\]/i, '[' + (index-2) + ']');
										three.attr('name', newName);
									}
								});
								if($.trim($("#billNum").val()) == '')
									$("#billNum").val(0);
								return true;
							}
							return false;
						},
						showOneMessage: true
					});
					
					$(document).on("click", "div#menuButton", function(event) {
						event.preventDefault();
						var value = $(this).attr('class');
						var name = $(this).html();
						var flag = false;
						$('.menuitems tr').each(function(index) {
							if(index > 1) {
								var itemData = $(this).find("td").eq(0).find('input').eq(0).val();
								if(itemData == name) {
									var itemDataQty = $(this).find("td").eq(2).find('input').eq(0).val();
									var Qty = 1;
									if(itemDataQty!='' || itemDataQty!=null)
										Qty = parseInt(itemDataQty) + 1;
									$(this).find("td").eq(2).find('input').eq(0).val(Qty);
									$(this).find("td").eq(3).find('input').eq(0).val(Qty*parseFloat(value));
									flag = true;
								}
							}
						});
						if(flag==false) {
							var index = $('.menuitems tr').length - 2;
							$(".menuitems")
								.find('tbody')
								.append('<tr>' +
											'<td> <input type="text" size="18" id="tag" ' + 
												'class="uneditable" ' +
												'value="' + name + '" ' +  
												'name="orderedItems[' + index + '].itemName" readonly /> ' +
											'</td>' +
											'<td> <input class="uneditable" type="text" ' + 
												'size="8" name="orderedItems[' + index + '].itemCost" ' +
												'value="' + value + '" ' +
												'readonly /> ' + 
											'</td>' +
											'<td> <input type="text" size="8" id="qty" '+ 
												'class="validate[required,custom[integer],min[1]]" ' +
												'value="1" ' +
												'name="orderedItems[' + index + '].quantity" /> ' + 
											'</td>' +
											'<td> <input class="uneditable" type="text" ' +
												'value="' + value + '" ' +
												'size="8" disabled /> ' + 
											'</td>' +
											'<td> <img src="web/images/delete.png" '+  
												'width="18px" height="18px" />' + 
											'</td>' +
										'</tr>');
						}
						calculateBill();
					});
					
					$(document).on("click", ".menuitems tbody tr td img", function(event) {
						var index = $('.menuitems tr').length - 2;
						if(index <= 0) {
							alert("Order must contain atleast one menu item");
						}
						else {
							var removeConfirm = confirm("Are you sure, do you want to remove?");
							if(removeConfirm == true) {
								var row = $(this).parent().parent();
								row.remove();
								calculateBill();
							}
						}
					});
					
					$(document).on("mousedown", "div#menuButton", function(event) {
						event.preventDefault();
						$(this).css({'border': '2px inset #cccccc'});
						$(this).css({'background': '#8fca10'});
					});
					
					$(document).on("mouseup", "div#menuButton", function(event) {
						event.preventDefault();
						$(this).css({'border': '2px outset #cccccc'});
						$(this).css({'background': '#d5d5d5'});
					});
					
					$("#openMenu").click(function(event) {
						event.preventDefault();
						$("#dishItems").dialog('option','position',[event.clientX, event.clientY]);
						$("#dishItems").dialog("open");
					});
					
					$("#saveBill").click(function() {
						$("form").submit();
					});
					
					$("#newBill").click(function() {
						var newBillConfirm = confirm("Do you want to save the changes in current order?");
						if(newBillConfirm == true)
							$("form").submit();
						else {
							var url = '<c:url value="/${role}/sales" />';
							window.top.location = url;
						}
					});
					
					$("#cancelBill").click(function() {
						var cancelBillConfirm = confirm("Do you want to cancel the order?");
						if(cancelBillConfirm == true) {
							var url = '<c:url value="/${role}/cancelOrder" />' + '?value=' + $("#billNum").val();
							window.top.location = url;
						}
					});
					
					$("#printBill").click(function() {
						var index = $('.menuitems tr').length - 2;
						if(index <= 0) {
							alert("Order must contain atleast one menu item");
						}
						else
							$("#part1").dialog("open");
					});
					
					$(document).on("click", "input#openOrder", function() {
						var openBillConfirm = confirm("Before opening a existing bill, check whether current bill is saved or not\nAre you sure, do you want to open the existing bill?");
						if(openBillConfirm == true) {
							var row = $(this).parent().parent();
							var value = row.find('td').eq(0).html();
							var url = '<c:url value="/${role}/openOrder" />' + '?bill=' + $.trim(value);
							window.top.location = url;
						}
					});
				});
			</script>
		</c:if>
		
		<script type="text/javascript">
			$(document).ready(function () {
				$("table").tablesorter({theme:'default', widgets:['zebra']});
				<c:if test="${not billToPrint}">
					$(".nav ul").find('li').eq(0).attr('class','current');
				</c:if>
			});
		</script>
	</body>
</html>