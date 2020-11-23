<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Fosters" />
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

    <div class="listing-container gradient mx-auto registration-card p-4">
        <div>
            <img src="${listing.imageUrl}" style="width: 60%; margin: 10% 20%">
        </div>
        <hr>
        <div class="row">
            <div class="pt-2 col-md-6">
                <h1>${listing.name}</h1>
                <hr>
                <p>${listing.type}</p>
                <hr>
                <p>Breed: ${listing.breed}</p>
                <hr>
                <p>DOB: ${listing.dob}</p>
                <hr>
                <p>Gender: ${listing.gender}</p>
                <hr>
                <p>Medical Conditions: ${listing.conditions}</p>
                <hr>
                <p>Size: ${listing.size}</p>
            </div>
            <div class="pt-4 col-md-6">
                <p>${listing.description}</p>
                <hr>
                <p>Litter Size: ${listing.litterSize}</p>
                <hr>
                <p>Foster Duration: ${listing.fosterDuration}</p>
                <hr>
                <c:choose>
                    <c:when test="${sessionScope.user == null}">
                        <p>Interested in fostering ${listing.name}? Create an account to make a request!</p>
                        <button type="button" class="btn btn-secondary" onclick="redirect()">Create Account</button>
                    </c:when>
                    <c:when test="${sessionScope.user != null}">
                        <p>Interested in fostering ${listing.name}? Make a request!</p>
                        <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#ThankYouFosterModalLong">Request to Foster!</button>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="ThankYouFosterModalLong" tabindex="-1" role="dialog" aria-labelledby="ThankYouFosterModalLong" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ThankYouFosterModalLongTitle">Thank you for making a request!</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Foster Lister will review your request and will get back to you in a few days.</p>
                    <p>If you have any questions please visit our <a href="/faq">FAQ Page</a> or email us at staff@fosterlister.com </p>
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
