<%--
    Document   : homepage-contactUs
    Created on : Jun 10, 2023, 4:37:19 PM
    Author     : thang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.CustomerDTO"%>
<%@page import="DAO.CustomerDAO"%>
<%@page import="entity.UserDTO"%>
<%
    // Retrieve the UserDTO object from the session
    CustomerDTO user = (CustomerDTO) session.getAttribute("LOGIN_USER");

    // Create an instance of the CustomerDAO
    CustomerDAO customerDAO = new CustomerDAO();

    // Get the customer ID using the user ID
//    int customerID = customerDAO.getCustomerID(user.getUser_id());
    int customerID = customerDAO.getCustomerID(user.getCustomer_id());
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/reset.css" />
        <link rel="stylesheet" href="css/privateconsultationForm.css" />
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
    <body>
        <jsp:useBean id="i" class="DAO.TrainerDAO" scope="request"></jsp:useBean>
            <section class="section-contactUs">
                <!--left side-->
                <div class="left" style="background-image: url(./img/homeContactBackground.png);">
                    <div class="heading1">
                        <h1>CONTACT US</h1>
                        <hr size="2" color="white" />
                    </div>
                    <div class="icons">
                        <span>
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="16"
                                height="16"
                                fill="currentColor"
                                class="bi bi-facebook"
                                viewBox="0 0 16 16"
                                >
                            <path
                                d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"
                                />
                            </svg>
                        </span>
                        <span>
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="16"
                                height="16"
                                fill="currentColor"
                                class="bi bi-instagram"
                                viewBox="0 0 16 16"
                                >
                            <path
                                d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"
                                />
                            </svg>
                        </span>
                        <span>
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="16"
                                height="16"
                                fill="currentColor"
                                class="bi bi-youtube"
                                viewBox="0 0 16 16"
                                >
                            <path
                                d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.007 2.007 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.007 2.007 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31.4 31.4 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.007 2.007 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A99.788 99.788 0 0 1 7.858 2h.193zM6.4 5.209v4.818l4.157-2.408L6.4 5.209z"
                                />
                            </svg>
                        </span>
                    </div>
                    <div class="content">
                        <div>Email: contact@birdtrainingcenter.com</div>
                        <div>Phone: 0923457623</div>
                    </div>
                    <div class="card">
                        <div class="image-container">
                            <img src="./img/contactUsCardImage.png" alt="Card Image" />
                        </div>
                        <div class="card-body">
                            <input
                                type="text"
                                class="text-field"
                                placeholder="Your email address"
                                />
                            <button class="button">Notify me</button>
                        </div>
                    </div>
                </div>

                <!-- right side -->
                <div class="right">
                    <div class="form-container">
                        <div class="heading1">
                            <div class="logo-container">
                                <div class="logo-image">
                                    <img src=img/logo_black.png alt="page logo" />
                                </div>
                                <div class="logo-text">
                                    <p style="margin: 0">BIRD</p>
                                    <p style="margin: 0">TRAINING</p>
                                    <p style="margin: 0">CENTER</p>
                                </div>
                            </div>
                            <h1>CONSULTATION FORM</h1>
                        </div>
                        <form action="formappointmentservlet" method="POST" id="myForm">
                            <div class="content">
                                <!---Chinh name nho chinh ca dong 479-488 ---->
                                <!--                            name-->
                                <div class="row">
                                    <input type="text" name="fullname" placeholder="Full name" required />
                                </div>
                                <!--                            email-->
                                <div class="row">
                                    <input type="email" name="email" placeholder="Your email address" required />
                                </div>
                                <!--                            phone-->
                                <div class="row">
                                    <input type="tel" name="phone" placeholder="Your phone number (10 digits)" pattern="[0-9]{10}" required />
                                </div>
                                <!--                            address-->
                                <div class="row">
                                    <input type="text" name="address" placeholder="Your address" required />
                                </div>
                                <!--                            trainer-->
                                <div class="row">
                                    <div class="input-group">
                                        <!--not submited-->
                                        <input
                                            id="trainername"
                                            type="text"
                                            class="form-control"
                                            placeholder="None"
                                            disabled
                                            />
                                        <!---------------->
                                        <button
                                            class="btn btn-primary"
                                            type="button"
                                            id="button-addon2"
                                            data-bs-toggle="modal"
                                            data-bs-target="#chooseTrainer"
                                            style="font-size: 1.5rem; border: 0; background-color: #617a55; border-radius: 0 4px 4px 0"
                                            >
                                            Select Trainer
                                        </button>
                                        <!-- Modal -->
                                        <div
                                            class="modal fade"
                                            id="chooseTrainer"
                                            tabindex="-1"
                                            data-bs-backdrop="static"
                                            data-bs-keyboard="false"
                                            >
                                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h1 class="modal-title fs-5">Trainers</h1>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="trainer-list">
                                                            <!--important: none needed for customers that dont choose trainer-->
                                                            <div class="trainer-item">
                                                                <input class="trainer-input" type="radio" name="selected-trainer" value="none" id="trainer-none" checked>
                                                                <label for="trainer-none">
                                                                    None
                                                                </label>
                                                            </div>
                                                        <c:forEach items="${i.trainerUnavailableWithfullSkill}" var="s">
                                                            <div class="trainer-item" >
                                                                <img src="data:images/jpg;base64,${s.img}" alt="Trainer Avatar" class="trainer-avatar">
                                                                <input class="trainer-input" type="radio" name="selected-trainer" value="${s.trainerID}" id="trainer1">
                                                                <label for="trainer">
                                                                    <span class="trainer-name">Name: ${s.fullName}</span><br/>
                                                                    <span> - </span>
                                                                    <span class="trainer-skill">Skill: ${s.skill_name}</span><br/>.
                                                                    <span> - </span>
                                                                    <span class="trainer-skill">Contact: ${s.contact}</span>
                                                                </label>
                                                            </div>
                                                        </c:forEach>
                                                        <!--end of trainer-->
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="border-radius: 0.56rem;">Close</button>
                                                    <button type="button" class="btn btn-primary" id="saveTrainer" data-bs-dismiss="modal" style="font-size: 2rem;
                                                            border: 0;
                                                            border-radius: 0.56rem;
                                                            background-color: #617a55;
                                                            color: white;">Save changes</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--choose date and time-->
                            <div class="row">
                                <label for="chooseDate" style="margin-bottom: 1rem;">
                                    <span>Select start date and time:</span>
                                    <span class="info-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-question-circle" viewBox="0 0 16 16">
                                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                        <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"/>
                                        </svg>
                                        <div class="info-box">
                                            We accept forms starting from 3 days from today until next month.
                                        </div>
                                    </span>
                                </label>
                                <div class="date-info p-0 d-flex justify-content-between">
                                    <select name="Time_start" style="text-align: center">
                                        <option value="7:00:00">
                                            7:00
                                        </option>
                                        <option value="14:00:00">
                                            14:00
                                        </option>
                                        <option value="19:00:00">
                                            19:00
                                        </option>
                                    </select>
                                    <input id="chooseDate"
                                           type="date"
                                           value=""
                                           name="startdate"
                                           min=""
                                           max=""
                                           required
                                           style="width: 60%"
                                           >
                                </div>
                            </div>
                            <!--------------->
                            <!--request message-->
                            <div class="row textarea-container" style="height: 15rem">
                                <textarea name="note" rows="4" cols="40" placeholder="Enter request message (optional)" oninput="limitTextareaCharacters(this, 100)"></textarea>
                                <span class="character-count" id="counter"></span>
                            </div>
                            <!------------------->
                            <!--price-->
                            <div class="row">
                                <label for="consultPrice" style="margin-bottom: 1rem;">
                                    <span>Price:</span>
                                    <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-question-circle" viewBox="0 0 16 16">
                                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                        <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"/>
                                        </svg>
                                    </button>

                                    <!-- Modal -->
                                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-lg modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-1" id="exampleModalLabel">Price table</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="w3-container">
                                                        <p class="mb-3">The price will be updated automatically according to this table.</p>
                                                        <table class="w3-table-all w3-card-4">
                                                            <tr>
                                                                <th>Type</th>
                                                                <th>Description</th>
                                                                <th>Price/hour</th>
                                                            </tr>
                                                            <tr>
                                                                <td>Online</td>
                                                                <td>Remote/online sessions</td>
                                                                <!-- change this -->
                                                                <td id="onlinePrice">150.000</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Offline</td>
                                                                <td>In-person sessions</td>
                                                                <!-- change this -->
                                                                <td id="offlinePrice">200.000</td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary fs-2" data-bs-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </label>
                                <input id="consultPrice" value="" class="bg-white" disabled>
                            </div>
                            <!--------->
                            <div class="radio-container">
                                <div class="radio">
                                    <input id="consultTypeOnline" value="online" type="radio" name="type" style="width: 2rem; margin-right: 2rem" checked required>
                                    <label for="consultTypeOnline">Online</label>
                                </div>
                                <div class="radio">
                                    <input id="consultTypeOffline" value="offline" type="radio" name="type" style="width: 2rem; margin-right: 2rem" required>
                                    <label for="consultTypeOffline">Offline</label>
                                </div>
                            </div>

                            <div class="row button-container" style="margin-top: 2rem;">
                                <!--submit trainer-->
                                <input
                                    id="hiddenTrainerName"
                                    type="hidden"
                                    />
                                <!--submit current date-->
                                <input type="text" name="DateSubmitt" id="currentDate" value="" hidden=""/>
                                <!--submit price-->
                                <input type="text" name="price" id="priceSubmit" value="" hidden/>
                                <!----------------------->
                                <button  name="action" type="button"  value="Submit Form"  class="btn btn-primary w-100" onclick="validateForm(event)">
                                    Submit form
                                </button>
                            </div>
                        </div>
                    </form>
                    <!-- Confirm Modal -->
                    <div
                        class="modal fade"
                        id="confirm-modal"
                        >
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel" style="font-size: 3rem !important; display: inline-block;">
                                        Confirm form
                                    </h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="confirm-modal">
                                        <p class="fs-1 mb-3">Please confirm the information below.</p>
                                        <div class="p-3" style="background: #b8c6c2">
                                            <div class="row mb-5">
                                                <div class="col-md-6 col-lg-6">
                                                    <label class="fs-1" style="font-weight: 700;" for="fullname">Full name:</label>
                                                    <div class="fs-2" id="fullname"></div>
                                                </div>
                                                <div class="col-md-6 col-lg-6">
                                                    <label class="fs-1" style="font-weight: 700;" for="phone">Phone number:</label>
                                                    <div class="fs-2" id="phone"></div>
                                                </div>
                                            </div>
                                            <div class="row mb-5">
                                                <div class="col-lg-12">
                                                    <label class="fs-1" style="font-weight: 700;" for="email">Email:</label>
                                                    <div class="fs-2" id="email"></div>
                                                </div>
                                            </div>
                                            <div class="row mb-5">
                                                <div class="col-lg-12">
                                                    <label class="fs-1" style="font-weight: 700;" for="address">Address:</label>
                                                    <div class="fs-2" id="address"></div>
                                                </div>
                                            </div>
                                            <div class="row mb-5">
                                                <div class="col-lg-12">
                                                    <label class="fs-1 mb-3" style="font-weight: 700;" for="trainer">Trainer:</label>
                                                    <div class="fs-2 trainer-item" id="trainer" class="trainer-item">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-5">
                                                <div class="col-lg-6">
                                                    <label class="fs-1" style="font-weight: 700;" for="consultType">Consult type:</label>
                                                    <div class="fs-2" id="consultType"></div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <label class="fs-1" style="font-weight: 700;" for="time">Time:</label>
                                                            <div class="fs-2" style="white-space: nowrap" id="time"></div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <label class="fs-1" style="font-weight: 700;" for="date">Date:</label>
                                                            <div class="fs-2" style="white-space: nowrap" id="date"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-5">
                                                <div class="col-lg-12">
                                                    <label class="fs-1" style="font-weight: 700;" for="note">Note:</label>
                                                    <div class="fs-2" id="note"></div>
                                                </div>
                                            </div>
                                            <div class="row mb-5 p">
                                                <div class="mr-auto col-lg-6">
                                                    <label class="fs-1" style="font-weight: 700;" for="price">Price:</label>
                                                    <div class="fs-1" id="price"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary fs-2" data-bs-dismiss="modal" style="border-radius: 0.56rem;">Cancel</button>
                                    <button type="button" class="btn btn-secondary fs-2" data-bs-dismiss="modal" onclick="submitForm(event)"
                                            style="font-size: 2rem;
                                            border: 0;
                                            border-radius: 0.56rem;
                                            background-color: #617a55;
                                            color: white;"
                                            >Submit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Success Modal -->
                    <div
                        class="modal fade"
                        id="formToStaff-modal"
                        tabindex="-1"
                        data-bs-backdrop="static"
                        data-bs-keyboard="false"
                        >
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel" style="font-size: 3rem !important; display: inline-block;">
                                        Submit successfully
                                    </h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" onclick="submitOnClose(event)"></button>
                                </div>
                                <div class="modal-body">
                                    Submit form successfully. Reload in 5s...
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary fs-2" data-bs-dismiss="modal" onclick="submitOnClose(event)">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--        limit text for textarea-->
        <script>
            function limitTextareaCharacters(textarea, maxLength) {
                textarea.value = textarea.value.slice(0, maxLength);
                var remainingChars = maxLength - textarea.value.length;
                document.getElementById('counter').textContent = remainingChars + '/' + maxLength;
            }
        </script>
        <!--        get price-->
        <script>
            var consultPriceInput = document.getElementById('consultPrice');
            var consultTypeOnline = document.getElementById('consultTypeOnline');
            var consultTypeOffline = document.getElementById('consultTypeOffline');
            var priceOnline = document.getElementById('onlinePrice').textContent;
            var priceOffline = document.getElementById('offlinePrice').textContent;


            function updateConsultPrice() {
                if (consultTypeOnline.checked) {
                    consultPriceInput.value = priceOnline;
                } else if (consultTypeOffline.checked) {
                    consultPriceInput.value = priceOffline;
                }
            }

            // Initial update based on the default selected option
            updateConsultPrice();

            // Update price when radio button is clicked
            consultTypeOnline.addEventListener('click', updateConsultPrice);
            consultTypeOffline.addEventListener('click', updateConsultPrice);
        </script>
        <!--        get time-->
        <script>
            // Get the current date
            var currentDate = new Date();
            var formattedCurrentDate = currentDate.toISOString().split('T')[0];
            document.getElementById('currentDate').value = formattedCurrentDate;

            // min 3 days from now
            var minDate = new Date();
            minDate.setDate(currentDate.getDate() + 3);
            var formattedMinDate = minDate.toISOString().split('T')[0];
            document.getElementById('chooseDate').min = formattedMinDate;

            // not over 30 days
            var maxDate = new Date();
            maxDate.setDate(currentDate.getDate() + 30);
            var formattedMaxDate = maxDate.toISOString().split('T')[0];
            document.getElementById('chooseDate').max = formattedMaxDate;

        </script>
        <!--        chose trainer-->
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const saveButton = document.getElementById("saveTrainer");
                const inputTrainerName = document.getElementById("trainername");
                const modal = new bootstrap.Modal(document.getElementById("chooseTrainer"));

                saveButton.addEventListener("click", function () {
                    const selectedTrainer = document.querySelector('input[name="selected-trainer"]:checked');
                    if (selectedTrainer.value === "none") {
                        //                      change this to set in the database
                        inputTrainerName.value = "";
                        ////////////////////////////////
                    } else {
                        const trainerLabel = selectedTrainer.nextElementSibling;
                        const trainerName = trainerLabel.querySelector(".trainer-name").textContent;
                        inputTrainerName.value = trainerName.split(": ")[1];
                    }
                });
            });
        </script>
        <!--        update trainer for confirm modal-->
        <script>
            function updateTrainerDetails() {
                var selectedTrainer = document.querySelector('input[name="selected-trainer"]:checked');
                if (selectedTrainer) {
                    var trainerItem = selectedTrainer.parentElement;
                    var trainerDetails = document.getElementById('trainer');

                    // Copy the HTML content of trainerItem
                    var clonedItem = trainerItem.cloneNode(true);

                    // Remove the input element from the cloned content
                    var inputElement = clonedItem.querySelector('.trainer-input');
                    inputElement.parentNode.removeChild(inputElement);

                    // Update the content of trainerDetails
                    trainerDetails.innerHTML = clonedItem.innerHTML;
                }
            }
        </script>
        <!--        submit and validate form-->
        <script>
            const form = document.getElementById("myForm");
            function validateForm(event) {
                event.preventDefault(); // Prevent the default form submission

                const inputTrainerName = document.getElementById("trainername");
                if (form.checkValidity()) {
                    const selectedTrainer = document.querySelector('input[name="selected-trainer"]:checked');
                    const hiddenTrainerName = document.getElementById("hiddenTrainerName");
                    hiddenTrainerName.value = selectedTrainer.value;

                    const priceSubmit = document.getElementById("priceSubmit");
                    priceSubmit.value = consultPriceInput.value;

                    showConfirmModal();
                } else {
                    form.reportValidity(); // Display validation error messages
                }
            }
            function showConfirmModal() {
                setConfirmData();
                const modal = document.getElementById("confirm-modal");
                const bsModal = new bootstrap.Modal(modal);
                bsModal.show();
            }
            function setConfirmData() {
                // Get the form input values
                var fullName = document.querySelector('input[name="fullname"]').value;
                var email = document.querySelector('input[name="email"]').value;
                var phoneNumber = document.querySelector('input[name="phone"]').value;
                var address = document.querySelector('input[name="address"]').value;
                var startDate = document.getElementById('chooseDate').value;
                var startTime = document.querySelector('select[name="Time_start"]').value;
                var note = document.querySelector('textarea[name="note"]').value;
                var price = document.getElementById('consultPrice').value;
                var consultationType = document.querySelector('input[name="type"]:checked').value;

                // Set the values in the respective divs
                document.getElementById("fullname").textContent = fullName;
                document.getElementById("email").textContent = email;
                document.getElementById("address").textContent = address;
                document.getElementById("phone").textContent = phoneNumber;
                updateTrainerDetails(); //set trainer data
                document.getElementById("consultType").textContent = consultationType;
                document.getElementById("date").textContent = startDate;
                document.getElementById("time").textContent = startTime;
                document.getElementById("price").textContent = price;
                document.getElementById("note").textContent = note;
            }
            function submitForm() {
                // Form is valid, show the modal
                showSuccessModal();

                setTimeout(function () {
                    form.submit(); // Submit the form after 5 seconds
                }, 5000);
            }
            function showSuccessModal() {
                const modal = document.getElementById("formToStaff-modal");
                const bsModal = new bootstrap.Modal(modal);
                bsModal.show();
            }
            function submitOnClose() {
                form.submit();
            }
        </script>
    </body>
</html>

