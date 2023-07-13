<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Management</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/Admin_listAccount.css" type="text/css">
    </head>
    <body>
        <jsp:useBean id="i" class="DAO.UserDAO" scope="request"></jsp:useBean>

            <div class="container-fluid">
                <div class="row flex-nowrap">
                <%@ include file="header.jsp" %>

                <div id="containerPage" class="col-md-8 col-lg-10 min-vh-100 p-0" style="flex-grow: 1; width: unset">
                    <section class="form-head">
                        <div class="heading d-flex align-items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width=40 height="40" fill="currentColor" class="bi bi-person-vcard" viewBox="0 0 16 16">
                            <path d="M5 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4Zm4-2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5ZM9 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4A.5.5 0 0 1 9 8Zm1 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5Z"/>
                            <path d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2ZM1 4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H8.96c.026-.163.04-.33.04-.5C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1.006 1.006 0 0 1 1 12V4Z"/>
                            </svg>
                            <span style="padding-left: 2rem">Account List</span>
                        </div>
                    </section>
                    <section class="form-body">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <div class="update">
                                <a href="Admin_createAccount.jsp">
                                    <button class="create-button">Create account</button>
                                </a>
                            </div>
                            <form class="form-inline my-2 my-lg-0">
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
                            <div class="d-flex justify-content-center" style="font-size: 1.5rem; padding: 2rem 0;">
                                Currently showing <c:out value="${i.allAccount.size()}"/> account(s)
                            </div>
                        </div>
                        <table
                            class="w3-table-all w3-hoverable w3-card-4 table-form"
                            style="width: 97.5%; margin: 0 auto"
                            >
                            <thead>
                                <tr>
                                    <td>ID</td>
                                    <td>Username</td>
                                    <td>Full name</td>
                                    <td>Role</td>
                                    <!--<td>Email</td>-->
                                    <td></td>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${i.allAccount}" var="user" varStatus="counter">
                                    <tr>

                                <input type="hidden" name="" value="">
                                <td><b>${counter.count}</b></td>
                                <td><b>${user.username}</b></td>
                                <td><b>${user.password}</b></td>
                                <td><b>${user.role}</b></td>
                                <!--<td><b>xxx</b></td>-->
                                <td>
                                    <!--                                    <form action="AccountDetail" method="POST">
                                                                            <input type="hidden" name="user_id" value="${user.user_id}">
                                                                            <button type="submit">Update</button>
                                                                        </form>-->
                                    <form action="AccountDetail" method="POST">
                                        <input type="hidden" name="user_id" value="${user.user_id}">
                                        <input type="hidden" name="role" value="${user.role}">
                                        <button type="submit" class="viewDetail"><b>Modify</b></button>
                                    </form>
                                </td>
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
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>


