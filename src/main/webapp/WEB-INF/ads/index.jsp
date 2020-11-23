<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
    <%--Navigation Bar--%>
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
        <div class="container" id="jumbotron-container">
            <h1 class="display-4">Welcome to Foster Lister</h1>
            <p class="lead">Helping local shelters connect with potential adopters and fosters.</p>
            <p class="lead">Founded in 2020</p>
            <p class="lead">Pet Lovers Welcome</p>
        </div>
    </div>

    <div class="container">
        <div>
            <h2 class="mt-4 lg-font text-center text-md-left">Available Pets</h2>
        </div>

        <div id="pet-index-listing">
            <div class="w-100 d-flex flex-row flex-wrap justify-content-center justify-content-md-start">
            <c:forEach var="listing" items="${listings}" begin="0" end="3">
                    <div class="index-card gradient d-flex flex-column pb-4">
                        <img class="listing-img" src="${listing.imageUrl}" style="height: 200px; width: 100%">
                        <div class="text-container">
                            <h5 class="text-center">${listing.name}</h5>
                            <p class="text-center">${listing.dob} • ${listing.breed}</p>
                        </div>
                            <c:choose>
                                <c:when test="${sessionScope.user.admin == true}">
                                    <div class="text-center">
                                    <a href="/update-listing?listing=${listing.id}" class="pr-3">Edit</a>
                                    <a href="/delete-listing?listing=${listing.id}">Delete</a>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="text-center">
                                        <button type="button" class="btn btn-dark button" onclick="sendID(${listing.id})">More Info</button>
                                        <br>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                    </div>
            </c:forEach>
            </div>
        </div>
        <br>


        <div class="container">
            <h2 class="lg-font text-center text-md-left">Volunteer Opportunities</h2>
        </div>

        <div id="volunteer-index-listing">
            <div class="w-100 d-flex flex-row flex-wrap justify-content-center justify-content-md-start">
                <c:forEach var="volunteer" items="${volunteers}" begin="0" end="3">
                    <div class="index-card gradient d-flex flex-column pb-4">
<%--                        <img class="listing-img" src="${listing.imageUrl}" ">--%>
                        <img class="listing-img" src="http://via.placeholder.com/200">
                        <div class="text-container">
                            <h5 class="text-center">${volunteer.title}</h5>
                            <p class="text-center">${volunteer.date}</p>
                        </div>
                            <c:choose>
                                <c:when test="${sessionScope.user.admin == true}">
                                <div class="text-center">
                                    <a href="/update-listing?listing=volunteer&id=${volunteer.id}}" class="pr-3">Edit</a>
                                    <a href="/delete-listing?listing=volunteer&id=${volunteer.id}">Delete</a>
                                </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="text-center">
                                        <button type="button" class="btn btn-dark button" onclick="sendVolunteerID(${volunteer.id})">More Info</button>
                                        <br>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>


    <jsp:include page="/WEB-INF/partials/footer.jsp" />
    <jsp:include page="/WEB-INF/partials/bootstrap-script.jsp" />

        <script>
            const sendID = (id) => window.location.replace("/listing-info?listing=" + id);
            const sendVolunteerID = (id) => window.location.replace("/volunteer-info?volunteer=" + id);
        </script>


</body>
</html>
