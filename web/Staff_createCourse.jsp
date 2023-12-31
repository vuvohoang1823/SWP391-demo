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
        <title>Create Course</title>
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
                <jsp:useBean id="i" class="DAO.BirdDAO" scope="request"></jsp:useBean>

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
                            <%= isPageActive(currentPage, "Staff_createCourse.jsp")%>
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
                                <div class="left-side"><b>Create Course</b></div>
                            </div>
                            <form action="CreateCourse" method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="" value="">
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
                                                        value=""
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
                                                        name="price"
                                                        required/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Duration (Days)</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id=""
                                                        value=""
                                                        name="duration"
                                                        required/>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Bird Type</label>
                                                    <div>
                                                        <select style="width: 100%;height: 4rem;" name="type">
                                                            <c:forEach var="bird" items="${i.allBirdTypes}">
                                                                <option value="${bird.bird_id}">${bird.type}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Content</label>
                                                    <textarea id="introduction" name="content" class="form-control" required></textarea>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="mb-3">
                                                <label for="" class="form-label">
                                                    Thumbnail
                                                </label>
                                            </div>
                                            <div class="mb-3">
                                                <input type="file" id="thumbnail" name="thumbnail" class="form-control" accept="image/*" onchange="updateThumbnail(this)">

                                            </div>
                                            <div class="img-container d-flex justify-content-center">
                                                <img class="showImg" src="" alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="forms-footer">
                                        <button type="submit" name="action" value="checkout" class="btn approve">Create new course</button>
                                    </div>
                                </div>

                        </div>
                    </div>

                </div>

            </div>

        </form>
    </div>
</div>
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