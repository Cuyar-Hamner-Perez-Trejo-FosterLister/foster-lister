<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Adopt" />
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

    <img src="${listing.imageUrl}">
    <h1>${listing.name}</h1>
    <p>${listing.type}</p>
    <p>${listing.breed}</p>
    <p>${listing.dob}</p>
    <p>${listing.gender}</p>
    <p>${listing.conditions}</p>
    <p>${listing.description}</p>
    <p>${listing.size}</p>
    <p>${listing.createdTime}</p>


<jsp:include page="../partials/footer.jsp" />
<jsp:include page="../partials/bootstrap-script.jsp" />
</body>
</html>
