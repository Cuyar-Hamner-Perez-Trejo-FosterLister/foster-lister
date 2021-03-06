<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Volunteer Listing" />
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

    <div class="listing-container gradient mx-auto registration-card p-4">
        <div class="row">
            <div class="col-md-6">
                <img src="/images/Foster.gif" style="width: 60%; margin: 20%;">
            </div>
            <hr>
            <div class="col-md-6 my-auto">
                <h3>${volunteer.title}</h3>
                <p>${volunteer.date}</p>
                <p>${volunteer.description}</p>
                <p>${volunteer.contact}</p>
            </div>
        </div>

    </div>

    <jsp:include page="../partials/footer.jsp" />
    <jsp:include page="../partials/bootstrap-script.jsp" />
</body>
</html>
