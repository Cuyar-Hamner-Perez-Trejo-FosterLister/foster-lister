<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

    <div class="container pt-4">
        <!--Filter Container -->
        <div class="row">
            <div class="col-md-4 card gradient">
                <div class="card-body">
                    <c:choose>
                        <c:when test="${viewListingType == 'dogs'}">
                            <h1>Filter Dogs</h1>
                            <hr>
                        </c:when>
                        <c:when test="${viewListingType == 'cats'}">
                            <h1>Filter Cats</h1>
                            <hr>
                        </c:when>
                    </c:choose>

                    <form class="pt-3">
<%--                        <div class="input-group">--%>
<%--                            <input type="text" class="form-control" placeholder="Search Breed, Age, Size, or Gender" aria-label="Search Breed, Age, Size, or Gender" aria-describedby="search-button">--%>
<%--                            <div id ="search" class="input-group-prepend">--%>
<%--                                <span class="input-group-text" id="search-button">@</span>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                        <div class="form-group">
                            <label class="d-none" for="foster-or-adoption">Foster or Adoption</label>
                            <select class="form-control" id="foster-or-adoption" name="choiceFA" onChange = "change('?choiceFA=', this.options[this.selectedIndex].value)">
                                <option selected>Foster or Adoption</option>
                                <option value="foster">Foster</option>
                                <option value="adoption">Adoption</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="d-none" for="breed">Breed</label>
                            <select class="form-control" id="breed" name="choiceB" onChange = "change('?choiceB=', this.options[this.selectedIndex].value)">
                                <option selected>Breed</option>
                                <c:forEach var="listing" items="${listings}">
                                    <option value="${listing.breed}">${listing.breed}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="d-none" for="gender">Gender</label>
                            <select class="form-control" id="gender" name="choiceG" onChange = "change('?choiceG=', this.options[this.selectedIndex].value)">
                                <option selected>Gender</option>
                                <option value="M">Male</option>
                                <option value="F">Female</option>
                            </select>
                        </div>
                        <div class="form-group text-center">
                            <c:choose>
                                <c:when test="${lsize > 1}">
                                    <hr>
                                    <p class="text-center">${lsize} results found</p>
                                    <hr>
                                </c:when>
                                <c:when test="${lsize == 1}">
                                    <hr>
                                    <p class="text-center">${lsize} result found</p>
                                    <hr>
                                </c:when>
                                <c:when test="${lsize == 0}">
                                    <hr>
                                    <p class="text-center">${lsize} results found</p>
                                    <button type="button" id="reset-btn" name="reset-btn" class="btn btn-dark button" onclick="resetFilter()">Reset filter</button>
                                    <hr>
                                </c:when>
                            </c:choose>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-8" id="index-listing">
                <div class="w-100 d-flex flex-row flex-wrap justify-content-center justify-content-md-start">
                <c:forEach var="listing" items="${listings}">
                        <div class="index-card gradient d-flex flex-column pb-4">
                            <img class="listing-img" src="${listing.imageUrl}" style="height: 200px; width: 100%">
                            <div class="text-container">
                                <p class="text-center">${listing.name}</p>
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

        </div>



    </div>

    <jsp:include page="/WEB-INF/partials/footer.jsp" />
    <jsp:include page="/WEB-INF/partials/bootstrap-script.jsp" />

    <script>
        let endpoint = "${viewListingType}";
        const sendID = (id) => window.location.replace("/listing-info?listing=" + id);
        const change = (query, params) => window.location.assign("/" + endpoint + query + params);
        const resetFilter = () => window.location.assign("/" + endpoint);
    </script>

</body>
</html>
