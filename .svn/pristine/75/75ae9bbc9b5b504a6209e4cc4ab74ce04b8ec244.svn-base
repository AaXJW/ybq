<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:if test="${pageContext.request.serverPort!=80||pageContext.request.serverPort!=443}"><c:set var="port" value=":${pageContext.request.serverPort}"/></c:if>
<c:set var="ctx" value="${pageContext.request.scheme}://${pageContext.request.serverName}${port}${pageContext.request.contextPath}"/>