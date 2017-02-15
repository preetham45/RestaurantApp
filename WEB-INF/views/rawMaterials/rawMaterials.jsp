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
		<title>Raw Materials - Al Mehfal Restaurant</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" href="web/css/screen.css" type="text/css" />
		<script src="web/js/jquery.min.js" type="text/javascript"></script>
		
		<script type="text/javascript">
			$(document).ready(function(){
				$(".nav ul").find('li').eq(1).attr('class','current');
			});
		</script>
		
			<link href="web/css/jquery.validation.css" rel="stylesheet" type="text/css" />
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
					border: 2px inset #cccccc;
				}
				input[type="text"].uneditable {
					width: 100%;
					height: 19px;
					line-height: 18px;
					background-color: #aaa;
					color: black;
					border: 2px inset #cccccc;
				}
				table {
					border-collapse: collapse;
					margin-left: 60px;
				}
				table tr th {
					border: 1px solid #fff;
					background: #629cd7;
					color: white;
					padding: 5px;
					text-align: center;
					font-size: 13px;
					line-height: 19px;
					font-weight: bold;
				}
				table tr td {
					padding-left: 8px;
					padding-right: 8px;
					padding-top: 4px;
					padding-bottom: 4px;
					vertical-align: middle;
					border: 1px solid #aaa;
				}
				table tr td.noBorder {
					border: none;
				}
				table tr td img {
					cursor: pointer;
				}
			</style>
			
			<script type="text/javascript">
				$(document).ready(function() {
					$(document).on("keyup","table tr:eq(-2) td input",function(event) {
						var index = $("table tr").length-3;
						$('<tr>' +
								'<td> <input type="text" name="materials['+index+'].id" class="validate[required]" /> </td>' +
								'<td> <input type="text" name="materials['+index+'].desc" class="validate[required]" /> </td>' +
								'<td> <input type="text" name="materials['+index+'].uom" class="validate[required]" /> </td>' +
								'<td> <img src="web/images/delete.png" width="18px" height="18px" /> </td>' +
						'</tr>').insertAfter($("table tr:eq(-2)"));
					});
					
					$("#addRow").click(function(event) {
						var index = $("table tr").length-3;
						$('<tr>' +
								'<td> <input type="text" name="materials['+index+'].id" class="validate[required]" /> </td>' +
								'<td> <input type="text" name="materials['+index+'].desc" class="validate[required]" /> </td>' +
								'<td> <input type="text" name="materials['+index+'].uom" class="validate[required]" /> </td>' +
								'<td> <img src="web/images/delete.png" width="18px" height="18px" /> </td>' +
						'</tr>').insertAfter($("table tr:eq(-2)"));
					});
					
					$(document).on("click", "table tbody tr td img", function(event) {
						var rowIndex = $('table tr').length - 4;
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
					
					$("#rawMaterials").validationEngine('attach', {
						onValidationComplete: function(form, status) {
							if(status == true) {
								if($('table tr').length <= 3) {
									alert("There should be atleast one item to order");
									return false;
								}
								var count = $('table tr').length();
								$('table tr').each(function(index) {
									if(index > 1 && index < (count-2)) {
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
								return true;
							}
							return false;
						},
						showOneMessage: true
					});
				});
			</script>
	</head>

	<body>
		<div id="wrapper">
			<jsp:include page="../header.jsp"></jsp:include>
			<div id="content">
				<div class="tabbed_area">
					<ul class="tabs">
						<li><a href='<c:url value="/${role}/rawMaterials" />' class="tab active">Raw Materials</a></li>
						<li><a href='<c:url value="/${role}/suppliers" />' class="tab">Suppliers</a></li>
						<li><a href='<c:url value="/${role}/purchases" />' class="tab">Purchases</a></li>
						<li><a href='<c:url value="/${role}/expenses" />' class="tab">Expenses</a></li>
						<li><a href='<c:url value="/${role}/employees" />' class="tab">Employees</a></li>
					</ul>
					<div class="content1">
							<br /><br /><h1 style="color:black;margin-left:30px;">Raw Materials Definition</h1><br /><br />
							<form method="post" name="rawMaterials" id="rawMaterials" action='<c:url value="/${role}/saveRawMaterials" />'>
								<table>
									<tr>
										<td colspan="4" align="right" class="noBorder"><a id="addRow" href="javascript:void(0)"> Add Row </a></td>
									</tr>
									<tr>
										<th align="center">&nbsp;&nbsp; Raw Material ID &nbsp;&nbsp;</th>
										<th align="center">&nbsp;&nbsp; Raw Material Description &nbsp;&nbsp;</th>
										<th align="center">&nbsp;&nbsp; Raw Material Uom &nbsp;&nbsp;</th>
										<th></th>
									</tr>
									<tr>
										<td><input type="text" name="materials[0].id" class="validate[required,minSize[2],maxSize[20]]" /></td>
										<td><input type="text" name="materials[0].desc" class="validate[required,minSize[2],maxSize[50]]" /></td>
										<td><input type="text" name="materials[0].uom" class="validate[required,minSize[2],maxSize[10]]" /></td>
										<td><img src="web/images/delete.png" width="18px" height="18px" /></td>
									</tr>
									<tr>
										<td colspan="4" align="center" class="noBorder"><br /> <input type="submit" value=" Submit " class="btn" /></td>
									</tr>
								</table>
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