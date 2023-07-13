<%--
    Document   : ConsultationForm
    Created on : Jun 15, 2023, 2:21:36 AM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- boostrap -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <!-- w3Table -->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
        <!-- css -->
        <link rel="stylesheet" href="css/reset.css" />
        <link rel="stylesheet" href="css/Staff_ConsultationForm_List.css" />
        <jsp:useBean id="f" class="DAO.FormApppointmentDAO" scope="request"></jsp:useBean>
        <jsp:useBean id="tr" class="DAO.TrainerDAO" scope="request"></jsp:useBean>
        </head>
        <body>
            <div class="container-fluid">
                <div class="row flex-nowrap">
                    <!--            header-->
                <%@ include file="header.jsp" %>
                <div id="containerPage" class="col-md-8 col-lg-10 min-vh-100 p-0" style="flex-grow: 1; width: unset">
                    <section class="form-head">
                        <div class="heading d-flex align-items-center">
                            <svg width="40" height="40" viewBox="0 0 19 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M6 10H13" stroke="#33363F" stroke-width="2" stroke-linecap="round"/>
                            <path d="M1 5.22222C1 3.23185 1 2.23666 1.6224 1.61833C2.24479 1 3.24653 1 5.25 1H13.75C15.7534 1 16.7552 1 17.3776 1.61833C18 2.23666 18 3.23185 18 5.22222V13.6667C18 16.6522 18 18.145 17.0664 19.0725C16.1328 20 14.6302 20 11.625 20H7.375C4.36979 20 2.8672 20 1.9336 19.0725C1 18.145 1 16.6522 1 13.6667V5.22222Z" stroke="#33363F" stroke-width="2"/>
                            <path d="M13 17V20M6 17V20" stroke="#33363F" stroke-width="2" stroke-linecap="round"/>
                            <path d="M6 6H13" stroke="#33363F" stroke-width="2" stroke-linecap="round"/>
                            </svg>
                            <span style="padding-left: 2rem">Services</span>
                        </div>
                        <div class="navbar navbar-expand-lg navbar-light">
                            <div class="container-fluid">
                                <div class="" id="navbarSupportedContent">
                                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                        <li class="nav-item">
                                            <a class="nav-link" href="trainer_trackingBirdCourse.jsp">Bird Course</a>
                                        </li>
                                        <li class="nav-item active">
                                            <a class="nav-link" href="Trainer_PrivateConsultation_List.jsp">Private Consultant</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="Trainer_Workshop_FormList.jsp">Workshop</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="form-body">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <div class="navbar-brand">Service status:</div>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <form class="form-inline my-2 my-lg-0">
                                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                    <ul class="navbar-nav mr-auto">
                                        <li class="nav-item">
                                            <a class="nav-link" href="Trainer_PrivateConsultation_List.jsp">In-progress</a>
                                        </li>
                                        <li class="nav-item active">
                                            <a class="nav-link" href="Trainer_PrivateConsultation_Completed.jsp">Completed</a>
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
                            Currently showing 2 pending form(s)
                        </div>
                        <table
                            class="w3-table-all w3-hoverable w3-card-4 table-form"
                            style="width: 97.5%; margin: 0 auto"
                            >
                            <thead>
                                <tr>
                                    <td>ID</td>
                                    <td>Title</td>
                                    <td>Customer</td>
                                    <td>Appointment date request</td>
                                    <td>Trainer request</td>
                                    <td>Submitted date</td>
                                    <td>
                                        <div style="display: flex; justify-content: space-around;">
                                            <div style="padding-right: 11rem; height: 100%;">Type</div>
                                            <div style="height: 100%;"></div>
                                        </div>
                                    </td>
                                </tr>
                            </thead>
                            <c:forEach items="${f.appointmentFormHistory}" var="b" varStatus="counter" >
                                <c:set var="requestidd" value="${b.request_trainer_id}" />
                                <c:set var="trainername" value="${not empty requestidd ? tr.getTrainerNameByRequestTrainerId(requestidd) : 'N/A'}" />

                                <tr>
                                    <td class="id">${counter.count}</td>
                                    <td class="title">Basic Consultation Request</td>
                                    <td class="customer">${b.fullname}</td>
                                    <td class="customer">${b.duration} - ${b.date}</td>
                                    <td class="customer">${trainername}</td>
                                    <td class="customer">${b.dateSubmit}</td>
                                    <td>
                                        <div class="type">
                                            <div class="onlineStatus <c:out value="${fn:toLowerCase(b.type)}"/>">${b.type}</div>
                                            <a href="ViewfromCompletedbyTrainer?id=${b.consultation_id}"><button class="viewDetail">View Detail</button></a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
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
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
