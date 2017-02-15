<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Bill Receipt - Al Mehfal Restaurant</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
			
		<style type="text/css">
			body {
				margin: 5px;
				padding: 0px;
				font-family: Arial;
				font-size: 14px;
			}
			#table3 {
				width: auto;
				margin: 15px;
				border-spacing: 10px;
				padding: 10px;
				border: 1px solid #aaa;
				border-collapse: collapse;
				background: white;
				color: black;
			}
			#table3 tr th {
				padding: 5px;
				border: none;
				font-size: 15px;
				font-weight: bold;
				font-family: Arial;
			}
			#table3 tr td {
				padding: 5px;
				border: none;
				font-size: 13px;
				font-family: Arial;
			}
			#table3 tr td hr {
				border-color: #888;
			}
		</style>
	</head>
	
	<body>
		<h2>Bill Receipt</h2>
		<table id="table3">
			<tr>
				<td colspan="4" align="center">
					AL MEHFAL RESTAURANT<br />
					Customer Mobile: ${billFormat.mobile}<br />
				</td>
			</tr>
			<tr>
				<td colspan="4"><br /></td>
			</tr>
			<c:forEach items="${billFormat.bills}" var="orderForm">
				<tr>
					<td colspan="4">Bill ${orderForm.billNum} on ${orderForm.billDate}</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;<b>Item</b></td>
					<td><b>Price</b></td>
					<td><b>Quantity</b></td>
					<td align="right"><b>Amount</b>&nbsp;&nbsp;</td>
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
				<tr>
					<td colspan="4"><hr /></td>
				</tr>
				<tr>
					<td colspan="3" align="right">Total Amount:</td>
					<td align="right"><b>${orderForm.billAmount}</b>&nbsp;&nbsp;</td>
				</tr>
				<c:set var="discount" value="${orderForm.discount}" />
				<c:if test="${discount > 0}">
					<tr>
						<td colspan="3" align="right">Discount:</td>
						<td align="right"><b>${orderForm.discount}</b>&nbsp;&nbsp;</td>
					</tr>
					<tr>
						<td colspan="3" align="right">Total:</td>
						<td align="right"><b>${orderForm.billNetAmount}</b>&nbsp;&nbsp;</td>
					</tr>
				</c:if>
				<tr>
					<td colspan="4"><br /></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="3" align="right" style="font-size:18px;">Total Due Amount:</td>
				<td align="right" style="font-size:18px;"><b>${billFormat.totalBill}</b>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4"><br /><br /><br /></td>
			</tr>
			<c:forEach items="${billFormat.paidBills}" var="array">
				<tr>
					<td colspan="3" align="right">Amount paid on ${array[1]}:</td>
					<td align="right"><b>${array[0]}</b>&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4"><br /></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="3" align="right" style="font-size:18px;">Total Paid Amount:</td>
				<td align="right"><b style="font-size:18px;">${billFormat.totalPaidBill}</b>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4"><br /><br /><br /></td>
			</tr>
			<tr>
				<td colspan="3" align="right" style="font-size:20px;"> Final Bill: </td>
				<td align="right"><b style="font-size:18px;">${billFormat.totalBill - billFormat.totalPaidBill}</b></td>
			</tr>
		</table>
	</body>
</html>