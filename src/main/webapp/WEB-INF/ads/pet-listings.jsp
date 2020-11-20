<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Dogs" />
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
<%--    <c:set var="listings" scope ="session" value ="${listings}"/>--%>

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

        <div class="container" id="index-listing">
            <c:forEach var="listing" items="${listings}">
                <div class="">
                    <div class="index-card border mx-3">
                        <a href="https://placeholder.com"><img src="http://via.placeholder.com/200"></a>
                        <div class="">
                            <p class="text-center">${listing.name}</p>
                            <p class="text-center">${listing.dob} • ${listing.breed}</p>
                        </div>
                        <div class="border-top">
                            <button type="button" class="btn btn-secondary" onclick="sendID(${listing.id})">More Info</button
                            <br>
                            <c:choose>
                                <c:when test="${sessionScope.user.admin == true}">
                                    <a href="/update-listing?listing=${listing.id}">Edit Listing</a>
                                    <a href="/delete-listing?listing=${listing.id}">Delete Listing</a>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>


    </div>

    <jsp:include page="/WEB-INF/partials/footer.jsp" />
    <jsp:include page="/WEB-INF/partials/bootstrap-script.jsp" />

    <script>
        const sendID = (id) => window.location.replace("/listing-info?listing=" + id);
    </script>

</body>
</html>
