<%--
    Document   : viewBookedService
    Created on : Jul 3, 2023, 1:10:32 AM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/viewBookedService_BirdCourse.css">
        <link rel="stylesheet" href="css/customer_trackingBirdCourse.css" type="text/css">

    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container-fluid">
            <%@include file="viewBookedService_Head.jsp" %>
            <div class="filter-search">
                <div class="filter-side">
                    <p>Service status: </p>
                    <ul class="filter-option">
                        <li class="active"><a href="viewBookedService_BirdCourse.jsp">In-progress</a></li>
                        <li><a href="viewBookedService_BirdCourse_complete.jsp">Completed</a></li>
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
            <div class="section-body">
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
                                            Start date: ${booking.start_date}
                                        </b>
                                        <br>
                                        <b>
                                            End date: ${booking.end_date}
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
        <%@include file="footer.jsp" %>
    </body>
</html>
