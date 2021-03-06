<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
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
        <div class="card registration-card login-size gradient mx-auto">
            <div class="card-body registration-body">
                <c:choose>
                    <c:when test = "${sessionScope.validAttempt == false}">
                        <h1 class="lg-font">Login</h1>
                        <p>Invalid Email or Password. Please try again.</p>
                    </c:when>
                    <c:otherwise>
                        <h1 class="lg-font">Login</h1>
                    </c:otherwise>
                </c:choose>
                <form action="/login" method="POST">
                    <div class="form-group">
                        <input id="email" name="email" class="form-control" type="text" placeholder="email" required>
                    </div>
                    <div class="form-group">
                        <input id="password" name="password" class="form-control" type="password" placeholder="password" required>
                    </div>
                    <input type="submit" class="btn btn-dark btn-block" value="Log In">
                </form>
            </div>
        </div>
    </div>

    <jsp:include page="partials/footer.jsp" />
    <jsp:include page="partials/bootstrap-script.jsp" />
</body>
</html>
