<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta http-equiv="refresh" content="120" />
		<title> Order Display </title>
		<script type="text/javascript" src="web/js/jquery.min.js"></script>
		<style type="text/css">
			.myDiv {
				display: inline-block;
				list-style: none;
				margin: 5px;
				padding: 5px;
				border: 2px solid orange;
			}
			body {
				font-family: Arial;
				font-size: 17px;
			}
		</style>
		<script type="text/javascript">
			var currentTallest = 0;
			var currentRowStart = 0;
			var rowDivs = new Array();
			
			function setConformingHeight(el, newHeight) {
				el.data("originalHeight", (el.data("originalHeight") == undefined) ? (el.height()) : (el.data("originalHeight")));
				el.height(newHeight);
			}
			
			function getOriginalHeight(el) {
				return (el.data("originalHeight") == undefined) ? (el.height()) : (el.data("originalHeight"));
			}
			
			function columnConform() {
			
				$('.myDiv').each(function() {
					
					var $el = $(this);
					var topPosition = $el.position().top;
			
					if(currentRowStart != topPosition) {
						for(var currentDiv=0 ; currentDiv<rowDivs.length ; currentDiv++)
							setConformingHeight(rowDivs[currentDiv], currentTallest);
						
						rowDivs.length = 0;
						currentRowStart = topPosition;
						currentTallest = getOriginalHeight($el);
						rowDivs.push($el);
					}
					else {
						rowDivs.push($el);
						currentTallest = (currentTallest < getOriginalHeight($el)) ? (getOriginalHeight($el)) : (currentTallest);
					}
					
					for(var currentDiv=0; currentDiv<rowDivs.length ; currentDiv++)
						setConformingHeight(rowDivs[currentDiv], currentTallest);
				});
			}

			$(document).ready(function(){
				columnConform();
			});
			
			$(window).resize(function() {
				columnConform();
			});
		</script>
	</head>
	
	<body>
		<c:forEach items="${pendingOrders}" var="orderForm">
			<div class="myDiv">
				<b>Bill No:</b> ${orderForm.billNum} &nbsp; 
				<b>Table: </b> ${orderForm.tableNum} &nbsp; 
				<b>Type:</b>  ${orderForm.salesType} <br /> <br />
				<b>Items</b> <br />
				<table border="0">
					<c:forEach items="${orderForm.orderedItems}" var="orderedItems">
						<tr>
							<td align="right"> ${orderedItems.quantity} &nbsp; </td>
							<td align="left"> ${orderedItems.itemName} </td>
						</tr>
					</c:forEach>
				</table> 
			</div>
		</c:forEach>
	</body>
</html>