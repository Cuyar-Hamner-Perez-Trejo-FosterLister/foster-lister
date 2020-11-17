<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For An Account" />
    </jsp:include>
</head>
<body>
    <jsp:include page="partials/guest-navbar.jsp" />
    <div class="container">
        <div class="card">
            <div class="card-body">
                <form action="/register" method="post">
                    <div class="col-md-6">
                        <h1>Register for an account</h1>
                    </div>
                    <div class="form-group col-md-6">
                        <input id="first-name" name="first-name" class="form-control" type="text" placeholder="First Name">
                    </div>
                    <div class="form-group col-md-6">
                        <input id="last-name" name="last-name" class="form-control" type="text" placeholder="Last Name">
                    </div>
                    <div class="form-group col-md-6">
                        <input id="phonenumber" name="phonenumber" class="form-control" type="text" placeholder="Phone Number">
                    </div>
                    <div class="form-group col-md-6">
                        <input id="email" name="email" class="form-control" type="text" placeholder="Email">
                    </div>
                    <div class="form-group col-md-6">
                        <input id="address" name="address" class="form-control" type="text" placeholder="Address">
                    </div>
                    <div class="form-group col-md-6">
                        <input id="password" name="password" class="form-control" type="password" placeholder="Password">
                    </div>
                    <div class="form-group col-md-6">
                        <input id="pets" name="pets" class="form-control" type="text" placeholder="Number of Pets">
                    </div>
                    <div class="form-group col-md-6">
                        <input id="confirm_password" name="confirm_password" class="form-control" type="password" placeholder="Confirm Password">
                    </div>
                    <input type="submit" class="btn btn-primary btn-block">
                </form>
            </div>
        </div>
    </div>
</body>
</html>
