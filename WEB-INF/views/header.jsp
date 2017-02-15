<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<sec:authorize ifAnyGranted="ROLE_USER">
	<c:set var="role" value="user"></c:set>
</sec:authorize>
<sec:authorize ifAnyGranted="ROLE_MANAGER">
	<c:set var="role" value="manager"></c:set>
</sec:authorize>
<sec:authorize ifAnyGranted="ROLE_ADMIN">
	<c:set var="role" value="admin"></c:set>
</sec:authorize>
<sec:authentication property="principal" var="principal" />
			<div id="headerBg"></div>
			<div id="header">
				<div class="logo"><img src="web/images/logo.png" width="260px" height="100px" /></div>
				<div class="userInfo">
					<p>Welcome! <a href="javascript:void(0);">${principal.username}</a></p>
					<p>
						<label>Your Role:</label> ${role}
					</p>
				</div>
				<div class="nav">
					<jsp:include page="menu.jsp"></jsp:include>
				</div>
			</div>