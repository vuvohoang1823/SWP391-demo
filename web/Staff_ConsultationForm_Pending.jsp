<%--
    Document   : ConsultationForm
    Created on : Jun 15, 2023, 2:21:36 AM
    Author     : thang
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                    <%@ include file="Staff_FormList_Head.jsp" %>
                    <section class="form-body">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <div class="navbar-brand">Form status:</div>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <form class="form-inline my-2 my-lg-0" action="SearchFormConsultation" method="post">
                                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                    <ul class="navbar-nav mr-auto">
                                        <li class="nav-item active">
                                            <a class="nav-link" href="Staff_ConsultationForm_Pending.jsp">Pending</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="Staff_ConsultationForm_Processing.jsp">Processing</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="search-container">
                                    <div style="white-space: nowrap; padding-right: 2rem">Search by customer</div>
                                    <div class="input-group">
                                        <input
                                            id="trainername"
                                            type="search"
                                            name="txtSearch"
                                            value="${requestScope.SeachValue}"
                                            class="form-control mr-sm-2"
                                            />
                                        <button
                                            class="btn btn-light"
                                            type="submit"
                                            name="action"
                                            value="pending"
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
                        <c:set var="searchMessage" value="${requestScope.searchMessage}"/>
                        <c:set var="seachValue" value="${requestScope.ListPending}"/>

                        <c:set var="ListPending" value="${f.appointmentFormPending}"/>
                        <c:set var="listForm" value="${ empty searchMessage ? ListPending : seachValue}"/>
                        <div class="d-flex justify-content-center" style="font-size: 1.5rem; padding: 3rem 0;">
                            Currently showing ${empty searchMessage ? ListPending.size() : seachValue.size()} pending form(s)
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
                            <c:forEach items="${listForm}" var="b" varStatus="counter" >
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
                                            <a href="MainController?action=view_form_detail&consultation_id=${b.consultation_id}"><button class="viewDetail">View Detail</button></a>
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