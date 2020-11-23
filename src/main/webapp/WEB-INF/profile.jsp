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

    <div class="profile-container gradient mx-auto registration-card justify-content-center p-4">
        <div class="mx-auto">
            <img class="profile-picture" src="https://fer-uig.glitch.me?uuid=777">
        </div>
        <div class="profile-info text-center pt-4">
            <h3>${user.firstName} ${user.lastName}</h3>
            <hr>
            <p>Email: <span class="profile-content">${user.email}</span></p>
            <hr>
            <p>Address: <span class="profile-content">${user.address}</span></p>
            <hr>
            <p>Phone Number: <span class="profile-content">${user.phoneNumber}</span></p>
            <hr>
            <p>Number of Pets: <span class="profile-content">${user.numberOfPets}</span></p>
        </div>
    </div>

    <jsp:include page="partials/footer.jsp" />
    <jsp:include page="partials/bootstrap-script.jsp" />
</body>
</html>
