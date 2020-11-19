<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/ads">Foster Lister</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/dogs">Dogs</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/cats">Cats</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/volunteer-listings">Volunteers</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown dropleft">
                <a class="nav-link dropdown-toggle"  href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     ${sessionScope.user.firstName} ${sessionScope.user.lastName}
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/profile">Profile</a>
                    <a class="dropdown-item" href="/update-user">Edit Profile</a>
                    <a class="dropdown-item" href="/logout">Logout</a>
                    <div class="dropdown-divider"></div>
                    <%--href will need to be /about-us, once we create that servlet and jsp--%>
                    <a class="dropdown-item" href="#">About Us</a>
                    <a class="dropdown-item" href="#">FAQ</a>
                </div>
            </li>
        </ul>
    </div>
</nav>
