<%-- 
    Document   : consultationlist
    Created on : Jun 21, 2023, 10:39:51 PM
    Author     : hoang
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/onlinecourseList.css" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
  /* Global Styles */
  body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
  }

  /* Profile Section */
  .profile {
    text-align: center;
    margin-bottom: 2rem;
  }

  .profile img {
    border-radius: 50%;
    width: 7rem;
    height: 7rem;
  }

  .profile p {
    margin: 0;
    font-size: 1.2rem;
    font-weight: bold;
    color: #333;
    margin-top: 1rem;
  }

  .profile a {
    color: #888;
    text-decoration: none;
  }

  /* Navigation Section */
  .list {
    margin-bottom: 2rem;
  }

  .list a {
    display: block;
    margin-bottom: 1rem;
    color: #333;
    text-decoration: none;
  }

  .list a.click {
    font-weight: bold;
  }

  /* Title Section */
  .title {
    text-align: center;
    margin-bottom: 2rem;
  }

  .title h2 {
    font-size: 2rem;
    color: #333;
    margin-bottom: 0.5rem;
  }

  .title p {
    margin: 0;
    color: #888;
  }

  .title hr {
    border: none;
    height: 1px;
    background-color: #333;
    margin-top: 2rem;
    margin-bottom: 2rem;
  }

  /* Card Section */
  .card {
    background-color: #fff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
    padding: 1.5rem;
    margin-bottom: 2rem;
  }

  .card img {
    width: 100%;
    height: auto;
    border-radius: 5px;
    margin-bottom: 1rem;
  }

  .card h3 {
    font-size: 1.5rem;
    color: #333;
    margin-bottom: 0.5rem;
  }

  .card ul {
    margin: 0;
    padding: 0;
    list-style: none;
  }

  .card ul li {
    margin-bottom: 0.5rem;
    color: #888;
    font-size:2rem;
  }

  .card a.btn {
    display: inline-block;
    padding: 0.5rem 1rem;
    background-color: #333;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s ease;
  }

  .card a.btn:hover {
    background-color: #555;
  }
</style>
    </head>
    <body>
        <jsp:useBean id="pr" class="DAO.courseDAO"></jsp:useBean>
                <jsp:useBean id="t" class="DAO.TrainerDAO" ></jsp:useBean>

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
                    <a href="birdcourselist.jsp" >
                        Bird courses
                    </a>
                    <a href="onlinecourselist.jsp" class="click">
                        Online courses
                    </a>
                    <a href="workshoplist.jsp">
                        Workshops
                    </a>
                    <a href="#">
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
                <c:forEach var="app" items="${pr.getAllCourseAppointmentByCustomeriD(customerId)}">
                    <div class="card">
                        <img  src="./img/BehaviorConsultation_1080x.webp" />
                        <div class="text">
                            <p>
                                Private Consultation 
                            </p>
                            <c:set var="RequestTrainerid" value="${app.request_trainer_id}"/> 
                            <c:set var="g" value="${t.getTrainerByID(RequestTrainerid)}"/>
   
                            <ul style="list-style: none">
                                <li> Date:  ${app.date}</li>
                                <li> Type:  ${app.type}</li>
                                <li> Trainer:  ${g.fullName}</li>
                            </ul>
                            <button>
                                <a href="#">Detail Appointment</a>
                            </button>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
