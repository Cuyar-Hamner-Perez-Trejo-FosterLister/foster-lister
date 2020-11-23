<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
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

<%--    <div class="container">--%>
<%--        <h1>Welcome, ${sessionScope.user.firstName}!</h1>--%>
<%--        <p>${user.email}</p--%>
<%--        <p>${user.address}</p--%>
<%--        <p>${user.phoneNumber}</p>--%>
<%--        <p>${user.numberOfPets}</p--%>
<%--    </div>--%>

    <div class="container">
        <div class="card gradient">
            <div class="card-body">
                <div class="profile-picture">

                </div>
                <div class="profile-info">
                    <p>${user.firstName}</p>
                    <p>${user.lastName}</p>
                    <p>${user.email}</p>
                    <p>${user.address}</p
                    <p>${user.phoneNumber}</p>
                    <p>${user.numberOfPets}</p
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="partials/footer.jsp" />
    <jsp:include page="partials/bootstrap-script.jsp" />
</body>
</html>
