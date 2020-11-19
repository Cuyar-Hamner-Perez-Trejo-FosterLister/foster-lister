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

    <div id="volunteer-listing">
        <c:forEach var="volunteer" items="${volunteers}">
            <div class="">
                <div class="index-card border mx-3">
                    <a href="https://placeholder.com"><img src="http://via.placeholder.com/200"></a>
                    <div class="">
                        <h4 class="text-center">${volunteer.title}</h4>
                        <p class="text-center"><small>${volunteer.date}</small></p>
                    </div>
                    <div class="border-top">
                        <button type="button" class="btn btn-secondary">More Info</button>
                    </div>
                </div>
            </div>
        </c:forEach>


    </div>
</body>
