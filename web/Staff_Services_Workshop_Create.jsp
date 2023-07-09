<%--
    Document   : Staff_update_blog
    Created on : Jul 4, 2023, 7:46:00 PM
    Author     : hoang
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
        <!--css-->
        <link rel="stylesheet" href="css/reset.css" />
        <link rel="stylesheet" href="css/Staff_Services_Workshop_Update.css" />
    </head>
    <body>
        <jsp:useBean id="t" class="DAO.TrainerDAO" ></jsp:useBean>
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
                                     top: 35%;
                                     left: 5rem;
                                     font-size: 1.5rem;
                                     color: #617a55;
                                     ">
                                    &lt; Back
                                </div>
                            </a>
                        </div>
                    </section>
                    <div class="container-fluid" style="padding: 0 2.5%">
                        <div class="forms-container">
                            <div class="forms-header">
                                <div class="left-side"><b>Update Item</b></div>
                                <div class="right-side">
                                    <span><b>ID : #1</b></span>
                                </div>
                            </div>
                            <form action="UpdateServlet" method="POST" enctype="multipart/form-data">
                                <input type="hidden" value="${detail.blogid}" name="blogId"/>
                                <div class="form-formDetails">
                                    <div class="form-body">
                                        <div class="row">
                                            <div class="col-lg-5 mb-5">
                                                <label for="contentIMG" class="form-label">*Item image</label>
                                                <input type="file" id="contentIMG" name="contentIMG" class="form-control imgInput" accept="image/*" onchange="updateThumbnail(this)" required>
                                                <div class="img-container d-flex justify-content-center">
                                                    <img class="showImg" src="data:images/jpg;base64,${detail.contentIMG}" height="50px" width="50px" alt="">
                                                </div>
                                            </div>
                                            <div class="col-lg-7 row">
                                                <div class="col-lg-6">
                                                    <div class="mb-5">
                                                        <label for="title" class="form-label">*Item price</label>
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            id="title"
                                                            name="title"
                                                            placeholder="Enter title"
                                                            value="${detail.title}"
                                                            required
                                                            />
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="mb-5">
                                                        <label for="title" class="form-label">*Item id</label>
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            id="title"
                                                            name="title"
                                                            placeholder="Enter title"
                                                            value="${detail.title}"
                                                            required
                                                            />
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="mb-5">
                                                        <label for="briefinfo" class="form-label">*Item title</label>
                                                        <textarea id="briefinfo"
                                                                  name="briefinfo"
                                                                  class="form-control long-input"
                                                                  placeholder="Enter brief info"
                                                                  required
                                                                  >${detail.briefinfo}</textarea>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="mb-5">
                                                        <label for="briefinfo" class="form-label">*Item description</label>
                                                        <textarea id="briefinfo"
                                                                  name="briefinfo"
                                                                  class="form-control long-input"
                                                                  placeholder="Enter brief info"
                                                                  required
                                                                  >${detail.briefinfo}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <div class="mb-5">
                                                    <div class="mb-5">
                                                        <label for="date" class="form-label">*Close registration date</label>
                                                        <input type="date" id="date" name="date"  value="${detail.date}"class="form-control" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="mb-5">
                                                    <div class="mb-5">
                                                        <label for="date" class="form-label">*Starting date</label>
                                                        <input type="date" id="date" name="date"  value="${detail.date}"class="form-control" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="mb-5">
                                                    <div class="mb-5">
                                                        <label for="date" class="form-label">*Starting time</label>
                                                        <input type="date" id="date" name="date"  value="${detail.date}"class="form-control" required>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-5">
                                            <div class="col-lg-6">
                                                <c:set var="RequestTrainerid" value="${detail.request_trainer_id}"/>
                                                <c:choose>
                                                    <c:when test="${not empty RequestTrainerid}">
                                                        <c:set var="g" value="${t.getTrainerByID(RequestTrainerid)}"/>
                                                        <div class="mb-3">
                                                            <label for="trainername" class="form-label"
                                                                   >*Trainer selection</label
                                                            >
                                                            <div class="input-group">
                                                                <input
                                                                    id="trainername"
                                                                    type="text"
                                                                    class="form-control"
                                                                    placeholder="${g.fullName}"
                                                                    disabled
                                                                    />
                                                                <!--only this gets submitted-->
                                                                <input
                                                                    id="hiddenTrainerName"
                                                                    type="hidden" value="${g.fullName}"
                                                                    />
                                                                <!---------------------------->
                                                                <button
                                                                    class="btn btn-primary"
                                                                    type="button"
                                                                    id="button-addon2"
                                                                    data-bs-toggle="modal"
                                                                    data-bs-target="#chooseTrainer"
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
                                                                                <h1 class="modal-title fs-5">Trainers:</h1>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                                            </div>
                                                                            <div class="modal-body">

                                                                                <div class="trainer-list">
                                                                                    <!--important: none needed for customers that didnt choose trainer (must change before submit form)-->
                                                                                    <div class="trainer-item">
                                                                                        <input class="trainer-input" type="radio" name="selected-trainer" value="none" id="trainer-none">
                                                                                        <label for="trainer-none">
                                                                                            None
                                                                                        </label>
                                                                                    </div>
                                                                                    <!--start of trainer -->
                                                                                    <c:forEach items="${t.trainerUnavailableWithfullSkill}" var="trainerinfo">
                                                                                        <div class="trainer-item">
                                                                                            <img src="data:images/jpg;base64,${trainerinfo.img}" alt="Trainer Avatar" class="trainer-avatar">
                                                                                            <input class="trainer-input" type="radio" name="selected-trainer" value="${trainerinfo.trainerID}" id="trainer-${s.trainerID}" ${g.fullName eq trainerinfo.fullName ? 'checked' : ''} >
                                                                                            <label for="trainer-${s.trainerID}">
                                                                                                <span class="trainer-name">Name: ${trainerinfo.fullName}</span>
                                                                                                <span> - </span>
                                                                                                <span class="trainer-skill">Skill: ${trainerinfo.skill_name}</span>
                                                                                                <span> - </span>
                                                                                                <span class="trainer-skill">Contact: ${trainerinfo.contact}</span>
                                                                                            </label>
                                                                                        </div>
                                                                                    </c:forEach>
                                                                                    <!--end of trainer-->
                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="saveTrainer()">Save changes</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="mb-3">
                                                            <label for="trainername" class="form-label"
                                                                   >*Trainer selection</label
                                                            >
                                                            <div class="input-group">
                                                                <input
                                                                    id="trainername"
                                                                    type="text"
                                                                    class="form-control"
                                                                    placeholder="None"
                                                                    disabled
                                                                    />
                                                                <!--only this gets submitted-->
                                                                <input
                                                                    id="hiddenTrainerName"
                                                                    type="hidden"
                                                                    />
                                                                <!---------------------------->
                                                                <button
                                                                    class="btn btn-primary"
                                                                    type="button"
                                                                    id="button-addon2"
                                                                    data-bs-toggle="modal"
                                                                    data-bs-target="#chooseTrainer"
                                                                    style="
                                                                    border: 0;
                                                                    border-radius: 0px 5px 5px 0px;
                                                                    background: #617A55;
                                                                    "
                                                                    >
                                                                    Set trainer
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
                                                                                <h1 class="modal-title fs-5">Trainers:</h1>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                                            </div>
                                                                            <div class="modal-body">

                                                                                <div class="trainer-list">
                                                                                    <!--important: none needed for customers that didnt choose trainer (must change before submit form)-->
                                                                                    <div class="trainer-item">
                                                                                        <input class="trainer-input" type="radio" name="selected-trainer" value="none" id="trainer-none" checked>
                                                                                        <label for="trainer-none">
                                                                                            None
                                                                                        </label>
                                                                                    </div>
                                                                                    <!--start of trainer -->
                                                                                    <c:forEach items="${t.trainerUnavailableWithfullSkill}" var="trainerinfo">
                                                                                        <div class="trainer-item">
                                                                                            <img src="data:images/jpg;base64,${trainerinfo.img}" alt="Trainer Avatar" class="trainer-avatar">
                                                                                            <input class="trainer-input" type="radio" name="selected-trainer" value="${trainerinfo.trainerID}" id="trainer-${trainerinfo.trainerID}">
                                                                                            <label for="trainer-${trainerinfo.trainerID}">
                                                                                                <span class="trainer-name">Name: ${trainerinfo.fullName}</span>
                                                                                                <span> - </span>
                                                                                                <span class="trainer-skill">Skill: ${trainerinfo.skill_name}</span>
                                                                                                <span> - </span>
                                                                                                <span class="trainer-skill">Contact: ${trainerinfo.contact}</span>
                                                                                            </label>
                                                                                        </div>
                                                                                    </c:forEach>
                                                                                    <!--end of trainer-->
                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="saveTrainer()">Save changes</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="col-lg-3 mb-5">
                                                <label for="title" class="form-label">*Trainer ID</label>
                                                <input
                                                    type="text"
                                                    class="form-control"
                                                    id="title"
                                                    name="title"
                                                    placeholder="Enter title"
                                                    value="${detail.title}"
                                                    required
                                                    />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="forms-footer">
                                    <div>
                                        <button type="submit" name="action" value="update" class="btn create">Create</button>
                                    </div>
                                    <div>
                                        <button type="submit" name="action" value="update" class="btn close">Cancel</button>
                                    </div>
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
        <!--show toast on forms-->
        <script>
            // Get all form elements using querySelectorAll
            var forms = document.querySelectorAll("form");
            // Attach an event listener to each form's submit event
            forms.forEach(function (form) {
                form.addEventListener("submit", function (event) {
                    // Prevent the default form submission behavior
//                    event.preventDefault();
                    // Show success toast
                    Toastify({
                        text: "Submit success",
                        position: "center",
                        close: true,
                        gravity: "top",
                        duration: 3000,
                        style: {
                            fontSize: "2rem",
                            background: "linear-gradient(to right, #00b09b, #96c93d)"
                        }
                    }).showToast();
                });
            });
        </script>
        <!--update image-->
        <script>
            function updateThumbnail(input) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    var showImg = input.parentNode.parentNode.querySelector('.img-container').querySelector('.showImg');
                    showImg.src = e.target.result;
                };

                if (input.files && input.files[0]) {
                    reader.readAsDataURL(input.files[0]);
                }
            }

            var imgInputs = document.getElementsByClassName("imgInput");
            for (var i = 0; i < imgInputs.length; i++) {
                var imgInput = imgInputs[i];
                imgInput.onchange = function () {
                    updateThumbnail(this);
                };
            }
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
        <!--                check empty trainer-->
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const inputTrainerName = document.getElementById("trainername");
                const hiddenTrainerName = document.getElementById("hiddenTrainerName");
                const modal = new bootstrap.Modal(document.getElementById("chooseTrainer"));

                const selectedTrainer = document.querySelector('input[name="selected-trainer"]:checked');
                if (selectedTrainer.value === "none") {
                    inputTrainerName.value = "";
                } else {
                    const trainerLabel = selectedTrainer.nextElementSibling;
                    const trainerName = trainerLabel.querySelector(".trainer-name").textContent;
                    inputTrainerName.value = trainerName.split(": ")[1];
                }

                const form = document.querySelector("form");
                form.addEventListener("submit", function (event) {
                    const selectedTrainer = document.querySelector('input[name="selected-trainer"]:checked');
                    if (inputTrainerName.disabled && inputTrainerName.value.trim() === "") {
                        event.preventDefault();
                        // Display an error message or take any other necessary action
                        alert("Please select a trainer.");
                    }
                    if (inputTrainerName.value !== "") {
                        hiddenTrainerName.value = selectedTrainer.value;
                    }
                });
            });
        </script>
        <!--        save trainer-->
        <script>
            function saveTrainer() {
                const inputTrainerName = document.getElementById("trainername");
                const selectedTrainer = document.querySelector('input[name="selected-trainer"]:checked');
                if (selectedTrainer.value === "none") {
                    inputTrainerName.value = "";
                } else {
                    const trainerLabel = selectedTrainer.nextElementSibling;
                    const trainerName = trainerLabel.querySelector(".trainer-name").textContent;
                    inputTrainerName.value = trainerName.split(": ")[1];
                }
            }
        </script>
        <!--toast-->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
        <!--bs5-->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
