<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <div class="container">
        <h1>Welcome, ${sessionScope.user.firstName}!</h1>
        <p>${user.email}</p
        <p>${user.address}</p
        <p>${user.phoneNumber}</p>
        <p>${user.numberOfPets}</p
    </div>

    <jsp:include page="partials/footer.jsp" />
    <jsp:include page="partials/bootstrap-script.jsp" />
</body>
</html>
