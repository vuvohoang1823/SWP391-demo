<%--
    Document   : Customer_Workshop_Complete
    Created on : Jul 4, 2023, 10:47:17 AM
    Author     : LAPTOP
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Booked Services</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="css/Customer_Workshop_Complete_Reset.css">
        <link rel="stylesheet" href="css/Customer_Workshop_Complete_Style.css">
    </head>
    <body>
        <%@include file="header.jsp"%>
        <jsp:useBean id="workshop" class="DAO.courseDAO" ></jsp:useBean>
            <div class="container-fluid">
            <%@include file="viewBookedService_Head.jsp" %>

            <div class="filter-search">
                <div class="filter-side">
                    <p>Service status: </p>
                    <ul class="filter-option">
                        <li><a href="Customer_Workshop_In-progress.jsp">In-progress</a></li>
                        <li><a href="Customer_Workshop_Complete.jsp">Completed</a></li>
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
            <c:set var="customerId" value="<%=customerID%>" />
            <p class="search-result">Currently showing ${workshop.getAllCourseWORKSHOPCompleteByCustomerID(customerId).size()} available item(s)</p>





            <div class="show-result">
                <c:forEach var="wo" items="${workshop.getAllCourseWORKSHOPCompleteByCustomerID(customerId)}">
                    <div class="search-card">
                        <div class="card">
                            <img src="data:images/jpg;base64,${wo.image}" alt="" class="card-img">
                            <div class="card-content">
                                <div class="header">
                                    <p>
                                        ${wo.title}
                                    </p>
                                </div>
                                <div class="body">
                                    <p>
                                        ${wo.content}
                                    </p>
                                </div>
                                <div class="trainer">
                                    <p><span>Workshop trainer:</span> ${wo.trainer_fullname}</p>
                                </div>
                                <div class="btn-complete">
                                    <!--<button><a href="Certificate.jsp">View certificate</a></button>-->
                                    <form action="Customer_ViewCertificateWorkshopServlet" method="post" target="_blank">
                                        <input type="hidden" name="customer_id" value="${wo.customerID}">
                                        <input type="hidden" name="course_id" value="${wo.courseID}">
                                        <input type="hidden" name="complete_date" value="${wo.complete_date}">
                                        
                                        <c:set var="certificateStatus" value="${wo.certificate_status}" />
                                        <c:if test="${certificateStatus eq 'Awarded'}">
                                        <button type="submit">View certificate</button>
                                        </c:if>
                                        
                                    </form>

                                    <div class="complete-date">
                                        <p>Complete on</p>
                                        <span class="date">${wo.complete_date}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
