<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!"/>
    </jsp:include>
</head>
<body>
<jsp:include page="../partials/navbar.jsp"/>
<div class="container">
    <h1>Ad Listings!</h1>
    <h2>Hi, ${sessionScope.get("username")}</h2>
    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h1>${ad.title}</h1>
            <p>${ad.description}</p>
        </div>
    </c:forEach>
</div>
</body>
</html>