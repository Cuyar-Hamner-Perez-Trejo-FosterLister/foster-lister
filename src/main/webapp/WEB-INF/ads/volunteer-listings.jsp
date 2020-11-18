<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Volunteer Opportunities" />
    </jsp:include>
</head>
<body>
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
