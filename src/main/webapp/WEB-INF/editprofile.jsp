<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: blossomperez
  Date: 11/18/20
  Time: 11:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Profile"/>
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
        <div class="card registration-card gradient">
            <div class="card-body">
                <h1>Edit Profile</h1>
                <form action="/update-user" method="POST">
                    <div class="form-group">
                        <label for="address">Edit Address</label>
                        <br>
                        <textarea class="form-control dark-form" id="address" name="address" rows="1" cols="100">${user.address}</textarea>
                    </div>
                    <div class="form-group">
                        <label for="phone">Edit Phone Number</label>
                        <input id="phone" name="phonenumber" class="form-control dark-form" type="text" value=${user.phoneNumber}>
                    </div>
                    <div class="form-group">
                        <label for="pets">Edit Number of Pets</label>
                        <input id="pets" name="pets" class="form-control dark-form" type="text" value=${user.numberOfPets}>
                    </div>
                    <div class="form-group">
                        <label for="password">Reset Password</label>
                        <input id="password" name="password" class="form-control dark-form" type="password" placeholder="Edit Password">
                    </div>
                    <div class="form-group">
                        <label for="confirm_password">Confirm Password</label>
                        <input id="confirm_password" name="confirm_password" class="form-control dark-form" type="password" placeholder="Confirm Password">
                    </div>

                    <input type="submit" class="btn btn-dark btn-block" value="Edit">
                    <input type="submit" class="btn btn-dark btn-block" value="Delete Profile">
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="partials/footer.jsp" />
    <jsp:include page="partials/bootstrap-script.jsp" />
</body>
</html>
