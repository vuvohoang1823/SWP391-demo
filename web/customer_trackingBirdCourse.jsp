<%-- 
    Document   : trainer_trackingBirdCourse
    Created on : Jun 18, 2023, 1:25:45 PM
    Author     : vuvoh
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/customer_trackingBirdCourse.css" type="text/css">
    </head>
    <body>
        <%@include file="header.jsp" %>

        <div class="heading">Bird Tracking Progress</div>
        <div class="section-body">
            <div class="title">
                <p>
                    Overall Tracking Progress
                </p>
            </div>
            <c:set var="result" value="${CustomerBooking}"/>
            <c:if test="${not empty result}">
                <c:forEach items="${CustomerBooking}" var="booking">
                    <div class="section-body-content">
                        <div class="col-lg-7">
                            <img src="data:images/jpg;base64,${booking.courseImg}" style="border-radius: 100%; width: 50rem;height: 50rem" />
                            <div class="left-content">
                                <div class="text">
                                    <p>
                                        Bird's Name
                                    </p>
                                    <p>
                                        <b>
                                            ${booking.nameBird}
                                        </b>
                                    </p>
                                </div>
                                <div class="text">
                                    <p>
                                        Bird Type
                                    </p>
                                    <p>
                                        <b>
                                            ${booking.typeBird}
                                        </b>
                                    </p>
                                </div>
                                <div class="text">
                                    <p>
                                        Training Status
                                    </p>
                                    <p>
                                        <b style="color: #617A55">
                                            ${booking.status}
                                        </b>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5">
                            <div class="text">
                                <p>
                                    Course Name
                                </p>
                                <p>
                                    <b>
                                        ${booking.courseName}
                                    </b>
                                </p>
                            </div>
                            <div class="text">
                                <p>
                                    Training duration
                                </p>
                                <p>
                                    <b>
                                        Start date: ${BookingDTO.start_date}
                                    </b>
                                    <br>
                                    <b>
                                        End date: ${BookingDTO.end_date}
                                    </b>
                                </p>
                            </div>
                            <div class="trainer-content">
                                <img src="data:images/jpg;base64,${booking.trainerImg}" style="border-radius: 100%; width: 16rem;height: 16rem"/>
                                <div class="text">
                                    <p>
                                        Trainer
                                    </p>
                                    <b>
                                        ${booking.trainerName}
                                    </b>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty result}">
                <h2>You have no bird to track</h2>
            </c:if>   
        </div>
    </div>
    <!--    <div style="background-color: red; height: 10rem; justify-content: center; align-items: center; display: flex;font-size: 5rem">
            MODULE
        </div>-->
    <%@include file="footer.jsp" %>
</body>
</html>

