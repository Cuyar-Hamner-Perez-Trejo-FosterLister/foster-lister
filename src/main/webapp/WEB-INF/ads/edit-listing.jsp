
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Profile"/>
    </jsp:include>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<jsp:include page="/WEB-INF/partials/user-navbar.jsp" />

<c:choose>
    <c:when test="${choiceEdit == 'adoption'}">
<div class="container">
    <h1>Edit Listing</h1>
    <form action="/update-listing" method="post">
        <div class="form-group">
            <label for="name">Name of Pet</label>
            <input id="name" name="name" class="form-control" type="text" value="${listingEdit.name}" required>
        </div>

        <div class="form-group">
            <label for="type"></label>
            <select name="type" id="type">
                <option value="Cat">Cat</option>
                <option value="Dog">Dog</option>
            </select>
        </div>

        <div class="form-group">
            <label for="breed">Breed</label>
            <input id="breed" name="breed" class="form-control" type="text" value="${listingEdit.breed}" required>
        </div>
        <div class="form-group">
            <label for="dob">Estimated Age</label>
            <input id="dob" name="dob" type="text" class="form-control" value="${listingEdit.dob}" required>
        </div>
        <div class="form-group">
            <label for="gender">Gender</label>
            <select name="gender" id="gender">
                <option value="F" selected>F</option>
                <option value="M">M</option>
            </select>
        </div>
        <div class="form-group">
            <label for="conditions">Special Conditions</label>
            <br>
            <textarea name="conditions" id="conditions" cols="30" rows="5">${listingEdit.conditions}</textarea>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" type="text">${listingEdit.description}</textarea>
        </div>
        <div class="form-group">
            <label for="size">Size Description</label>
            <input id="size" name="size" type="text" value="${listingEdit.size}" required>
        </div>
        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>
    </c:when>
        <c:when test="${choiceEdit == 'foster'}">
            <div class="container">
            <h1>Edit Listing</h1>
            <form action="/update-listing" method="post">
            <div class="form-group">
                <label for="name">Name of Pet</label>
                <input id="nameFoster" name="name" class="form-control" type="text" value="${listingEdit.name}" required>
            </div>

            <div class="form-group">
                <label for="type"></label>
                <select name="type" id="type2">
                    <option value="Cat">Cat</option>
                    <option value="Dog">Dog</option>
                </select>
            </div>

            <div class="form-group">
                <label for="breed">Breed</label>
                <input id="breed2" name="breed" class="form-control" type="text" value="${listingEdit.breed}" required>
            </div>
            <div class="form-group">
                <label for="dob">Estimated Age</label>
                <input id="dob2" name="dob" type="text" class="form-control" value="${listingEdit.dob}" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender</label>
                <select name="gender" id="gender2">
                    <option value="F" selected>F</option>
                    <option value="M">M</option>
                </select>
            </div>
            <div class="form-group">
                <label for="conditions">Special Conditions</label>
                <br>
                <textarea name="conditions" id="conditions2" cols="30" rows="5">${listingEdit.conditions}</textarea>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description2" name="description" class="form-control" type="text">${listingEdit.description}</textarea>
            </div>
            <div class="form-group">
                <label for="sizeFoster">Size Description</label>
                <input id="sizeFoster" name="size" type="text" value="${listingEdit.size}" required>
            </div>
        <div class="form-group">
            <label for="litter_size">Litter Size (if applicable)</label>
            <input id="litter_size" name="litter_size" type="text" value="${listingEdit.litterSize}" required>
        </div>
        <div class="form-group">
            <label for="foster_duration">Estimated Duration of Foster Care</label>
            <input id="foster_duration" name="foster_duration" type="text" value="${listingEdit.fosterDuration}" required>
        </div>
                <input type="submit" class="btn btn-block btn-primary">
            </form>
            </div>
        </c:when>
    <c:when test="${choiceEdit == 'volunteer'}">
        <div class="container">
        <form action="/update-listing" method="post">
            <div class="form-group">
                <label for="date">Date of Volunteer Work</label>
                <input id="date" name="date" class="form-control" type="text" value="${listingEdit.date}" required>
            </div>
            <div class="form-group">
                <label for="title">Volunteer Role Title</label>
                <input id="title" name="title" type="text" value="${listingEdit.title}" required>
            </div>
            <div class="form-group">
                <label for="descriptionVolunteer">Description</label>
                <textarea id="descriptionVolunteer" name="descriptionVolunteer" class="form-control" type="text">${listingEdit.description}</textarea>
            </div>
            <div class="form-group">
                <label for="contact">Contact Information</label>
                <input id="contact" name="contact" type="text" value="${listingEdit.contact}" required>
            </div>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
        </div>
    </c:when>
</c:choose>
<jsp:include page="../partials/footer.jsp" />
<jsp:include page="../partials/bootstrap-script.jsp" />
</body>
</html>