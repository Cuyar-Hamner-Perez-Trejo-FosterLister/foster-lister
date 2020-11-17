<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/user-navbar.jsp" />
    <div class="container">
        <h1>Login</h1>
        <form action="/login" method="POST">
            <div class="form-group">
                <input id="email" name="email" class="form-control" type="text" placeholder="email">
            </div>
            <div class="form-group">
                <input id="password" name="password" class="form-control" type="password" placeholder="password">
            </div>
            <input type="submit" class="btn btn-primary btn-block" value="Log In">
        </form>
    </div>
</body>
</html>
