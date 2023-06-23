<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bird course form</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/staff_formBirdCourse.css" type="text/css">
    </head>
    <body>
        <jsp:useBean id="i" class="DAO.TrainerDAO" scope="request"></jsp:useBean>
        <jsp:useBean id="a" class="DAO.BookingDAO" scope="request"></jsp:useBean>
        <%@ include file="header.jsp" %>
        <div class="title">
            <p>Bird Course Form</p>
        </div>
        <!--        <div class="container searchbar-container" style="padding-top: 5rem">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="input-group">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Search for Order ID"
                                    />
                                <div class="input-group-append">
                                    <span class="input-group-text" style="height: 100%">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="16"
                                            height="16"
                                            fill="currentColor"
                                            class="bi bi-search"
                                            viewBox="0 0 16 16"
                                            >
                                        <path
                                            d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"
                                            />
                                        </svg>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->
        <div class="w3-container" style="padding-top: 5rem">
            <table class="w3-table-all w3-large">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Course name</th>
                        <th>Customer</th>
                        <th>Bird Type</th>
                        <th>Action</th>
                    </tr> 
                </thead>
                <tbody>
                    <c:forEach items="${a.pendingOrder}" var="order" varStatus="counter">
                        <tr>
                    <form action="SetTrainerToBooking" method="GET" onsubmit="return validateForm(this)">
                        <input type="hidden" name="bird_id" value="${order.birdID}">
                        <td>${counter.count}</td>
                        <td>${order.courseName}</td>
                        <td>${order.customerName}</td>
                        <td>${order.typeBird}</td>
                        <td>
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal${counter.index}"
                                    style="background-color: #617A55;width: 10rem;font-size: 2rem;border-radius: 3rem;">
                                Edit
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal${counter.index}" tabindex="-1"
                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h2 class="modal-title" id="exampleModalLabel">Select Trainer</h2>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="modal-body-item">
                                                <select class="custom-select" size="5" name="filterChose"
                                                        style="width: 48rem;">
                                                    <c:forEach items="${i.trainerUnavailable}" var="s">
                                                        <option value="${s.trainerID}">${s.fullName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="footer-item" name="action" value="deny"
                                                    style="background-color: #617A55;width: 10rem;font-size: 2rem;border-radius: 3rem; height: 4rem; color: white; font-weight: bolder">
                                                Deny
                                            </button>
                                            <button type="submit" class="footer-item" name="action" value="approve"
                                                    style="background-color: #617A55;width: 10rem;font-size: 2rem;border-radius: 3rem; height: 4rem; color: white; font-weight: bolder">
                                                Approve
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </form>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <a href="BirdCourseCheckOut.jsp">Go to checkout page</a>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>



