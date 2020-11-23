<%--
  Created by IntelliJ IDEA.
  User: blossomperez
  Date: 11/20/20
  Time: 10:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="FAQ" />
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
    <div class="container">
        <h1 class="m-3">Adoption, Foster, and Volunteer FAQ</h1>
        <dl class="p-3">
            <dt>How can I contact the shelter?</dt>
            <dd>You can contact us by any of the following: phone: 555-555-5555 email: pets@example.com address: 123 Shelter Lane, San Antonio, Tx 78254</dd>
            <dt>How can I apply for adoption or foster?</dt>
            <dd>You can apply for adoption or to become a foster by registering for an account with us. Once you are done,
                simply got to the pet listing and click the "register for foster" for fosters and "register for adoption" for adoption. A request will be
                sent to our staff for consideration.</dd>
            <dt>How will I know if I've been approved to adopt a pet?</dt>
            <dd>Every applicant will be contacted by phone or email provided when applying for adoption,
                regardless of approval or denial. Applicants will be notified within 5 business days. </dd>
            <dt>Why wasn't I selected for adoption?</dt>
            <dd>First off, we would like to thank you for choosing adoption! We want to find the best forever homes for each pet.
                We take many factors into account when choosing a forever home. Please do not let this experience change your mind
                about adoption. There are still many animals that need a forever homes! Thank you for helping an adoptible pet and good luck
                on your search for a new member of your family. If you have any questions, please contact us!</dd>
            <dt>Why wasn't I selected for foster?</dt>
            <dd>First off, we would like to thank you for choosing to foster an animal and help find a forever home for them! We take into account the following
                factors when choosing a foster family: the amount of pets currently in the home, the temperment of the foster, if the foster needs to be socialized,
                if the foster has a litter, if the foster is a litter without a mother, if the foster has any special needs, if a foster family has
                attended any of our litter car or special needs care classes, and if the foster family has children. Please do not let this experience change your mind. We have many
                pets that are in need of a foster home to get them ready for a forever home. if you have any questions, please contact us!</dd>
            <dt>Can I meet the pet I see on your website?</dt>
            <dd>Of course! You can either drop by our shelter or call us to make an appointment. </dd>
            <dt>Are there any programs in place to help foster parents pay for food and help with medical needs?</dt>
            <dd>We have many donations that helps with necessities. If you find yourself in need of assistance for necessities,
                contact us and we will help.</dd>
            <dt>Why is there an adoption fee?</dt>
            <dd>Adoption fees help cover the medical care of the animal while he or she waits for a new home, as well as transportation and food costs.
                The money also acts as a donation to help support the organization as a whole, allowing our organization to continue providing care and finding forever homes. </dd>
            <dt>How can I sign up for volunteer opportunities? </dt>
            <dd>Each volunteer listing contains a contact method. Contact the volunteer organization for more information.</dd>
        </dl>

    </div>

    <jsp:include page="partials/footer.jsp" />
    <jsp:include page="partials/bootstrap-script.jsp" />
</body>
</html>
