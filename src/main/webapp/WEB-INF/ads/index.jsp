<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/user-navbar.jsp" />

    <div class="container">
        <h1>Here Are all the ads!</h1>

            <c:forEach var="listing" items="${listings}">
                <div class="card" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="image of dog">
                <div class="card-body">
                    <p class="card-text">${listing.name}</p>
                    <p class="card-text">${listing.dob}</p>
                    <p class="card-text">${listing.breed}</p>
                </div>
                </div>
            </c:forEach>

    </div>

    <jsp:include page="/WEB-INF/partials/footer.jsp" />
    <jsp:include page="/WEB-INF/partials/bootstrap-script.jsp" />
</body>
</html>
