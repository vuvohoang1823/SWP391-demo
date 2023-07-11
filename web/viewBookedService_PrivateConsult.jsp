<%--
    Document   : viewBookedService
    Created on : Jul 3, 2023, 1:10:32 AM
    Author     : thang
--%>
<%@page import="entity.CustomerDTO"%>
<%@page import="DAO.CustomerDAO"%>
<%@page import="entity.UserDTO"%>
<%
    // Retrieve the UserDTO object from the session
    CustomerDTO user = (CustomerDTO) session.getAttribute("LOGIN_USER");

    // Create an instance of the CustomerDAO
    CustomerDAO customerDAO = new CustomerDAO();

    // Get the customer ID using the user ID
    int customerID = customerDAO.getCustomerID(user.getUser_id());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/reset.css">
        <jsp:useBean id="f" class="DAO.FormApppointmentDAO" scope="request"></jsp:useBean>
        <jsp:useBean id="t" class="DAO.TrainerDAO" scope="request"></jsp:useBean>
            <link rel="stylesheet" href="css/viewBookedService_PrivateConsult.css">
        </head>
        <body>
        <%@include file="header.jsp" %>
        <div class="container-fluid">
            <%@include file="viewBookedService_Head.jsp" %>
            <div class="filter-search">
                <div class="filter-side">
                    <p>Service status: </p>
                    <ul class="filter-option">
                        <li class="active"><a href="viewBookedService_PrivateConsult.jsp">Upcoming</a></li>
                        <li><a href="viewBookedService_PrivateConsult_complete.jsp">Completed</a></li>
                    </ul>
                </div>
                <div class="search-side">
                    <input type="text" class="search-bar" placeholder="Search by item name">
                    <svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M20.8335 21.083L26.5002 26.7497" stroke="#323232" stroke-width="2" stroke-linecap="round"
                          stroke-linejoin="round" />
                    <path
                        d="M23.6667 12.5833C23.6667 18.8426 18.5926 23.9167 12.3333 23.9167C6.0741 23.9167 1 18.8426 1 12.5833C1 6.3241 6.0741 1.25 12.3333 1.25C18.5926 1.25 23.6667 6.3241 23.6667 12.5833Z"
                        stroke="#323232" stroke-width="2" />
                    </svg>
                </div>
            </div>
            <c:set var="customerId" value="<%=customerID%>"></c:set>
            <p class="search-result">Currently showing <c:out value="${f.getAppointmentListBYCustomerID(customerId).size()}" /> available item(s)</p>
            <div class="result-container">
                <c:forEach var="list" items="${f.getAppointmentListBYCustomerID(customerId)}">
                    <c:set var="trainerID" value="${list.request_trainer_id}"></c:set>
                    <c:set  var="trainer" value="${t.getrainerbyIDCUstomerField(trainerID)}"></c:set>
                        <div class="card-container">
                            <div class="card-detail">
                                <div class="col-lg-4 d-flex align-items-center">
                                    <img src="data:images/jpg;base64,${trainer.img}"/>
                            </div>
                            <div class="description col-lg-8">
                                <p class="course-title">Basic Consultation</p>
                                <div class="course-desc">
                                    <p><b>id: </b>${list.consultation_id}</p>
                                    <p><b>Customer: </b>${list.customer_fullname}</p>
                                    <p><b>Time: </b>${list.duration}</p>
                                    <p><b>Date: </b>${list.date}</p>
                                    <p><b>Type: </b><span id="consultType">${list.type}</span></p>
                                    <p><b>Trainer name: </b>${trainer.fullName}</p>
                                    <p><b>Consultation fee: </b><span id="consultPrice"></span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!--        get price-->
        <script>
            // Get all elements with class "abc"
            var elements = document.getElementsByClassName("description");
            // Loop through each element
            for (var i = 0; i < elements.length; i++) {
                var element = elements[i];
                // Find the consultType and consultPrice elements within the current element
                var consultTypeElement = element.querySelector("#consultType");
                var consultPriceElement = element.querySelector("#consultPrice");
                // Get the consultType value and update the consultPrice accordingly
                var consultType = consultTypeElement.textContent.toLowerCase();
                if (consultType === "online") {
                    consultPriceElement.textContent = "$100/hour"; // Update consultPrice for online consultation
                } else if (consultType === "offline") {
                    consultPriceElement.textContent = "$150/hour"; // Update consultPrice for offline consultation
                }
            }
        </script>
        <%@include file="footer.jsp" %>
    </body>
</html>
