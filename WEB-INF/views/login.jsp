<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<title>AL MEHFAL Restaurant</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		
		<link rel="stylesheet" href="web/css/jquery.vegas.css" type="text/css" />
		<link rel="stylesheet" href="web/css/styles.css" type="text/css" />
		
		<script type="text/javascript" src="web/js/jquery.min.js"></script>
		<script type="text/javascript" src="web/js/jquery.vegas.min.js"></script>
		
		<script type="text/javascript">
			$( function() {
				$.vegas( 'slideshow', {
					delay: 8000,
					backgrounds: [
						{ src: 'web/images/bkg/al-mehfal (1).jpg',  fade: 3000 },
						{ src: 'web/images/bkg/al-mehfal (2).jpg',  fade: 3000 },
						{ src: 'web/images/bkg/al-mehfal (3).jpg',  fade: 3000 },
						{ src: 'web/images/bkg/al-mehfal (4).jpg',  fade: 3000 },
						{ src: 'web/images/bkg/al-mehfal (5).jpg',  fade: 3000 },
						{ src: 'web/images/bkg/al-mehfal (6).jpg',  fade: 3000 },
						{ src: 'web/images/bkg/al-mehfal (7).jpg',  fade: 3000 },
						{ src: 'web/images/bkg/al-mehfal (8).jpg',  fade: 3000 },
						{ src: 'web/images/bkg/al-mehfal (9).jpg',  fade: 3000 },
						{ src: 'web/images/bkg/al-mehfal (10).jpg', fade: 3000 },
						{ src: 'web/images/bkg/al-mehfal (11).jpg', fade: 3000 },
						{ src: 'web/images/bkg/al-mehfal (12).jpg', fade: 3000 },
						{ src: 'web/images/bkg/al-mehfal (13).jpg', fade: 3000 },
						{ src: 'web/images/bkg/al-mehfal (14).jpg', fade: 3000 }
					]
				})('overlay');
				
				$("#menu_wrap").fadeTo("fast", 0.80);
				$("#main_wrap").fadeTo("fast", 0.80);
				$("#footer").fadeTo("fast", 0.80);
		    });
		</script>
		
		<style type="text/css">
			#table1 {
				padding: 15px;
				width: 270px;
				font-size: 16px;
				font-weight: normal;
				background: black;
				border: 1px thin #ccc;
			}
			#table1 td {
				width: 270px;
			}
			#loginTitle {
				padding-bottom: 15px;
				font-size: 16px;
				height: 16px;
				text-align: right;
			}
			#loginId,#loginPwd {
				font-size: 13px;
			}
			#loginMsg {
				text-align: center;
				font-size: 13px;
				margin-bottom: 8px;
			}
			#loginIdInput input,#loginPwdInput input {
				width: 100%;
				height: 24px;
				font-size: 16px;
				line-height: 24px;
				border: 1px solid #999;
				outline: medium none;
				box-shadow: 0px 1px 2px #aaa inset;
				margin-bottom: 8px;
				padding-left: 2px;
			}
			#loginIdInput input:focus,#loginPwdInput input:focus {
				border: 1px solid #8769ed;
			}
		</style>
	</head>
	
	<body>
		<div id="wrapper">
			<div id="menu_wrap">
				<div id="menu">
					<div id="logo">
						<h1>
							<a href="#home" class="logo_image menubtn">Al Mehfal Restaurant</a>
						</h1>
					</div>
					
					<ul id="navbar">
						<li class="top_nav"><a id="blog" href="#menu" class="menubtn">
								Menu<span>Delicious Hyderabadi Cuisine</span>
						</a></li>
						<li class="top_nav"><a id="contact" href="#about" class="menubtn">
							About<span>Contact + Other Information</span>
						</a></li>
					</ul>
					
					<div id="restinfo">
						<h2 class="padtop" id="phone">
							<span style="font-size: 12px;">Call:</span> 07-2223700
						</h2>
						<h4 class="padtop" style="color: #ccc">12PM Noon to Midnight</h4>
						<h4 class="padtop" style="font-size: 11px;">Oman Road, Shell Pump Area, Ras Al Khaimah</h4>
					</div>
				</div>
				
				<div id="hide_menu">
					<a href="#" class="menu_visible">Hide menu</a>
					<div class="menu_tooltip">
						<p>Hide the navigation</p>
					</div>
				</div>
			</div>
			
			<div id="main_wrap">
				<div id="homepg" class="maincontent">
					<h2 class="section_title">Al-Mehfal Restaurant</h2>
					<div id="content" style="width: 280px; float: right;">
						<form id="login_form" method="post"
							action="<c:url value="/validate" />">
							<table id="table1">
								<tr>
									<td id="loginTitle">Portal Login</td>
								</tr>
								<tr>
									<td id="loginId">Login ID:</td>
								</tr>
								<tr>
									<td id="loginIdInput"><input type="text" name="username"
										id="username" /></td>
								</tr>
								<tr>
									<td id="loginPwd">Password</td>
								</tr>
								<tr>
									<td id="loginPwdInput"><input type="password"
										name="password" id="password" /></td>
								</tr>
								<tr>
									<td id="loginMsg">
										<c:if test="${not empty param.error}">
											<font color="#ed2836">
												Login error: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
											</font>
										</c:if>
									</td>
								</tr>
								<tr>
									<td align="right"><input type="image"
										src="web/images/login.gif" /></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				
				<div id="menupg" class="maincontent">
					<h2 class="section_title">Menu</h2>
					<div id="content" class="content_full_width">
						<table id="hor-minimalist-b" summary="Menu">
						</table>
					</div>
				</div>
				
				<div id="aboutpg" class="maincontent">
					<h2 class="section_title">About</h2>
					<div id="content" class="content_full_width"></div>
				</div>
			</div>
			
			<div id="footer">
				<div id="footer_info">
					<p class="copyright">&copy; 2013, Al Mehfal Restaurant, All
						Rights Reserved</p>
				</div>
			</div>
		</div>
		
		<script type="text/javascript" src="web/js/custom.js"></script>
	</body>
</html>