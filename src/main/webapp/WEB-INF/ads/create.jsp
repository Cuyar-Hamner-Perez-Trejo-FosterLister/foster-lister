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
        <form action="/listings/create" method="post">
            <div class="form-group">
                <label for="name">Name of Pet</label>
                <input id="name" name="name" class="form-control" type="text" required>
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
                <input id="breed" name="breed" class="form-control" type="text" required>
            </div>
            <div class="form-group">
                <label for="dob">Estimated Age</label>
                <input id="dob" name="dob" type="text" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender</label>
                <select name="gender" id="gender">
                    <option value="F">F</option>
                    <option value="M">M</option>
                </select>
            </div>
            <div class="form-group">
                <label for="conditions">Special Conditions</label>
                <br>
                <textarea name="conditions" id="conditions" cols="30" rows="5"></textarea>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </div>
            <div class="form-group">
                <label for="size">Size Description</label>
                <input id="size" name="size" type="text" required>
            </div>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </c:when>
    <c:when test="${choice == 'foster'}">
        <form action="/listings/create" method="post">
            <div class="form-group">
                <label for="nameFoster">Name of Pet</label>
                <input id="nameFoster" name="name" class="form-control" type="text" required>
            </div>
            <div class="form-group">
                <label for="typeFoster"></label>
                <select name="type" id="typeFoster">
                    <option value="Cat">Cat</option>
                    <option value="Dog">Dog</option>
                </select>
            </div>
            <div class="form-group">
                <label for="breedFoster">Breed</label>
                <input id="breedFoster" name="breed" class="form-control" type="text" required>
            </div>
            <div class="form-group">
                <label for="dobFoster">Estimated Age</label>
                <input id="dobFoster" name="dob" type="text" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="genderFoster">Gender</label>
                <select name="gender" id="genderFoster">
                    <option value="F">F</option>
                    <option value="M">M</option>
                </select>
            </div>
            <div class="form-group">
                <label for="conditionsFoster">Special Conditions</label>
                <br>
                <textarea name="conditions" id="conditionsFoster" cols="30" rows="5"></textarea>
            </div>
            <div class="form-group">
                <label for="descriptionFoster">Description</label>
                <textarea id="descriptionFoster" name="description" class="form-control" type="text"></textarea>
            </div>
            <div class="form-group">
                <label for="sizeFoster">Size Description</label>
                <input id="sizeFoster" name="size" type="text" required>
            </div>
            <div class="form-group">
                <label for="litter_size">Litter Size (if applicable)</label>
                <input id="litter_size" name="litter_size" type="text" value="0" required>
            </div>
            <div class="form-group">
                <label for="foster_duration">Estimated Duration of Foster Care</label>
                <input id="foster_duration" name="foster_duration" type="text">
            </div>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </c:when>
    <c:when test="${choice == 'volunteer'}">
        <form action="/listings/create" method="post">
            <div class="form-group">
                <label for="date">Date of Volunteer Work</label>
                <input id="date" name="date" class="form-control" type="text" required>
            </div>
            <div class="form-group">
                <label for="title">Volunteer Role Title</label>
                <input id="title" name="title" type="text" required>
            </div>
            <div class="form-group">
                <label for="descriptionVolunteer">Description</label>
                <textarea id="descriptionVolunteer" name="descriptionVolunteer" class="form-control" type="text"></textarea>
            </div>
            <div class="form-group">
                <label for="contact">Contact Information</label>
                <input id="contact" name="contact" type="text" required>
            </div>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </c:when>
</c:choose>
    </div>
    <script>
        const change = value => window.location.assign("/listings/create?choice=" + value);
    </script>
</body>
</html>
