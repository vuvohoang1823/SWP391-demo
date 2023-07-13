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
        <title>Tracking ${BookingDTO.nameBird}</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <!-- w3Table -->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/trainer_trackingBirdCourse.css" type="text/css">
    </head>
    <body>
        <div class="container-fluid">
            <div class="row flex-nowrap">
                <!--            header-->
                <%@ include file="header.jsp" %>

                <div id="containerPage" class="col-md-8 col-lg-10 min-vh-100 p-0" style="flex-grow: 1; width: unset">
                    <%@ include file="Trainer_Services_Head.jsp" %>
                    <section class="form-body">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <div class="navbar-brand">Service status:</div>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <form class="form-inline my-2 my-lg-0">
                                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                    <ul class="navbar-nav mr-auto">
                                        <li class="nav-item active">
                                            <a class="nav-link" href="Trainer_Tracking">In-progress</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="Trainer_History">Completed</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="search-container" style="visibility: hidden">
                                    <div style="white-space: nowrap; padding-right: 2rem;">Search by ID</div>
                                    <div class="input-group">
                                        <input
                                            id="trainername"
                                            type="search"
                                            class="form-control mr-sm-2"
                                            />
                                        <button
                                            class="btn btn-light"
                                            type="submit"
                                            id="button-addon2"
                                            >
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </nav>
                    </section>
                    <div class="section-body">
                        <c:set var="result" value="${BookingDTO}"/>
                        <c:if test="${not empty result}">


                            <div class="section-body-content">
                                <div class="col-lg-7">
                                    <img src="data:images/jpg;base64,${BookingDTO.courseImg}" style="border-radius: 100%; width: 40rem;height: 40rem" />
                                    <div class="left-content">
                                        <div class="text">
                                            <p>
                                                Bird's Name
                                            </p>
                                            <p>
                                                <b>
                                                    ${BookingDTO.nameBird}
                                                </b>
                                            </p>
                                        </div>
                                        <div class="text">
                                            <p>
                                                Bird Type
                                            </p>
                                            <p>
                                                <b>
                                                    ${BookingDTO.typeBird}
                                                </b>
                                            </p>
                                        </div>
                                        <div class="text">
                                            <p>
                                                Training Status
                                            </p>
                                            <p>
                                                <b style="color: #617A55">
                                                    ${BookingDTO.status}
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
                                                ${BookingDTO.courseName}
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
                                    <button name="button" value="clicked" class="button2" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                        <div class="text">
                                            <p>
                                                Set Status
                                            </p>
                                        </div>
                                    </button>

                                    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content" style="width: 80rem;height: 23rem;">
                                                <div class="modal-header" style="background-color: #B8C6C2">
                                                    <h5 class="modaltitle" >SET STATUS</h5>
                                                    <button name="button" value="close" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <form action="UpdateBookingStatus">
                                                    <div class="modalbody">

                                                        <input type="hidden" name="bird_id" value="${BookingDTO.birdID}">
                                                        <div>
                                                            <input type="radio" name="status" value="checkin" id="status">
                                                            <label for="status">
                                                                <span style="color: #FA5943">Check-In</span>
                                                            </label>
                                                        </div>
                                                        <div>
                                                            <input type="radio" name="status" value="in-training" id="status">
                                                            <label for="status">
                                                                <span style="color: #F69C14">In-Training</span>
                                                            </label>
                                                        </div>
                                                        <div>
                                                            <input type="radio" name="status" value="completed" id="status">
                                                            <label for="status">
                                                                <span style="color: #0A7E65">Completed</span>
                                                            </label>
                                                        </div>

                                                    </div>
                                                    <div class="modalfooter">
                                                        <button name="button" value="cancel" data-bs-dismiss="modal">Cancel</button>
                                                        <button name="button" value="submit" type="submit">Submit</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${empty result}">
                            <h2>You have no bird to track</h2>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <!--    <div style="background-color: red; height: 10rem; justify-content: center; align-items: center; display: flex;font-size: 5rem">
                MODULE
            </div>-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>

