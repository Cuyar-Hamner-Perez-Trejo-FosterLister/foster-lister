<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Listing" />
    </jsp:include>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
    <div class="container">
        <h1>Create a new Listing</h1>
        <div>
        <h3>Select the type of listing:</h3>
        </div>
        <div>
            <select name="choice" id="choice" onChange = "change(this.options[this.selectedIndex].value)">
                <option></option>
                <option value="adoption">Adoption</option>
                <option value="foster">Foster</option>
                <option value="volunteer">Volunteer</option>
            </select>
        </div>
<c:choose>
    <c:when test="${choice == 'adoption'}">
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </div>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </c:when>
    <c:when test="${choice == 'foster'}">
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="title">Foster Title</label>
                <input id="title2" name="title" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description2" name="description" class="form-control" type="text"></textarea>
            </div>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </c:when>
    <c:when test="${choice == 'volunteer'}">
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="title">Volunteer Title</label>
                <input id="title3" name="title" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description3" name="description" class="form-control" type="text"></textarea>
            </div>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </c:when>
</c:choose>
    </div>
    <script>
        const change = (value) => window.location.assign("/listings/create?choice=" + value);
    </script>
</body>
</html>
