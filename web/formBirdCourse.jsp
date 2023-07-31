<%--
    Document   : online_course_detail
    Created on : Jun 14, 2023, 8:40:43 PM
    Author     : vuvoh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/birdcourseDetail.css" type="text/css">
        <title>${detail.title}</title>
    </head><body>
        <%@ include file="header.jsp" %>

        <section class="section-head" style="position: relative">
            <p>
                COURSE INFORMATION
            </p>
            <p>
                ${detail.title}
            </p>
            <a href="<%= previousPage%>">
                <div style="
                     z-index: 1;
                     position: absolute;
                     top: 6rem;
                     left: 10rem;
                     font-size: 2.5rem;
                     color: black;
                     ">
                    &lt; Back
                </div>
            </a>
        </section>
        <section class="section-body" style="background-color: #DDE6F1">
            <div class="col-xl-5">
                <div class="body-content-left">
                    <img
                        src="data:images/jpg;base64,${detail.image}"
                        class="card-img-top"
                        alt="Product 1"
                        />
                    <p style="color: #617a55">
                        £${detail.price}
                    </p>
                    <p>
                        ${detail.title}
                    </p>
                    <div class="week-module">
                        <div class="col-xl-6">
                            <div style="color: #617a55">
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="25"
                                    height="25"
                                    fill="currentColor"
                                    class="bi bi-clock-fill"
                                    viewBox="0 0 16 16"
                                    >
                                <path
                                    d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"
                                    />
                                </svg>
                            </div>
                            <p>
                                ${detail.duration} days
                            </p>
                        </div>
                        <div class="col-xl-6">
                            <div style="color: #617a55">
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="25"
                                    height="25"
                                    fill="currentColor"
                                    class="bi bi-grid-3x2-gap-fill"
                                    viewBox="0 0 16 16"
                                    >
                                <path
                                    d="M1 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V4zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V4zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V4zM1 9a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V9zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V9zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V9z"
                                    />
                                </svg>
                            </div>
                            <p>
                                6 modules
                            </p>
                        </div>
                    </div>
                    <hr>
                    <div class="review">
                        <b class="star col-lg-4">5/5⭐</b>
                        <b class="review-count col-lg-9">based on 87 reviews</b>
                    </div>
                    <button>
                        <a href="#form-submission">
                            Purchase This Course
                        </a>
                    </button>
                </div>
            </div>
            <div class="col-xl-7">
                <div class="first-content">
                    <p>
                        <b>The course will cover the following topics</b>
                    </p>
                    <p>
                        <img src="img/349252734_479596974359728_5596993599118262797_n.png" alt="first content tick">
                        Can call the flock with resounding calls
                    </p>
                    <p>
                        <img src="img/349252734_479596974359728_5596993599118262797_n.png" alt="first content tick">
                        Array of sophisticated strategies and professional lesson
                    </p>
                    <p>
                        <img src="img/349252734_479596974359728_5596993599118262797_n.png" alt="first content tick">
                        Nurturing crested birds
                    </p>
                    <p>
                        <img src="img/349252734_479596974359728_5596993599118262797_n.png" alt="first content tick">
                        Quality - peace of mind - care
                    </p>
                </div>
                <div class="second-content">
                    <div class="line-container">
                        <hr class="line">
                        <span class="line-text">About Course</span>
                    </div>
                    <div class="text-detail blog-description"  >
                        <!--Our course will apply extensive knowledge and long experience of crested birds, including how to recognize and care for crested birds, how to train birds to sing and imitators of other sounds, as well as as techniques and strategies for training crested birds to sing and call out to the flock-->
                        ${detail.content }
                    </div>
                </div>
                <div class="third-content">
                    <div class="line-container">
                        <hr class="line">
                        <span class="line-text">Duration</span>
                    </div>
                    <div class="text-detail">
                        This course will takes some times from ${detail.duration} days
                        based on their birds and some related features.
                    </div>
                </div>
            </div>
            <hr>
        </section>

        <p id="form-submission" style="font-size: 3rem;font-weight: bolder;padding:5rem 5rem;background-color: white;color: #617a55">
            FORM SUBMISSION
        </p>

        <section class="form-container" style="background-color: white">
            <div class="col-xl-6" style="position: relative">
                <div id="formaddbirdfilter" class="filter">
                    <button type="button" data-bs-toggle="modal" data-bs-target="#addbirdmodal" style="background: transparent; border: 0">
                        <div style="font-size: 2rem; color: white;">
                            Choose bird
                            <div class="d-flex justify-content-center">
                                <svg xmlns="http://www.w3.org/2000/svg" width="72" height="72" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                                </svg>
                            </div>
                        </div>
                    </button>
                </div>
                <!-- Modal -->
                <div class="modal fade" id="addbirdmodal" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content" style="width: fit-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-2">Your birds:</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <div class="bird-list">
                                    <!--important: none needed for customers that didnt choose trainer (must change before submit form)-->
                                    <div class="bird-item">
                                        <input class="bird-input" type="radio" name="selected-bird" value="none" id="bird-none" checked>
                                        <label for="bird-none">
                                            None
                                        </label>
                                    </div>
                                    <!--start of bird -->
                                    <%--<c:forEach items="" var="birdinfo">--%>
                                    <div class="bird-item">
                                        <img src="img/Ellipse 2.png" alt="Trainer Avatar" class="bird-image">
                                        <input class="bird-input" type="radio" name="selected-bird" value="abc" id="bird-1" >
                                        <label for="bird-1">
                                            <span class="bird-name">Name: abc</span>
                                            <span> - </span>
                                            <span class="bird-type">Type: abc</span>
                                            <span> - </span>
                                            <span class="bird-birthday">Birthday: 2023-01-01</span>
                                        </label>
                                        <input class="birdID" value="" hidden>
                                    </div>
                                    <%--</c:forEach>--%>
                                    <!--end of bird-->
                                    <div>
                                        Don't have a bird yet? Add one <a href="Customer_AddBird.jsp">here</a>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <span id="choosebirdinvalid" style="display: none; color: red">Please choose a valid bird.</span>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary" onclick="saveBird()">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="
                     font-size: 4rem;
                     font-weight: bolder;
                     display: flex;
                     align-items: center;
                     width: 50%;">
                    Bird Details
                    <button id="changebirdbutton" type="button" data-bs-toggle="modal" data-bs-target="#addbirdmodal" style="background: transparent; border: 0; display: none; margin-left: 2rem">
                        <span>
                            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-wrench-adjustable-circle" viewBox="0 0 16 16">
                            <path d="M12.496 8a4.491 4.491 0 0 1-1.703 3.526L9.497 8.5l2.959-1.11c.027.2.04.403.04.61Z"/>
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0Zm-1 0a7 7 0 1 0-13.202 3.249l1.988-1.657a4.5 4.5 0 0 1 7.537-4.623L7.497 6.5l1 2.5 1.333 3.11c-.56.251-1.18.39-1.833.39a4.49 4.49 0 0 1-1.592-.29L4.747 14.2A7 7 0 0 0 15 8Zm-8.295.139a.25.25 0 0 0-.288-.376l-1.5.5.159.474.808-.27-.595.894a.25.25 0 0 0 .287.376l.808-.27-.595.894a.25.25 0 0 0 .287.376l1.5-.5-.159-.474-.808.27.596-.894a.25.25 0 0 0-.288-.376l-.808.27.596-.894Z"/>
                            </svg>
                        </span>
                    </button>
                </div>
                <div class="forms-container">
                    <!--            <form action="FormCourseServlet" method="post">
                                    <div class="form-input">
                                        <p>*Bird’s name:</p><input type="text" name="bird_name" required>
                                    </div>
                                    <div class="form-input">
                                        <p>*Bird type :</p><input type="text" name="bird_type" required>
                                    </div>
                                    <div class="form-input">
                                        <p>*Preferred date (the date you want to start the course):</p>
                                        <input type="date"
                                               value="2023-01-1"
                                               name="preferred_date"
                                               min="2023ui-01-01" max="2023-12-31" required>
                                    </div>
                                    <div>
                                        <p><input type="hidden" name="amount" value="${detail.price}"></p>
                                        <p><input type="hidden" name="course_id" value="${detail.courseID}"></p>
                                    </div>

                                                    <div class="form-input">
                                                        <p style="margin-bottom: 3rem">
                                                            *Bird image attachment
                                                        </p>
                                                        <div class="file-upload">
                                                            <label for="myfile" class="upload-label">
                                                                <img id="choose-image" src="img/add-image.png" alt="Logo" class="logo">
                                                                <img id="preview-image" src="" class="preview-image" style="position: absolute; width: 50%;max-height:100%;opacity: 0%">
                                                            </label>
                                                            <input type="file" id="myfile" name="myfile" class="file-input">
                                                        </div>
                                                    </div>
                                    <p style="margin-bottom: 3rem;font-size: 2rem;font-weight: bolder">
                                        Payment method:
                                    </p>
                                    <div class="radio-content">
                                        <input type="radio" style="width: 2rem;margin-bottom: 3rem;margin-right: 2rem">
                                        <p style="font-size: 2rem;margin-bottom: 3rem">
                                            Payment at <b>Bird Training Center</b>
                                        </p>
                                    </div>
                                    <button>
                                        Submit form
                                    </button>
                                </form>-->
                    <form action="" method="POST" enctype="multipart/form-data">
                        <div class="form-formDetails">
                            <div class="form-body">
                                <!--Image-->
                                <div class="row mb-5">
                                    <div class="img-container d-flex justify-content-center">
                                        <img id="birdimg" class="showImg" src="assets/images/avata.png" alt="">
                                    </div>
                                </div>

                                <!--Title-->
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="mb-5">
                                            <label for="birdname" class="form-label">Bird Name:</label>
                                            <input type="text" id="birdname" value="" placeholder="Name" class="form-control" disabled>
                                        </div>
                                    </div>
                                </div>

                                <!--Price && CourseID-->
                                <div class="row">
                                    <!--CourseID-->
                                    <div class="col-lg-6">
                                        <div class="mb-5">
                                            <label for="birdtype" class="form-label">Bird's Type:</label>
                                            <input
                                                type="text"
                                                class="form-control"
                                                id="birdtype"
                                                placeholder="Type"
                                                value=""
                                                disabled
                                                />
                                        </div>
                                    </div>

                                    <!--Price-->
                                    <div class="col-lg-6">
                                        <div class="mb-5">
                                            <label for="birdbirthday" class="form-label">Bird's Birthday:</label>
                                            <input
                                                type="date"
                                                class="form-control"
                                                id="birdbirthday"
                                                value=""
                                                disabled
                                                />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--these get sent-->
                        <input
                            id="birdID"
                            type="text"
                            value=""
                            hidden
                            />
                        <!--these get sent-->

                        <div class="forms-footer">
                            <div>
                                <button type="submit" value="" class="btn">Submit form</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="col-xl-5">
                <p style="font-size: 4rem;font-weight: bolder;margin-bottom: 4rem">
                    Payment Details
                </p>
                <div class="payment-detail">
                    <div class="detail-content">
                        <div class="col-xl">
                            <img src="data:images/jpg;base64,${detail.image}">
                        </div>
                        <div class="col-xl detail">
                            <p>
                                ${detail.title}
                            </p>
                            <p>
                                £${detail.price}
                            </p>
                        </div>
                        <hr>
                    </div>
                    <!--                <div class="price-content">
                                        <div class="col-xl-8">
                                            <p>
                                                Subtotal
                                            </p>
                                            <p>
                                                Value-added tax
                                            </p>
                                        </div>
                                        <div class="col-xl-4">
                                            <p>
                                                £${detail.price}
                                            </p>
                                            <p>
                                                £12.00
                                            </p>
                                        </div>
                                    </div>-->
                    <hr style="margin-bottom: 5rem">
                    <!--                <div class="total">
                                        <div class="col-xl-8">
                                            <p>
                                                <b>
                                                    Total
                                                </b>
                                            </p>
                                        </div>
                                        <div class="col-xl-4">
                                            <p>
                                                <b>
                                                    £132.00
                                                </b>
                                            </p>
                                        </div>
                                    </div>-->
                </div>
            </div>
        </section>
        <%@ include file="footer.jsp" %>
        <!--        save trainer-->
        <script>
            const myModal = new bootstrap.Modal(document.getElementById("addbirdmodal"));
            function saveBird() {
                const filter = document.getElementById("formaddbirdfilter");
                const inputBirdImg = document.getElementById("birdimg");
                const inputBirdName = document.getElementById("birdname");
                const inputBirdType = document.getElementById("birdtype");
                const inputBirdBirthday = document.getElementById("birdbirthday");
                const errormsg = document.getElementById("choosebirdinvalid");
                const changebirdbutton = document.getElementById("changebirdbutton");
                const submitBird = document.getElementById("birdID");
                const selectedBird = document.querySelector('input[name="selected-bird"]:checked');

                if (selectedBird && selectedBird.value === "none") {
                    errormsg.style.display = "block";
                } else {
                    myModal.hide();
                    errormsg.style.display = "none";
                    filter.style.display = "none";
                    changebirdbutton.style.display = "inline";


                    const birdItem = selectedBird.closest('.bird-item');

                    const birdImage = birdItem.querySelector('.bird-image').src;
                    const birdName = birdItem.querySelector('.bird-name').textContent.replace('Name: ', '');
                    const birdType = birdItem.querySelector('.bird-type').textContent.replace('Type: ', '');
                    const birdBirthday = birdItem.querySelector('.bird-birthday').textContent.replace('Birthday: ', '');
                    const birdID = birdItem.querySelector('.birdID').value;
                    //input into the form
                    inputBirdImg.src = birdImage;
                    inputBirdName.value = birdName;
                    inputBirdType.value = birdType;
                    inputBirdBirthday.value = birdBirthday;
                    submitBird.value = birdID;
                }
            }
        </script>
    </body>
</html>
