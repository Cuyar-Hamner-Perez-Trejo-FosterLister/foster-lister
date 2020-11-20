<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Adopt" />
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
        <img src="${listing.imageUrl}">
        <h1>${listing.name}</h1>
        <p>${listing.type}</p>
        <p>${listing.breed}</p>
        <p>${listing.dob}</p>
        <p>${listing.gender}</p>
        <p>${listing.conditions}</p>
        <p>${listing.description}</p>
        <p>${listing.size}</p>
        <p>${listing.createdTime}</p>

        <c:choose>
            <c:when test="${sessionScope.user == null}">
                <p>Interested in adopting ${listing.name}? Create an account to make a request!</p>
                <button type="button" class="btn btn-secondary" onclick="redirect()">Create Account</button>
            </c:when>
            <c:when test="${sessionScope.user != null}">
                <p>Interested in adopting ${listing.name}? Make a request!</p>
                <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#ThankYouAdoptModalLong">Request to Adopt!</button>
            </c:when>
        </c:choose>

    </div>

    <!-- Modal -->
    <div class="modal fade" id="ThankYouAdoptModalLong" tabindex="-1" role="dialog" aria-labelledby="ThankYouAdoptModalLong" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ThankYouAdoptModalLongTitle">Thank you for making a request!</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Foster Lister will review your request and will get back to you in a few days.</p>
                    <p>If you have any questions please visit our <a href="#">FAQ Page</a> or email us at staff@fosterlister.com </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel Request</button>
                    <button type="button" class="btn btn-primary" onclick="makeRequest(${listing.id})">Send Request</button>
                </div>
            </div>
        </div>
    </div>



    <jsp:include page="../partials/footer.jsp" />
    <jsp:include page="../partials/bootstrap-script.jsp" />

    <script>
        const redirect = () => window.location.replace("/register");
        const makeRequest = (id) => window.location.replace("/requests?listing=" + id)
    </script>
</body>
</html>
