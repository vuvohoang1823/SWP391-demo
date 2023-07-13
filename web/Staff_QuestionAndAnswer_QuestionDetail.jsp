<%--
    Document   : FormDetails
    Created on : Jun 15, 2023, 1:14:29 PM
    Author     : thang
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- bootstrap -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <!-- css -->
        <link rel="stylesheet" href="css/reset.css" />
        <link rel="stylesheet" href="css/Staff_QuestionAndAnswer_QuestionDetail.css" />
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
                            <a href="<%= previousPage%>">
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
                            <div class="container-fluid">
                                <div class="" id="navbarSupportedContent">
                                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                        <li class="nav-item active">
                                            <a class="nav-link" href="Staff_QuestionAndAnswer_List.jsp"><b>Question List</b></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="Staff_QuestionAndAnswer_AnsweredList.jsp"><b>Answered List</b></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </section>
                    <c:if test="${not empty sessionScope.QuestionForm}">
                        <c:set var="question" value="${sessionScope.QuestionForm}"/>
                        <div class="container-fluid" style="padding: 0 2.5%">
                            <div class="forms-container">
                                <div class="forms-header">
                                    <div class="left-side"><b>Request Detail</b></div>
                                    <div class="right-side">
                                        <span>Submitted: <b>${question.submitDate}</b></span>
                                        <span><b>ID : ${question.id}</b></span>
                                    </div>
                                </div>
                                <form method="post" action="FormAnswerbyStaff">
                                    <div class="form-customerDetails">
                                        <div class="form-name">
                                            <div class="name">Customer Information</div>
                                        </div>
                                        <div class="form-body">
                                            <div class="row">
                                                <div class="col-lg-7">
                                                    <div class="mb-5">
                                                        <label for="fullname" class="form-label">Full name</label>
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            id="fullname"
                                                            placeholder="Full name"
                                                            value="${question.fullname}"
                                                            disabled
                                                            />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="mb-5">
                                                    <label for="email" class="form-label">Email</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="email"
                                                        name="email_text"
                                                        placeholder="Email"
                                                        value="${question.email}"
                                                        disabled
                                                        />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-formDetails">
                                        <div class="form-name">
                                            <div class="name">Question Information</div>
                                        </div>
                                        <div class="form-body">
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="mb-5">
                                                        <label for="formtitle" class="form-label"
                                                               >Submitted Date</label
                                                        >
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            id="formtitle"
                                                            placeholder="Form title"
                                                            value="${question.submitDate}"
                                                            disabled
                                                            />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="mb-5">
                                                        <label for="formtitle" class="form-label"
                                                               >Title</label
                                                        >
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            id="formtitle"
                                                            placeholder="Form title"
                                                            value="${question.titleQ}"
                                                            disabled
                                                            />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="mb-3">
                                                    <label for="customernotes" class="form-label"
                                                           >Question message</label
                                                    >
                                                    <textarea
                                                        class="form-control long-input"
                                                        id="customernotes"
                                                        placeholder="Notes"
                                                        name="message"
                                                        style="height: 100px"
                                                        disabled
                                                        >${question.titleMess}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-formDetails">
                                        <div class="form-name">
                                            <div class="name">Answer Information</div>
                                        </div>
                                        <div class="form-body">
                                            <div class="row">
                                                <div class="mb-3">
                                                    <label for="customernotes" class="form-label"
                                                           >Answer message</label
                                                    >
                                                    <textarea
                                                        class="form-control long-input"
                                                        id="customernotes"
                                                        placeholder="Enter answer here"
                                                        style="height: 100px"
                                                        required
                                                        name="message_answer"
                                                        ></textarea>
                                                </div>
                                                <input type="hidden" name="email_email" value="${question.email}"/>
                                                <input type="hidden" name="formid" value="${question.id}"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="forms-footer">
                                        <div>
                                            <button class="btn update" type="button" data-bs-toggle="modal" data-bs-target="#confirmSubmit">Submit answer</button>
                                            <div class="modal fade" id="confirmSubmit" tabindex="-1" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h1 class="modal-title" style="font-size: 3rem">Submit answer</h1>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body fs-2" style="line-height: 2.5rem">
                                                            This answer will be sent to the customer's email. <br>
                                                            You can review it in Answered Question List later.
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" name="action" value="no" class="btn btn-secondary fs-2" data-bs-dismiss="modal">Close</button>
                                                            <button type="submit" name="action" value="yes" class="btn btn-primary fs-2" data-bs-dismiss="modal">Yes</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </c:if>
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
        <!--adjust height and trim space-->
        <script>
            function adjustTextareaHeight(textarea) {
                textarea.style.height = "auto";
                textarea.style.height = textarea.scrollHeight + "px";
            }

            function trimTrailingSpaces(textarea) {
                textarea.value = textarea.value.trim();
                adjustTextareaHeight(textarea);
            }

            var textareas = document.getElementsByClassName("long-input");
            for (var i = 0; i < textareas.length; i++) {
                textareas[i].addEventListener("input", function () {
                    adjustTextareaHeight(this);
                });
                textareas[i].addEventListener("blur", function () {
                    trimTrailingSpaces(this);
                });
                adjustTextareaHeight(textareas[i]);
            }
        </script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
