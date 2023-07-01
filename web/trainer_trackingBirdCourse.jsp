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
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/trainer_trackingBirdCourse.css" type="text/css">
    </head>
    <body>
       

   <div class="container-fluid">
            <div class="row flex-nowrap"><
                <%@include  file="header.jsp" %>
                <div class="col-md-8 col-lg-10 min-vh-100 p-0">
        <div class="heading">Bird Tracking Progress</div>
        <div class="section-body">
<!--            <div class="title">
                <p>
                    Overall Tracking Progress
                </p>
            </div>-->
            <c:set var="result" value="${BookingDTO}"/>
            <c:if test="${not empty result}">


                <div class="section-body-content">
                    <div class="col-lg-7">
                        <img src="data:images/jpg;base64,${BookingDTO.courseImg}" style="border-radius: 100%; width: 50rem;height: 50rem" />
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
                                                    <span>Check-In</span>
                                                </label>
                                            </div>
                                            <div>
                                                <input type="radio" name="status" value="in-training" id="status">
                                                <label for="status">
                                                    <span>In-Training</span>
                                                </label>
                                            </div>
                                            <div>
                                                <input type="radio" name="status" value="completed" id="status">
                                                <label for="status">
                                                    <span>Completed</span>
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
            
    <%@include file="footer.jsp" %>
    <!--    <div style="background-color: red; height: 10rem; justify-content: center; align-items: center; display: flex;font-size: 5rem">
            MODULE
        </div>-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>

