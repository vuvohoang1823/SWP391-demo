<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/trainer_birdCourse_completed.css" type="text/css">
    </head>
    <body>
        <div class="container-fluid">
            <div class="row flex-nowrap">
                <!--            header-->
                <%@ include file="header.jsp" %>
                <c:if test="${not empty sessionScope.BookingDTO}">
                    <c:set var="result" value="${sessionScope.BookingDTO}"/>
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
                                            <li class="nav-item ">
                                                <a class="nav-link" href="Trainer_Tracking">In-progress</a>
                                            </li>
                                            <li class="nav-item active">
                                                <a class="nav-link" href="Trainer_History">Completed</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="search-container" >
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
                            <div class="d-flex justify-content-center" style="font-size: 1.5rem; padding: 3rem 0;">
                                Currently showing <c:out value="${result.size()}" /> order(s)
                            </div>
                            <table
                                class="w3-table-all w3-hoverable w3-card-4 table-form"
                                style="width: 97.5%; margin: 0 auto"
                                >
                                <thead>
                                    <tr>
                                        <td>ID</td>
                                        <td>Course name</td>
                                        <td>Customer name</td>
                                        <td>Bird type</td>
                                        <td>Bird name</td>
                                        <td>Checkout date</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${result}" var="order" varStatus="counter">
                                        <tr>
                                            <td><b>${counter.count}</b></td>
                                            <td><b>${order.courseName}</b></td>
                                            <td><b>${order.customerName}</b></td>
                                            <td><b>${order.typeBird}</b></td>
                                            <td><b>${order.nameBird}</b></td>
                                            <td><b>${order.create_date}</b></td>
                                            <td><b></b></td>
                                            <td>
                                                <form action="GetTrainerBirdCourseDetailCompleted" metdod="GET">
                                                    <input type="hidden" name="booking_id" value="${order.bookingID}">
                                                    <a >
                                                        <button class="viewDetail">
                                                            <b>View Detail</b>
                                                        </button>
                                                    </a>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </section>
                    </div>
                </c:if>
            </div>
        </div>
        <!--    <div style="background-color: red; height: 10rem; justify-content: center; align-items: center; display: flex;font-size: 5rem">
                MODULE
            </div>-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>


