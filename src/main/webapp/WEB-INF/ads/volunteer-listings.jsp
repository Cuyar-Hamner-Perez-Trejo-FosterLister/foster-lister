<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Volunteer Opportunities" />
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

    <div class="container pt-4">
        <div class="row">
            <div class="col-md-4 card gradient">
                <div class="card-body">
                    <h1>Interested in volunteering?</h1>
                    <h4>Check out some of our volunteer opportunities.</h4>
                </div>
            </div>
            <div class="col-md-8">
                <div class="w-100 d-flex flex-row flex-wrap justify-content-center justify-content-md-start">
                    <c:forEach var="volunteer" items="${volunteers}">
                        <div class="">
                            <div class="index-card gradient d-flex flex-column pb-4">
                                <img class="listing-img" src="/images/Foster.gif" style="height: 200px; width: 100%">
                                <div class="text-container">
                                    <h4 class="text-center">${volunteer.title}</h4>
                                    <p class="text-center"><small>${volunteer.date}</small></p>
                                </div>
                                <c:choose>
                                    <c:when test="${sessionScope.user.admin == true}">
                                        <div class="text-center">
                                            <a href="/update-listing?listing=volunteer&id=${volunteer.id}" class="pr-3">Edit</a>
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
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

        <jsp:include page="../partials/footer.jsp" />
        <jsp:include page="../partials/bootstrap-script.jsp" />
    <script>
        const sendVolunteerID = (id) => window.location.replace("/volunteer-info?volunteer=" + id);
    </script>
</body>
