
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Profile"/>
    </jsp:include>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<jsp:include page="/WEB-INF/partials/admin-navbar.jsp" />

<c:choose>

<%--Edit Adoption Listing--%>
    <c:when test="${choiceEdit == 'adoption'}">
    <div class="container">
        <div class="card registration-card p-3 gradient">
            <div class="card-body registration-body">
                <h1 class="text-center lg-font">Edit Listing</h1>
                <form action="/update-listing" method="post">
                    <div class="form-row">
                        <div class="form-group col-md-4 col-lg-2">
                            <small><label for="name">Name of Pet</label></small>
                            <input id="name" name="name" class="form-control" type="text" value="${listingEdit.name}" required>
                        </div>
                        <div class="form-group col-md-4 col-lg-2">
                            <small><label for="type">Type</label></small>
                            <select class="form-control" name="type" id="type">
                                <option value="Cat">Cat</option>
                                <option value="Dog">Dog</option>
                            </select>
                        </div>
                        <div class="form-group col-md-4 col-lg-2">
                            <small><label for="breed">Breed</label></small>
                            <input id="breed" name="breed" class="form-control" type="text" value="${listingEdit.breed}" required>
                        </div>
                        <div class="form-group col-md-4 col-lg-2">
                            <small><label for="dob">Estimated Age</label></small>
                            <input id="dob" name="dob" type="text" class="form-control" value="${listingEdit.dob}" required>
                        </div>
                        <div class="form-group col-md-4 col-lg-2">
                            <small><label for="gender">Gender</label></small>
                            <select class="form-control" name="gender" id="gender">
                                <option value="F" selected>F</option>
                                <option value="M">M</option>
                            </select>
                        </div>
                        <div class="form-group col-md-4 col-lg-2">
                            <small><label for="size">Size Description</label></small>
                            <input class="form-control" id="size" name="size" type="text" value="${listingEdit.size}" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <small><label for="conditions">Special Conditions</label></small>
                            <br>
                            <textarea name="conditions" id="conditions" class="form-control" rows="4" cols="50">${listingEdit.conditions}</textarea>
                        </div>
                        <div class="form-group col-md-6">
                            <small><label for="description">Description</label></small>
                            <textarea id="description" name="description" class="form-control" rows="4" cols="50" type="text">${listingEdit.description}</textarea>
                        </div>
                    </div>
                    <input type="submit" class="btn btn-block btn-dark">
                </form>
            </div>
        </div>
    </div>


<%--Edit Foster Listing--%>
    </c:when>
        <c:when test="${choiceEdit == 'foster'}">
        <div class="container">
            <div class="card registration-card p-3 gradient">
                <div class="card-body registration-body">
                    <h1 class="text-center lg-font">Edit Listing</h1>
                    <form action="/update-listing" method="post">
                        <div class="form-row">
                            <div class="form-group col-md-4 col-lg-2">
                                <small><label for="name">Name of Pet</label></small>
                                <input id="nameFoster" name="name" class="form-control" type="text" value="${listingEdit.name}" required>
                            </div>
                            <div class="form-group col-md-4 col-lg-2">
                                <small><label for="type">Type</label></small>
                                <select class="form-control" name="type" id="type2">
                                    <option value="Cat">Cat</option>
                                    <option value="Dog">Dog</option>
                                </select>
                            </div>
                            <div class="form-group col-md-4 col-lg-2">
                                <small><label for="breed">Breed</label></small>
                                <input id="breed2" name="breed" class="form-control" type="text" value="${listingEdit.breed}" required>
                            </div>
                            <div class="form-group col-md-4 col-lg-2">
                                <small><label for="dob">Estimated Age</label></small>
                                <input id="dob2" name="dob" type="text" class="form-control" value="${listingEdit.dob}" required>
                            </div>
                            <div class="form-group col-md-4 col-lg-2">
                                <small><label for="gender">Gender</label></small>
                                <select class="form-control" name="gender" id="gender2">
                                    <option value="F" selected>F</option>
                                    <option value="M">M</option>
                                </select>
                            </div>
                            <div class="form-group col-md-4 col-lg-2">
                                <small><label for="litter_size">Litter Size (if applicable)</label></small>
                                <input class="form-control" id="litter_size" name="litter_size" type="text" value="${listingEdit.litterSize}" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <small><label for="sizeFoster">Size Description</label></small>
                                <input class="form-control" id="sizeFoster" name="size" type="text" value="${listingEdit.size}" required>
                            </div>
                            <div class="form-group col-md-6">
                                <small><label for="foster_duration">Estimated Duration of Foster Care</label></small>
                                <input class="form-control" id="foster_duration" name="foster_duration" type="text" value="${listingEdit.fosterDuration}" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <small><label for="conditions">Special Conditions</label></small>
                                <br>
                                <textarea class="form-control" name="conditions" id="conditions2" rows="4" cols="50">${listingEdit.conditions}</textarea>
                            </div>
                            <div class="form-group col-md-6">
                                <small><label for="description">Description</label></small>
                                <textarea id="description2" name="description" class="form-control" rows="4" cols="50" type="text">${listingEdit.description}</textarea>
                            </div>
                        </div>
                        <input type="submit" class="btn btn-block btn-dark">
                    </form>
                </div>
            </div>
        </div>
    </c:when>

<%--Edit Volunteer Listing--%>
    <c:when test="${choiceEdit == 'volunteer'}">
        <div class="container">
            <div class="card registration-card p-3 gradient">
                <div class="card-body registration-body">
                    <h1 class="text-center lg-font">Edit Listing</h1>
                    <form action="/update-listing" method="post">
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <smalL><label for="date">Date of Volunteer Work</label></smalL>
                                <input id="date" name="date" class="form-control" type="text" value="${listingEdit.date}" required>
                            </div>
                            <div class="form-group col-md-4">
                                <smalL><label for="title">Volunteer Role Title</label></smalL>
                                <input class="form-control" id="title" name="title" type="text" value="${listingEdit.title}" required>
                            </div>
                            <div class="form-group col-md-4">
                                <smalL><label for="contact">Contact Information</label></smalL>
                                <input class="form-control" id="contact" name="contact" type="text" value="${listingEdit.contact}" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-12">
                                <smalL><label for="descriptionVolunteer">Description</label></smalL>
                                <textarea id="descriptionVolunteer" name="descriptionVolunteer" class="form-control" type="text" rows="4" cols="50">${listingEdit.description}</textarea>
                            </div>
                        </div>
                        <input type="submit" class="btn btn-block btn-dark">
                    </form>
                </div>
            </div>
        </div>
    </c:when>
</c:choose>
<jsp:include page="../partials/footer.jsp" />
<jsp:include page="../partials/bootstrap-script.jsp" />
</body>
</html>