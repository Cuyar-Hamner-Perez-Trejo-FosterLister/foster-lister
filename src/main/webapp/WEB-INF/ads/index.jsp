<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
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

    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1 class="display-4">Welcome to Foster Lister</h1>
            <p class="lead">lorem ipsum</p>
        </div>
    </div>

    <div class="container">
        <h2>Available Pets</h2>
    </div>

    <div class="container" id="pet-index-listing">
        <c:forEach var="listing" items="${listings}" begin="0" end="3">
            <div class="">
                <div class="index-card border mx-3">
                    <img src="${listing.imageUrl}" style="height: 200px; width: 200px">
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
    <br>
    <div class="container">
        <h2>Volunteer Opportunities</h2>
    </div>
    <div class="container" id="volunteer-index-listing">
        <c:forEach var="volunteer" items="${volunteers}" begin="0" end="3">
            <div class="">
                <div class="index-card border mx-3">
                    <a href="https://placeholder.com"><img src="http://via.placeholder.com/200"></a>
                    <div class="">
                        <p class="text-center">${volunteer.title}</p>
                        <p class="text-center">${volunteer.date}</p>
                    </div>
                    <c:choose>
                        <c:when test="${sessionScope.user.admin == true}">
                            <div class="border-top">
                                <a href="/update-listing?listing=volunteer&id=${volunteer.id}}">Edit Listing</a>
                                <a href="/delete-listing?listing=volunteer&id=${volunteer.id}">Delete Listing</a>
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </c:forEach>
    </div>



    <jsp:include page="/WEB-INF/partials/footer.jsp" />
    <jsp:include page="/WEB-INF/partials/bootstrap-script.jsp" />

        <script>
            const sendID = (id) => window.location.replace("/listing-info?listing=" + id);
        </script>
</body>
</html>
