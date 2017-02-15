<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<sec:authorize ifAnyGranted="ROLE_USER">
	<jsp:forward page="/user/sales"></jsp:forward>
</sec:authorize>

<sec:authorize ifAnyGranted="ROLE_MANAGER">
	<jsp:forward page="/manager/sales"></jsp:forward>
</sec:authorize>

<sec:authorize ifAnyGranted="ROLE_ADMIN">
	<jsp:forward page="/admin/sales"></jsp:forward>
</sec:authorize>