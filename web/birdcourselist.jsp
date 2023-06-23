<%-- 
    Document   : birdcourselist.jsp
    Created on : Jun 14, 2023, 9:37:02 PM
    Author     : vuvoh
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/birdcourseList.css" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="bird" class="DAO.courseDAO"></jsp:useBean>
        <%@include file="header.jsp" %>
        <div class="body-container">
            <div class="col-xl-2">
                <div class="profile">
                    <img src="img/Ellipse%2022.png" style="border-radius: 100%; width: 7rem; height: 7rem">
                    <div>
                        <p>
                            ${sessionScope.LOGIN_USER.fullName}

                        </p>
                    </div>
                    <div>
                        <a href="#">
                            Edit profile
                        </a>
                    </div>
                </div>
                <div class="list">
                    <a href="#" class="click">
                        Bird courses
                    </a>
                    <a href="onlinecourselist.jsp">
                        Online courses
                    </a>
                    <a href="workshoplist.jsp">
                        Workshops
                    </a>
                     <a href="consultationlist.jsp">
                        Private Consultation
                    </a>
                </div>
            </div>
            <div class="col-xl-10">
                <div class="title">
                    <p>
                        MY BOOKED SERVICES
                    </p>
                    <p>
                        Check your available services
                    </p>
                    <hr style="background-color: black; margin-bottom: 4rem">
                </div>
                <c:set var="customerId" value="<%=customerID%>" />
                <c:forEach var="bc" items="${bird.getAllCourseBIRDCOURSEByCustomerID(customerId)}">
                    <div class="card">
                        <img  src="data:images/jpg;base64,${bc.image}" />

                        <div class="text">
                            <p>
                                ${bc.title}
                            </p>
                            <button>
                                <a href="Customer_Tracking">Track Your Bird</a>
                            </button>
                        </div>
                    </div>
                </c:forEach>


            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
