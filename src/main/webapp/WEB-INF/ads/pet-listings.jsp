<%--
  Created by IntelliJ IDEA.
  User: alexandra
  Date: 11/17/20
  Time: 11:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Dogs" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/user-navbar.jsp" />
    <div class="container">
        <!--Filter Container -->
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <h1>Filter Dogs</h1>
                    <form class="form-inline">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search Breed, Age, Size, or Gender" aria-label="Search Breed, Age, Size, or Gender" aria-describedby="search-button">
                            <div id ="search" class="input-group-prepend">
                                <span class="input-group-text" id="search-button">@</span>
                            </div>
                        </div>
                        <button type="button" class="btn btn-secondary btn-lg">Foster</button>
                        <button type="button" class="btn btn-secondary btn-lg">Adoption</button>
                    </form>
                </div>
            </div>
        </div>


        <c:forEach var="ad" items="${ads}">
            <div class="col-md-6">
                <h2>${ad.title}</h2>
                <p>${ad.description}</p>
            </div>
        </c:forEach>
    </div>

    <jsp:include page="/WEB-INF/partials/footer.jsp" />
    <jsp:include page="/WEB-INF/partials/bootstrap-script.jsp" />
</body>
</html>
