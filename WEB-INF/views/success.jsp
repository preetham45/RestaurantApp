<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	alert('${message}');
	top.window.location='<c:url value="${url}" />';
</script>