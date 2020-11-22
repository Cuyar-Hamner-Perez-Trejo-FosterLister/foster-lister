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
    <div class="container registration-card p-3" style="background: linear-gradient(90deg, rgba(78,67,118,1) 0%, rgba(59,78,118,1) 82%, rgba(43,88,118,1) 100%);">
        <h1 class="m-0 text-center lg-font">Create a new Listing</h1>
        <div class="text-center pb-3">
        <label class="m-0" for="choice" class="display-5 pr-3">Select the type of listing:</label>
            <select name="choice" id="choice"  class="dark-form" onChange = "change(this.options[this.selectedIndex].value)">
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
                        <label class="m-0" for="name">Name of Pet</label>
                        <input id="name" name="name" class="form-control dark-form" type="text" required>
                    </div>
                    <div class="form-group">
                        <label class="m-0" for="type">Animal Type</label>
                        <select name="type" id="type" class="dark-form" onchange="set()" required>
                            <option></option>
                            <option value="Cat">Cat</option>
                            <option value="Dog">Dog</option>
                        </select>
                    </div>
                    <div id="image-display" class="form-group d-none">
                        <img src="" alt="Example Image" id="change-image">
                        <button type="button" id="button-image" onclick="set()">Change Image</button>
                        <br>
                        <label class="m-0" for="imageUrl">Image URL</label>
                        <input type="text" id="imageUrl" name="imageUrl" class="form-control dark-form" readonly>
                    </div>
                    <div class="form-group">
                        <label class="m-0" for="breed">Breed</label>
                        <input id="breed" name="breed" class="form-control dark-form" type="text" required>
                    </div>
                    <div class="form-group">
                        <label class="m-0" for="dob">Estimated Age</label>
                        <input id="dob" name="dob" type="text" class="form-control dark-form" required>
                    </div>
                    <div class="form-group">
                        <label class="m-0" for="gender">Gender</label>
                        <select name="gender" id="gender" class="dark-form"required>
                            <option value="F">F</option>
                            <option value="M">M</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="m-0" for="conditions">Special Conditions</label>
                        <br>
                        <textarea name="conditions" id="conditions" class="form-control dark-form" cols="30" rows="5"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="m-0" for="description">Description</label>
                        <textarea id="description" name="description" class="form-control dark-form" type="text"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="m-0" for="size">Size Description</label>
                        <input id="size" name="size" class="form-control dark-form" type="text" required>
                    </div>
                    <input type="submit" class="btn btn-block btn-dark" value="Submit">
                </form>
            </c:when>
            <c:when test="${choice == 'foster'}">
                <form action="/listings/create" method="post">
                    <div class="form-group">
                        <label class="m-0" for="nameFoster">Name of Pet</label>
                        <input id="nameFoster" name="name" class="form-control dark-form" type="text" required>
                    </div>
                    <div class="form-group">
                        <label class="m-0" for="typeFoster">Animal Type</label>
                        <select name="type" id="typeFoster" class="dark-form" onchange="set()" required>
                            <option></option>
                            <option value="Cat">Cat</option>
                            <option value="Dog">Dog</option>
                        </select>
                    </div>
                    <div id="image-displayF" class="form-group d-none">
                        <img src="" alt="Example Image" id="change-imageF">
                        <button type="button" id="button-imageF" onclick="set()">Change Image</button>
                        <br>
                        <label class="m-0" for="imageUrlF">Image URL</label>
                        <input type="text" id="imageUrlF" name="imageUrl" class="form-control dark-form" readonly>
                    </div>
                    <div class="form-group">
                        <label class="m-0" for="breedFoster">Breed</label>
                        <input id="breedFoster" name="breed" class="form-control dark-form" type="text" required>
                    </div>
                    <div class="form-group">
                        <label class="m-0" for="dobFoster">Estimated Age</label>
                        <input id="dobFoster" name="dob" type="text" class="form-control dark-form" required>
                    </div>
                    <div class="form-group">
                        <label class="m-0" for="genderFoster">Gender</label>
                        <select name="gender" class="dark-form" id="genderFoster">
                            <option value="F">F</option>
                            <option value="M">M</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="m-0" for="conditionsFoster">Special Conditions</label>
                        <br>
                        <textarea name="conditions" id="conditionsFoster" class="form-control dark-form" cols="30" rows="5"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="m-0" for="descriptionFoster">Description</label>
                        <textarea id="descriptionFoster" name="description" class="form-control dark-form" type="text"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="m-0" for="sizeFoster">Size Description</label>
                        <input id="sizeFoster" name="size" class="form-control dark-form" type="text" required>
                    </div>
                    <div class="form-group">
                        <label class="m-0" for="litter_size">Litter Size (if applicable)</label>
                        <input id="litter_size" name="litter_size" class="form-control dark-form" type="text" value="0" required>
                    </div>
                    <div class="form-group">
                        <label class="m-0" for="foster_duration">Estimated Duration of Foster Care</label>
                        <input id="foster_duration" name="foster_duration"  class="form-control dark-form" type="text">
                    </div>
                    <input type="submit" class="btn btn-block btn-dark" value="Submit">
                </form>
            </c:when>
            <c:when test="${choice == 'volunteer'}">
                <form action="/listings/create" method="post">
                    <div class="form-group">
                        <label class="m-0" for="date">Date of Volunteer Work</label>
                        <input id="date" name="date" class="form-control dark-form" type="text" required>
                    </div>
                    <div class="form-group">
                        <label class="m-0" for="title">Volunteer Role Title</label>
                        <input id="title" name="title" class="form-control dark-form" type="text" required>
                    </div>
                    <div class="form-group">
                        <label class="m-0" for="descriptionVolunteer">Description</label>
                        <textarea id="descriptionVolunteer" name="descriptionVolunteer" class="form-control dark-form" type="text"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="m-0" for="contact">Contact Information</label>
                        <input id="contact" name="contact" class="form-control dark-form" type="text" required>
                    </div>
                    <input type="submit" class="btn btn-block btn-dark" value="Submit">
                </form>
            </c:when>
        </c:choose>
    </div>
    <jsp:include page="/WEB-INF/partials/jquery-script.jsp" />
    <jsp:include page="/WEB-INF/partials/footer.jsp" />
    <jsp:include page="/WEB-INF/partials/bootstrap-script.jsp" />

    <script>
        const change = value => window.location.assign("/listings/create?choice=" + value);
    </script>
</body>
</html>
