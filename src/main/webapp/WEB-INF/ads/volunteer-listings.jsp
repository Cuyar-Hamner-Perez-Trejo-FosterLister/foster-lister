<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Volunteer Opportunities" />
    </jsp:include>
</head>
<body>

    <c:choose>
        <c:when test = "${sessionScope.user == null}">
            <jsp:include page="/WEB-INF/partials/guest-navbar.jsp" />
        </c:when>
        <c:when test = "${sessionScope.user.admin == false}">
            <jsp:include page="/WEB-INF/partials/user-navbar.jsp" />
        </c:when>
        <c:when test = "${sessionScope.user.admin == true}">
            <jsp:include page="/WEB-INF/partials/admin-navbar.jsp" />
        </c:when>
    </c:choose>

    <div class="container">
        <c:forEach var="volunteer" items="${volunteers}">
            <div class="col-md-6">
<%--                <img src="${volunteer.image_url}" alt="Icon">--%>
            </div>
            <div class="col-md-6">
                <h2>${volunteer.title}</h2>
                <p>${volunteer.description}</p>
                <p>${volunteer.contact}</p>
                <p><small>${volunteer.date}</small></p>
            </div>
        </c:forEach>
    </div>
</body>
