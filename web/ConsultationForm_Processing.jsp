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
        <link rel="stylesheet" href="css/ConsultationForm_Processing.css" />
        <jsp:useBean id="a" class="DAO.FormApppointmentDAO"></jsp:useBean>
        </head>
        <body>
            <!--            header-->
        <%@ include file="header.jsp" %>

        <section class="form-head">
            <div class="heading">Consultation Form</div>
            <div class="navbar navbar-expand-lg navbar-light">
                <div class="container-fluid">
                    <div class="" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" href="ConsultationForm_Pending.jsp"><b>Pending</b></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="ConsultationForm_Processing.jsp"><b>Processing</b></a>
                                <hr style="height:4px;border-width:0;background-color:black">
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <section class="form-body">
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="navbar-brand">Filler request type:</div>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <form class="form-inline my-2 my-lg-0">
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <button class="nav-link" href="#"><b>All</b></button>
                            </li>
                            <li class="nav-item">
                                <button class="nav-link" href="#"><b>Online</b></button>
                            </li>
                            <li class="nav-item">
                                <button class="nav-link" href="#"><b>Offline</b></button>
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

            <table
                class="w3-table-all w3-hoverable w3-card-4 table-form"
                style="width: 97.5%; margin: 0 auto"
                >
                <thead>
                    <tr>
                        <td>ID</td>
                        <td>Title</td>
                        <td>Customer</td>
                        <td>
                            <div style="display: flex; justify-content: space-around;">
                                <div style="padding-right: 20rem; height: 100%;">Type</div>
                                <div style="height: 100%;"></div>
                                <div style="height: 100%;"></div>
                            </div>
                        </td>
                    </tr>
                </thead>               
                <c:forEach items="${a.appointmentFormProcessing}" var="b" varStatus="counter" >
                    <tr>
                        <td class="id">${counter.count}</td>
                        <td class="title">Basic Consultation Request</td>
                        <td class="customer">${b.customer_fullname}</td>
                        <td class="type">
                            <div style="display: flex;
                                 justify-content: space-around;
                                 align-items: center;
                                 font-weight: bold;">
                                <div class="onlineStatus ${b.type == 'online' ? 'online' : 'offline'}">${b.type}</div>
                                <div class="btn-group dropup">
                                    <button type="button" class="btn btn-secondary dropdown-toggle checkout-button" data-bs-toggle="dropdown" aria-expanded="false">
                                        Checkout
                                    </button>
                                    <form>
                                        <ul class="dropdown-menu">
                                            <li class="menu-name">Checkout to Order list</li>
                                            <li>
                                                <div class="button-container">
                                                    <a href="orderlist.jsp"><button type="button" class="btn btn-primary">Checkout</button></a>
                                                    <button type="button" class="btn btn-outline-primary">Cancel</button>
                                                </div>
                                            </li>
                                        </ul>
                                    </form>
                                </div>
                                <a href="viewFormProcessing?cid=${b.consultation_id}"><button class="viewDetail">View Detail</button></a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </section>

        <!--            footer-->
        <%@ include file="footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>
