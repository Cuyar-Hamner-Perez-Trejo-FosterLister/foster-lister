<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Listing" />
    </jsp:include>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/admin-navbar.jsp" />
    <div class="container">
        <div class="card registration-card gradient">
            <div class="card-body registration-body">
        <h1 class="mb-4 lg-font">Create a new Listing</h1>
        <div>
        <h3 class="mb-4">Select the type of listing:</h3>
        </div>
        <div class="mb-4">
            <select  name="choice" id="choice" onChange = "change(this.options[this.selectedIndex].value)">
                <option></option>
                <option value="adoption">Adoption</option>
                <option value="foster">Foster</option>
                <option value="volunteer">Volunteer</option>
            </select>
        </div>
<c:choose>
    <c:when test="${choice == 'adoption'}">
        <form action="/listings/create" method="post">
            <div class="form-group col-md-12 mb-3">
                <label for="name">Name of Pet</label>
                <input id="name" name="name" class="form-control" type="text" required>
            </div>
            <div class="form-group col-md-10 mb-3 justify-content-center">
                <label for="type">Animal Type</label>
                <select name="type" id="type" onchange="set()" required>
                    <option></option>
                    <option value="Cat">Cat</option>
                    <option value="Dog">Dog</option>
                </select>
            </div>
            <div id="image-display" class="form-group col-md-12 mb-3 d-none">
                <img class="img-thumbnail" src="" alt="Example Image" id="change-image">
                <button class="btn btn-dark btn-block mt-4" type="button" id="button-image" onclick="set()">Change Image</button>
                <br>
                <label for="imageUrl">Image URL</label>
                <input type="text" id="imageUrl" name="imageUrl" class="form-control" readonly>
            </div>
            <div class="form-group col-md-12 mb-3">
                <label for="breed">Breed</label>
                <input id="breed" name="breed" class="form-control" type="text" required>
            </div>
            <div class="form-group col-md-12 mb-3">
                <label for="dob">Estimated Age</label>
                <input id="dob" name="dob" type="text" class="form-control" required>
            </div>
            <div class="form-group col-md-12 mb-3">
                <label for="gender">Gender</label>
                <select name="gender" id="gender" required>
                    <option value="F">F</option>
                    <option value="M">M</option>
                </select>
            </div>
            <div class="form-group col-md-12 mb-3">
                <label for="conditions">Special Conditions</label>
                <br>
                <textarea name="conditions" id="conditions" rows="5"></textarea>
            </div>
            <div class="form-group col-md-12 mb-3">
                <label for="description">Description</label>
                <textarea id="description" name="description" rows="5" class="form-control" type="text"></textarea>
            </div>
            <div class="form-group col-md-12 mb-3">
                <label for="size">Size Description</label>
                <input id="size" name="size" type="text" required>
            </div>

            <input type="submit" class="btn btn-dark btn-block mt-4">
        </form>
    </c:when>
    <c:when test="${choice == 'foster'}">
        <form action="/listings/create" method="post">
            <div class="form-group col-md-12 mb-3">
                <label for="nameFoster">Name of Pet</label>
                <input id="nameFoster" name="name" class="form-control" type="text" required>
            </div>
            <div class="form-group col-md-12 mb-3">
                <label for="typeFoster">Animal Type</label>
                <select name="type" id="typeFoster" onchange="set()" required>
                    <option></option>
                    <option value="Cat">Cat</option>
                    <option value="Dog">Dog</option>
                </select>
            </div>
            <div id="image-displayF" class="form-group col-md-12 mb-3 d-none">
                <img src="" alt="Example Image" id="change-imageF">
                <button type="button" id="button-imageF" class="btn btn-dark btn-block mt-4" onclick="set()">Change Image</button>
                <br>
                <label for="imageUrlF">Image URL</label>
                <input type="text" id="imageUrlF" name="imageUrl" class="form-control" readonly>
            </div>
            <div class="form-group col-md-12 mb-3">
                <label for="breedFoster">Breed</label>
                <input id="breedFoster" name="breed" class="form-control" type="text" required>
            </div>
            <div class="form-group col-md-12 mb-3">
                <label for="dobFoster">Estimated Age</label>
                <input id="dobFoster" name="dob" type="text" class="form-control" required>
            </div>
            <div class="form-group col-md-12 mb-3">
                <label for="genderFoster">Gender</label>
                <select name="gender" id="genderFoster">
                    <option value="F">F</option>
                    <option value="M">M</option>
                </select>
            </div>
            <div class="form-group col-md-12 mb-3">
                <label for="conditionsFoster">Special Conditions</label>
                <br>
                <textarea name="conditions" id="conditionsFoster" rows="5"></textarea>
            </div>
            <div class="form-group col-md-12 mb-3">
                <label for="descriptionFoster">Description</label>
                <textarea id="descriptionFoster" name="description" rows="5" class="form-control" type="text"></textarea>
            </div>
            <div class="form-group col-md-12 mb-3">
                <label for="sizeFoster">Size Description</label>
                <input id="sizeFoster" name="size" type="text" required>
            </div>
            <div class="form-group col-md-12 mb-3">
                <label for="litter_size">Litter Size (if applicable)</label>
                <input id="litter_size" name="litter_size" type="text" value="0" required>
            </div>
            <div class="form-group col-md-12 mb-3">
                <label for="foster_duration">Estimated Duration of Foster Care</label>
                <input id="foster_duration" name="foster_duration" type="text">
            </div>
            <input type="submit" class="btn btn-dark btn-block mt-4">
        </form>
    </c:when>
    <c:when test="${choice == 'volunteer'}">
        <form action="/listings/create" method="post">
            <div class="form-group col-md-12 mb-3">
                <label for="date">Date of Volunteer Work</label>
                <input id="date" name="date" class="form-control" type="text" required>
            </div>
            <div class="form-group col-md-12 mb-3">
                <label for="title">Volunteer Role Title</label>
                <input id="title" name="title" type="text" required>
            </div>
            <div class="form-group col-md-12 mb-3">
                <label for="descriptionVolunteer">Description</label>
                <textarea id="descriptionVolunteer" name="descriptionVolunteer" class="form-control" type="text"></textarea>
            </div>
            <div class="form-group col-md-12 mb-3">
                <label for="contact">Contact Information</label>
                <input id="contact" name="contact" type="text" required>
            </div>
            <input type="submit" class="btn btn-block btn-dark mt-4">
        </form>
    </c:when>
</c:choose>
            </div>
        </div>
    </div>
    <jsp:include page="../partials/bootstrap-script.jsp" />
    <jsp:include page="/WEB-INF/partials/jquery-script.jsp" />


    <script>
        const change = value => window.location.assign("/listings/create?choice=" + value);
    </script>
</body>
</html>
