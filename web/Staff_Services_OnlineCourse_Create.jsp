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
        <link rel="stylesheet" href="css/Staff_Blogs_Update.css" />
    </head>
    <body>
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
                            <a href="<%= previousPage%>">
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

                    <div class="container-fluid" style="padding: 0 2.5%">
                        <div class="forms-container">
                            <div class="forms-header">
                                <div class="left-side"><b>Create Course</b></div>
                                <div class="right-side">
                                    <!--<span><b>ID : #${online.courseID}</b></span>-->
                                </div>
                            </div>
                            <form action="Staff_OnlineCourse_CreateServlet" method="POST" enctype="multipart/form-data">
                                <div class="form-formDetails">
                                    <div class="form-name">
                                        <div class="name">Online Course Detail</div>
                                    </div>
                                    <div class="form-body">


                                        <!--Image-->
                                        <div class="row mb-5">
                                            <div class="col-lg-5 mb-5">
                                                <label for="thumbnail" class="form-label">Image:</label>
                                                <input type="file" id="thumbnail" name="image" class="form-control imgInput" accept="image/*" onchange="updateThumbnail(this)" multiple required/>
                                            </div>
                                            <div class="img-container d-flex justify-content-center">
                                                <img class="showImg" src="data:images/jpg;base64,${online.image}" alt="">
                                            </div>
                                        </div>

                                        <!--Title-->
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="mb-5">
                                                    <label for="author" class="form-label">Title:</label>
                                                    <input type="text" id="author" name="title"  value="${online.title}" class="form-control" placeholder="Enter author" required>
                                                </div>
                                            </div>
                                        </div>

                                        <!--Price && CourseID-->
                                        <div class="row">
                                            <!--CourseID-->
                                            <div class="col-lg-6">
                                                <div class="mb-5">
                                                    <label for="title" class="form-label">Course's id:</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="title"
                                                        name="courseID"
                                                        placeholder="Enter title"
                                                        value="${online.courseID}"
                                                        required
                                                        />
                                                </div>
                                            </div>

                                            <!--Price-->
                                            <div class="col-lg-6">
                                                <div class="mb-5">
                                                    <label for="title" class="form-label">Course's price:</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="title"
                                                        name="price"
                                                        placeholder="Enter title"
                                                        value="${online.price}"
                                                        required
                                                        />
                                                </div>
                                            </div>

                                        </div>


                                        <!--Content-->
                                        <div class="row">
                                            <div class="mb-5">
                                                <label for="briefinfo" class="form-label">Course description:</label>
                                                <textarea id="briefinfo"
                                                          name="content"
                                                          class="form-control long-input"
                                                          placeholder="Enter brief info"
                                                          required
                                                          >${online.content}</textarea>
                                            </div>
                                        </div>

                                        <!--Module 1-->

                                        <div class="row">
                                            <div class="mb-5">
                                                <label for="content1" class="form-label">Module title 1:</label>
                                                <textarea id="content1"
                                                          name="module_name_1"
                                                          class="form-control long-input"
                                                          placeholder="Enter content 1"
                                                          required>${online.module_name_1}</textarea>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="mb-5">
                                                <label for="des1" class="form-label">Module description 1:</label>
                                                <textarea id="des1"
                                                          name="module_description_1"
                                                          class="form-control long-input"
                                                          placeholder="Enter content 2"
                                                          required>${online.module_description_1}</textarea>
                                            </div>
                                        </div>


                                        <!--Module 2-->

                                        <div class="row">
                                            <div class="mb-5">
                                                <label for="content2" class="form-label">Module title 2:</label>
                                                <textarea id="content2"
                                                          name="module_name_2"
                                                          class="form-control long-input"
                                                          placeholder="Enter content 2"
                                                          required>${online.module_name_2}</textarea>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="mb-5">
                                                <label for="des2" class="form-label">Module description 2:</label>
                                                <textarea id="des2"
                                                          name="module_description_2"
                                                          class="form-control long-input"
                                                          placeholder="Enter content 2"
                                                          required>${online.module_description_2}</textarea>
                                            </div>
                                        </div>


                                        <!--Module 3-->

                                        <div class="row">
                                            <div class="mb-5">
                                                <label for="content3" class="form-label">Module title 3:</label>
                                                <textarea id="content3"
                                                          name="module_name_3"
                                                          class="form-control long-input"
                                                          placeholder="Enter content 3"
                                                          required>${online.module_name_3}</textarea>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="mb-5">
                                                <label for="des3" class="form-label">Module description 3:</label>
                                                <textarea id="des3"
                                                          name="module_description_3"
                                                          class="form-control long-input"
                                                          placeholder="Enter content 3"
                                                          required>${online.module_description_3}</textarea>
                                            </div>
                                        </div>


                                        <!--Module 4-->

                                        <div class="row">
                                            <div class="mb-5">
                                                <label for="content4" class="form-label">Module title 4:</label>
                                                <textarea id="content4"
                                                          name="module_name_4"
                                                          class="form-control long-input"
                                                          placeholder="Enter content 4"
                                                          required>${online.module_name_4}</textarea>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="mb-5">
                                                <label for="des4" class="form-label">Module description 4:</label>
                                                <textarea id="des4"
                                                          name="module_description_4"
                                                          class="form-control long-input"
                                                          placeholder="Enter content 4"
                                                          required>${online.module_description_4}</textarea>
                                            </div>
                                        </div>


                                        <!--Module 5-->

                                        <div class="row">
                                            <div class="mb-5">
                                                <label for="content5" class="form-label">Module title 5:</label>
                                                <textarea id="content5"
                                                          name="module_name_5"
                                                          class="form-control long-input"
                                                          placeholder="Enter content 5"
                                                          required>${online.module_name_5}</textarea>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="mb-5">
                                                <label for="des5" class="form-label">Module description 5:</label>
                                                <textarea id="des5"
                                                          name="module_description_5"
                                                          class="form-control long-input"
                                                          placeholder="Enter content 5"
                                                          required>${online.module_description_5}</textarea>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                                <div class="forms-footer">
                                    <div>
                                        <button type="submit" name="action" value="update" class="btn update">Create</button>
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
