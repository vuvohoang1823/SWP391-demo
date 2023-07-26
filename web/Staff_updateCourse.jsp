<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Course</title>
        <!-- bootstrap -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <!-- css -->
        <link rel="stylesheet" href="css/reset.css" />
        <link rel="stylesheet" href="css/Admin_createAccount.css" />

    </head>
    <body>

        <div class="container-fluid">
            <div class="row flex-nowrap">
                <!--            header-->
                <%@ include file="header.jsp" %>

                <div class="col-md-8 col-lg-10 min-vh-100 p-0" style="flex-grow: 1; width: unset">
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
                            <a href="Staff_Services_BirdCourse.jsp">
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
                            <!--                            <div class="container-fluid">
                                                            <div class="" id="navbarSupportedContent">
                                                                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                                                    <li class="nav-item
                            <%= isPageActive(currentPage, "Staff_Services_BirdCourse.jsp")%>
                            <%= isPageActive(currentPage, "Staff_updateCourse.jsp")%>
                            ">
                            <a class="nav-link" href="Staff_Services_BirdCourse.jsp">Bird Course</a>
                        </li>
                        <li class="nav-item <%= isPageActive(currentPage, "Staff_Services_Workshop.jsp")%>">
                            <a class="nav-link" href="Staff_Services_Workshop.jsp">Workshop</a>
                        </li>
                        <li class="nav-item <%= isPageActive(currentPage, "Staff_Services_OnlineCourse.jsp")%>">
                            <a class="nav-link" href="Staff_Services_OnlineCourse.jsp">Online Course</a>
                        </li>
                    </ul>
                </div>
            </div>-->
                        </div>
                    </section>
                    <div class="container-fluid" style="padding: 0 2.5%">
                        <div class="forms-container">
                            <div class="forms-header">
                                <div class="left-side"><b>Update Course</b></div>
                            </div>
                            <form action="UpdateCourse" method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="course_id" value="${course.courseID}">
                                <div class="form-customerDetails">
                                    <div class="form-body">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Course name</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id=""
                                                        value="${course.title}"
                                                        name="title"
                                                        required/>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Price</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id=""
                                                        value="${course.price}"
                                                        name="price"
                                                        required/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Duration</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id=""
                                                        value="${course.duration}"
                                                        name="duration"
                                                        required/>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Content</label>
                                                    <textarea id="introduction" name="content" class="form-control" value="" required>${course.content}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Avatar</label>
                                                    <input type="file" name="thumbnail" class="form-control"/><img src="data:images/jpg;base64,${course.image}" height="200px" width="300px" alt=""/>
                                                    <input type="hidden" name="img" value="${course.image}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="forms-footer">
                                        <button type="submit" name="action" value="cancel" class="btn btn-secondary decline" style="width: 30rem; margin: 1rem">Cancel</button>
                                        <button type="submit" name="action" value="update" class="btn approve" style="width: 30rem; margin: 1rem">Update this course</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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

                if (selectedCategory) {
                    var categoryValue = selectedCategory.nextElementSibling.querySelector('.category-name').innerText;
                    categoryInput.value = categoryValue;
                }
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    </body>
</html>




