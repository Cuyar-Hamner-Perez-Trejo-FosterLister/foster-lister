<%--
  Created by IntelliJ IDEA.
  User: blossomperez
  Date: 11/20/20
  Time: 6:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="List of Requests" />
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
    <table class="table">
        <thead class="thead-light">
        <tr>
            <th scope="col">List ID</th>
            <th scope="col">Request Date</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach var="request" items="${requests}">
                <tr>
                    <td>${request.listingId}</td>
                    <td>${request.requestDate}</td>
                </tr>
            </c:forEach>
        </tbody>
        <jsp:include page="partials/footer.jsp" />
        <jsp:include page="partials/bootstrap-script.jsp" />
    </table>
</body>
</html>
