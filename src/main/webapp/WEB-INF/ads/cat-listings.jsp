<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Cats" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/user-navbar.jsp" />
    <!--Filter Container -->
    <div class="container">
        <div class="card">
            <div class="card-body">
                <h1>Filter Cats</h1>
                <form class="form-inline">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search Breeds, Age or Gender" aria-label="Search Breeds, Age or Gender" aria-describedby="search-button">
                        <div id ="cat-search" class="input-group-prepend">
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
</body>
</html>
