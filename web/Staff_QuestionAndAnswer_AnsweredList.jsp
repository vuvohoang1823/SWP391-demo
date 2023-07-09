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
        <link rel="stylesheet" href="css/Staff_ConsultationForm_List.css" />
        <jsp:useBean id="list" class="DAO.GuestDAO" scope="request"></jsp:useBean>

        </head>
        <body>
            <div class="container-fluid">
                <div class="row flex-nowrap">
                    <!--            header-->

                <%@ include file="header.jsp" %>
                <div id="containerPage" class="col-md-8 col-lg-10 min-vh-100 p-0" style="flex-grow: 1; width: unset">
                    <section class="form-head">
                        <div class="heading d-flex align-items-center">
                           <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-question-square" viewBox="0 0 16 16">
                                        <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                        <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"/>
                                        </svg>
                            <span style="padding-left: 2rem">Q&A</span>
                        </div>
                        <div class="navbar navbar-expand-lg navbar-light">
                            <div class="container-fluid">
                                <div class="" id="navbarSupportedContent">
                                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                        <li class="nav-item">
                                            <a class="nav-link" href="Staff_QuestionAndAnswer_List.jsp"><b>Question List</b></a>
                                        </li>
                                        <li class="nav-item active">
                                            <a class="nav-link" href="Staff_QuestionAndAnswer_AnsweredList.jsp"><b>Answered List</b></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="form-body">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <form class="form-inline my-2 my-lg-0 d-flex justify-content-center">
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
                            Currently showing <c:out value="${list.allFormListCOMPLETED.size()}" /> question(s)
                        </div>
                        <table
                            class="w3-table-all w3-hoverable w3-card-4 table-form"
                            style="width: 97.5%; margin: 0 auto"
                            >
                            <thead>
                                <tr>
                                    <td>ID</td>
                                    <td>Title</td>
                                    <td>Full name</td>
                                    <td>Email</td>
                                    <td>Submitted date</td>
                                    <td>Question message</td>
                                </tr>
                            </thead>
                            <!--loop start-->
                            <c:forEach var="detail" items="${list.allFormListCOMPLETED}">
                                <tr>
                                    <td class="id">${detail.id}</td>
                                    <td class="title">
                                        <span class="question-message">${detail.titleQ}</span>
                                    </td>
                                    <td class="customer">${detail.fullname}</td>
                                    <td class="customer">
                                        <span class="question-message">${detail.email}</span>
                                    </td>
                                    <td class="customer">${detail.submitDate}</td>
                                    <td class="customer">
                                        <span class="question-message">${detail.titleMess}</span>
                                    </td>
                                    <td>
                                        <div class="type">
                                            <a href="ViewFormAnswerComplete?id=${detail.id}"><button class="viewDetail">View Detail</button></a>
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
        <!--reduce character-->
        <script>
            // Get all question message elements
            var questionMessages = document.getElementsByClassName("question-message");

            // Loop through each question message element
            for (var i = 0; i < questionMessages.length; i++) {
                var message = questionMessages[i].textContent;
                const messageLength = 25;

                // Check if the message length is greater than 10
                if (message.length > messageLength) {
                    // Truncate the message and append "..."
                    var truncatedMessage = message.substring(0, messageLength) + "...";
                    questionMessages[i].textContent = truncatedMessage;
                }
            }
        </script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
