<%--
  Created by IntelliJ IDEA.
  User: blossomperez
  Date: 11/18/20
  Time: 6:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Fosters" />
    </jsp:include>
</head>
<body>
    <img src="${listing.imageUrl}">
    <h1>${listing.name}</h1>
    <p>${listing.type}</p>
    <p>${listing.breed}</p>
    <p>${listing.dob}</p>
    <p>${listing.gender}</p>
    <p>${listing.conditions}</p>
    <p>${listing.description}</p>
    <p>${listing.size}</p>
    <p>${listing.litterSize}</p>
    <p>${listing.fosterDuration}</p>
    <p>${listing.createdTime}</p>

    <jsp:include page="../partials/footer.jsp" />
    <jsp:include page="../partials/bootstrap-script.jsp" />
</body>
</html>
