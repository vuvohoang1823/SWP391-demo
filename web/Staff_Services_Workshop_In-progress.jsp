<%--
    Document   : ConsultationForm
    Created on : Jun 15, 2023, 2:21:36 AM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <jsp:useBean id="f" class="DAO.WorkshopDAO" scope="request"></jsp:useBean>
        <jsp:useBean id="tr" class="DAO.TrainerDAO" scope="request"></jsp:useBean>
        </head>
        <body>
        <c:set var="result" value="${Booking}"/>
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
                        <div class="navbar navbar-expand-lg navbar-light" style="height: 60px">
                            <a href="Staff_Services_Workshop.jsp">
                                <div style="
                                     position: absolute;
                                     top: 21%;
                                     left: 5rem;
                                     ">
                                    <svg width="19" height="36" viewBox="0 0 19 36" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M17.9142 1.74339C16.9054 0.7346 15.2696 0.7346 14.2608 1.74339L1.63504 14.3818C-0.380997 16.3997 -0.380219 19.6697 1.63659 21.6867L14.2701 34.3201C15.2789 35.329 16.9147 35.329 17.9235 34.3201C18.9324 33.3113 18.9324 31.6756 17.9235 30.6667L7.11067 19.8538C6.10162 18.8451 6.10162 17.2093 7.11067 16.2005L17.9142 5.39674C18.9231 4.38795 18.9231 2.75244 17.9142 1.74339Z" fill="#0F0F0F"/>
                                    </svg>
                                </div>
                            </a>
                        </div>
                    </section>
                    <section class="form-body">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <div class="navbar-brand">Service status:</div>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <form class="form-inline my-2 my-lg-0" action="Staff_OrderList_Workshop_Search" method="post" >
                                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                    <ul class="navbar-nav mr-auto">
                                        <li class="nav-item active">
                                            <a class="nav-link" href="Staff_Workshop_ViewCustomer_CompletedServlet?">In-progress</a>
                                        </li>
                                        <!--                                        <li class="nav-item">
                                                                                    <a class="nav-link" href="Staff_Services_Workshop_Completed.jsp">Completed</a>
                                                                                </li>-->
                                    </ul>
                                </div>
                                <%--
        <!--                                <div class="search-container">
                                            <div style="white-space: nowrap; padding-right: 2rem">Search by workshop</div>
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
                                                    value="completed"
                                                    id="button-addon2"
                                                    >
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                                    </svg>
                                                </button>
                                            </div>
                                        </div>-->
                                --%>
                            </form>

                        </nav>
                        <c:set var="searchMessage" value="${requestScope.searchMessage}"/>
                        <c:set var="seachValue" value="${requestScope.ListCompleted}"/>

                        <c:set var="ListCompleted" value="${f.OrderListComplted()}"/>
                        <c:set var="listForm" value="${customer_list}"/>
                        <c:set var="workshopDetail" value="${workshop_detail}"/>
                        <div class="d-flex justify-content-center" style="font-size: 1.5rem; padding: 3rem 0;">
                            List of customers participate in&nbsp;<b>${workshopDetail.title}</b>
                        </div>
                        <form action="Trainer_Workshop_CheckAttendanceServlet" method="POST">
                            <table
                                class="w3-table-all w3-hoverable w3-card-4 table-form"
                                style="width: 97.5%; margin: 0 auto"
                                >
                                <thead>
                                    <tr>
                                        <td>ID</td>
                                        <td>Name</td>
                                        <td>Contact</td>
                                        <td>Email</td>
                                        <td>Attendance</td>
                                        <td>Status</td>
                                        <!--                                    <td>
                                                                                <div style="display: flex; justify-content: space-around;">
                                                                                    <div style="padding-right: 11rem; height: 100%;">Type</div>
                                                                                    <div style="height: 100%;"></div>
                                                                                </div>
                                                                            </td>-->
                                    </tr>
                                </thead>
                                <c:forEach items="${listForm}" var="b" varStatus="counter" >
                                    <form action="" method="POST">
                                        <tr>
                                            <td class="id">${counter.count}</td>
                                            <td class="title">${b.customer_fullname}</td>
                                            <td class="customer">${b.customer_contact}</td>
                                            <td class="customer">${b.customer_gmail}</td>
                                            <td class="customer">${b.attendance}</td>
                                            <td class="customer">${b.status}</td>


                                            <%--
        <!--                                    <td>
                                                <div class="type">
                                                    <div class="onlineStatus <c:out value="${fn:toLowerCase(b.type)}"/>">${b.type}</div>
                                                    <a href="MainController?action=view_form_completetd&consultation_id=${b.consultation_id}"><button class="viewDetail">View Detail</button></a>
                                                </div>
                                            </td>-->
                                            --%>
                                        </tr>
                                        <input type="hidden" name="customer_id_${b.customer_id}" value="${b.customer_id}" />
                                        <input type="hidden" name="workshop_id" value="${b.workshop_id}" />
                                    </form>

                                </c:forEach>
                            </table>

                        </form>

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
