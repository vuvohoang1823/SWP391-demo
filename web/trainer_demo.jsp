<%-- 
    Document   : workshoplist
    Created on : Jun 14, 2023, 9:37:34 PM
    Author     : vuvoh
--%>
<%@page import="entity.Trainer"%>
<%@page import="DAO.AppointmentDAO"%>
<%@page import="entity.TrainerDTO"%>
<%@page import="DAO.TrainerDAO1"%>
<%@page import="entity.UserDTO"%>
<%@page import="entity.TrainerSP"%>

<%
    // Retrieve the UserDTO object from the session
    TrainerSP user = (TrainerSP) session.getAttribute("LOGIN_USER");

    // Create an instance of the CustomerDAO
    TrainerDAO1 trainerDAO = new TrainerDAO1();

    // Get the customer ID using the user ID
    int trainerID = trainerDAO.getTrainerID(user.getUserID());
%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/workshopList.css" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="workshop" class="DAO.courseDAO" ></jsp:useBean>
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
                    <a href="onlinecourselist.jsp">
                        Online courses
                    </a>
                    <a href="#" class="click">
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



                <c:set var="trainerID" value="<%=trainerID%>" />
                <p>In progress</p>
                <c:forEach var="in_progress" items="${workshop.getAllCourseAreTraining(trainerID)}">
                    <div class="card">
                        <img  src="data:images/jpg;base64,${in_progress.image}" />

                        <div class="text">
                            <p>
                                ${in_progress.title}
                            </p>
                            <p>
                                Status: ${in_progress.status}
                            </p>
                           <p>
                                Start date: ${in_progress.start_date}
                            </p>
                            <button>
                                <a href="SetWorkshopCompleteServlet?trainerID=${in_progress.trainerID}">Complete</a>
                            </button>
                        </div>
                    </div>
                </c:forEach>
                
                <p>Completed</p>
                <c:forEach var="complete" items="${workshop.getAllCourseTrained(trainerID)}">
                    <div class="card">
                        <img  src="data:images/jpg;base64,${complete.image}" />

                        <div class="text">
                            <p>
                                ${complete.title}
                            </p>
                            <p>
                                Status: ${complete.status}
                            </p>
                            <button>
                                <a href="#">Track Your Workshop</a>
                            </button>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>

