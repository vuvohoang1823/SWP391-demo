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

            <div class="container-fluid">
                <div class="row flex-nowrap">
                <%@ include file="header.jsp"%>
                <div id="containerPage" class="col-md-8 col-lg-10 min-vh-100 p-0" style="flex-grow: 1; width: unset">
                    <%@ include file="Staff_FormList_Head.jsp" %>
                    <section class="form-body">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <div class="navbar-brand">Form status:</div>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <form class="form-inline my-2 my-lg-0">
                                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                    <ul class="navbar-nav mr-auto">
                                        <li class="nav-item active">
                                            <a class="nav-link" href="staff_birdCourseForm_pending.jsp">Pending</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="staff_birdCourseForm_processing.jsp">Processing</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="search-container">
                                    <div style="white-space: nowrap; padding-right: 2rem">Search by ID</div>
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
                            Currently showing <c:out value="${a.pendingOrder.size()}" /> pending form(s)
                        </div>
                        <table
                            class="w3-table-all w3-hoverable w3-card-4 table-form"
                            style="width: 97.5%; margin: 0 auto"
                            >
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Course name</th>
                                    <th>Customer</th>
                                    <th>Bird Type</th>
                                    <th>Request date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${a.pendingOrder}" var="order" varStatus="counter">
                                    <tr>
                                <form action="PendingOrderInfo" method="GET">
                                    <input type="hidden" name="bird_id" value="${order.birdID}">
                                    <td><b>${counter.count}</b></td>
                                    <td><b>${order.courseName}</b></td>
                                    <td><b>${order.customerName}</b></td>
                                    <td><b>${order.typeBird}</b></td>
                                    <td><b>${order.create_date}</b></td>
                                    <td>
                                        <a >
                                            <button class="viewDetail">
                                                <b>View Detail<b>
                                                        </button>
                                                        </a>
                                                        </td>


                                                        <!-- Modal -->
                                                        <%--<div class="modal fade" id="exampleModal${counter.index}" tabindex="-1"
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
                                                        </div>--%>
                                                        </form>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                    </table>
                                                    </section>
                                                    </div>
                                                    </div>
                                                    </div>
                                                    <script>
                                                        window.addEventListener('DOMContentLoaded', function () {
                                                            var headerWidth = document.getElementById('headerPage').offsetWidth;
                                                            var container = document.getElementById('containerPage');
                                                            container.style.maxWidth = 'calc(100% - ' + headerWidth + 'px)';
                                                        });
                                                    </script>
                                                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                                                    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
                                                    </body>
                                                    </html>



