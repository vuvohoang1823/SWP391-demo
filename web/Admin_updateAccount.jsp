<%--
    Document   : FormDetails
    Created on : Jun 15, 2023, 1:14:29 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create account</title>
        <!-- bootstrap -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <!--w3s-->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <!-- css -->
        <link rel="stylesheet" href="css/reset.css" />
        <link rel="stylesheet" href="css/Admin_createAccount.css" />

    </head>
    <body>

        <div class="container-fluid">
            <div class="row flex-nowrap">
                <!--            header-->
                <%@ include file="header.jsp" %>

                <div id="containerPage" class="col-md-8 col-lg-10 min-vh-100 p-0" style="flex-grow: 1; width: unset">
                    <section class="form-head">
                        <div class="heading d-flex align-items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width=40 height="40" fill="currentColor" class="bi bi-person-vcard" viewBox="0 0 16 16">
                            <path d="M5 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4Zm4-2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5ZM9 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4A.5.5 0 0 1 9 8Zm1 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5Z"/>
                            <path d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2ZM1 4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H8.96c.026-.163.04-.33.04-.5C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1.006 1.006 0 0 1 1 12V4Z"/>
                            </svg>
                            <span style="padding-left: 2rem">Account</span>
                        </div>
                        <div class="navbar navbar-expand-lg navbar-light" style="height: 60px">
                            <a href="Admin_listAccount.jsp">
                                <div style="
                                     position: absolute;
                                     top: 35%;
                                     left: 5rem;
                                     font-size: 1.5rem;
                                     color: #617a55;
                                     ">
                                    &lt; Back
                                </div>
                            </a>
                            <div class="container-fluid" style="visibility: hidden">
                                <div class="" id="navbarSupportedContent">
                                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                        <li class="nav-item active">
                                            <a class="nav-link " href="Staff_ConsultationForm_Pending.jsp">Bird Course</a>
                                        </li>
                                        <li class="nav-item ">
                                            <a class="nav-link" href="Staff_ConsultationForm_Pending.jsp">Private Consultant</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="Staff_ConsultationForm_Pending.jsp">Contact Us</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </section>
                    <div class="container-fluid" style="padding: 0 2.5%">
                        <div class="forms-container">
                            <div class="forms-header">
                                <div class="left-side"><b>Modify Account</b></div>
                            </div>
                            <form action="UpdateAccount" method="POST">
                                <input type="hidden" name="user_id" value="${USER.user_id}">
                                <div class="form-customerDetails">
                                    <div class="form-body">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Full name</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id=""
                                                        value="${USER.fullname}"
                                                        name="fullname"
                                                        required/>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Phone</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id=""
                                                        value="${USER.contact}"
                                                        name="contact"
                                                        required/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Username</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id=""
                                                        value="${USER.username}"
                                                        name="username"
                                                        readonly
                                                        required/>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Password</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id=""
                                                        value="${USER.password}"
                                                        name="password"
                                                        required/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Email</label>
                                                    <input
                                                        type="email"
                                                        class="form-control"
                                                        id=""
                                                        value="${USER.gmail}"
                                                        name="email"
                                                        required/>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Role</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id=""
                                                        value="${USER.role}"
                                                        name="role"
                                                        readonly
                                                        required/>
                                                </div>
                                            </div>

                                            <input type="hidden" id="role" name="role" value="${USER.role}">
                                        </div>
                                        <div class="forms-footer">
                                            <button type="submit" name="action" value="cancel" class="btn btn-secondary decline" style="width: 40rem;margin: 4rem;">Cancel</button>
                                            <button type="submit" name="action" value="update" class="btn approve" style="width: 40rem;margin: 4rem;">Update account</button>
                                            <button type="submit" name="action" value="delete" class="btn approve" style="width: 40rem;margin: 4rem;background: #FA5943">Delete account</button>
                                        </div>
                                        </form>
                                    </div>
                                </div>
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
                <script>
                    function chooseFile(fileInput) {
                        if (fileInput.files && fileInput.files[0]) {
                            var reader = new FileReader();
                            reader.onload = function (e) {
                                $('#image').attr('src', e.target.result);
                            }
                            reader.readAsDataURL(fileInput.files[0]);
                        }
                    }

                    function saveCategory() {
                        var selectedCategory = document.querySelector('input[name="selected-category"]:checked');
                        var categoryInput = document.getElementById('category');
                        var role = document.getElementById('role').value;

                        if (selectedCategory) {
                            var categoryValue = selectedCategory.nextElementSibling.querySelector('.category-name').innerText;
                            categoryInput.value = categoryValue;
                        } else {
                            categoryInput.value = 'hi';
                        }
                    }
                </script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
                </body>
                </html>