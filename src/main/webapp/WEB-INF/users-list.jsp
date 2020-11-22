<%--
  Created by IntelliJ IDEA.
  User: blossomperez
  Date: 11/20/20
  Time: 12:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="List of Users" />
    </jsp:include>
</head>
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
            <th scope="col">First</th>
            <th scope="col">Last</th>
            <th scope="col">Address</th>
            <th scope="col">Phone</th>
            <th scope="col">Email</th>
            <th scope="col"># of Pets</th>
            <th scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>

            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <td>${user.address}</td>
                    <td>${user.phoneNumber}</td>
                    <td>${user.email}</td>
                    <td>${user.numberOfPets}</td>
                    <c:choose>
                        <c:when test="${user.admin == false}">
                            <form action="/delete-user" method="POST">
                                <input type="hidden" value="${user.id}" name="userId">
                            <td><input type="submit" class="btn btn-primary btn-block" value="Delete Profile"></td>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <div></div>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <jsp:include page="partials/footer.jsp" />
    <jsp:include page="partials/bootstrap-script.jsp" />
</body>
</html>
