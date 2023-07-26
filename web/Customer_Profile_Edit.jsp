<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <!-- bootstrap -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <!-- css -->
        <link rel="stylesheet" href="css/reset.css" />
        <link rel="stylesheet" href="css/Customer_Profile_View.css"/>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="profileHeading">
            <p>Account Information</p>
        </div>
        <c:set var="customer" value="${sessionScope.CUSTOMER_INFO}"/>

        <div class="body-container" style="position: relative">
            <a href="Customer_Profile_View.jsp">
                <div style="
                     z-index: 1;
                     position: absolute;
                     top: 8rem;
                     left: 8rem;
                     font-size: 2.5rem;
                     color: black;
                     ">
                    &lt; Cancel
                </div>
            </a>
            <form action="Customer_UpdateProfileServlet" method="POST" enctype="multipart/form-data">
                <div class="section-head">
                    <div class="image-container">
                        <input type="file" id="contentIMG" name="customer_image" class="form-control imgInput" accept="image/*" onchange="updateThumbnail(this)" required>
                        <div class="image-container">
                            <img class="showImg" src="data:images/jpg;base64,${customer.image}" alt="" width="100%" height="100%"
                                 />
                            <div class="changePfpIcon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-camera" viewBox="0 0 16 16">
                                <path d="M15 12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V6a1 1 0 0 1 1-1h1.172a3 3 0 0 0 2.12-.879l.83-.828A1 1 0 0 1 6.827 3h2.344a1 1 0 0 1 .707.293l.828.828A3 3 0 0 0 12.828 5H14a1 1 0 0 1 1 1v6zM2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2z"/>
                                <path d="M8 11a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5zm0 1a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7zM3 6.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/>
                                </svg>
                            </div>
                        </div>
                    </div>
                    <span>
                        ${customer.fullName}
                    </span>
                </div>
                <div class="form-container">
                    <div class="row" style="padding-top: 32rem;">
                        <p>
                            Edit Personal Information
                        </p>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <label for="" class="form-label">Full name</label>
                            <input
                                type="text"
                                class="form-control"
                                id="fullname"
                                name="fullName"
                                value="${customer.fullName}"
                                required
                                />
                        </div>
                        <div class="col-lg-6">
                            <label for="" class="form-label">Contact number</label>
                            <input
                                type="number"
                                class="form-control"
                                id="contact"
                                name="contact"
                                placeholder=""
                                value="${customer.contact}"
                                required
                                />
                        </div>
                    </div>
                    <div class="row">
                        <p>
                            Account Information
                        </p>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <label for="" class="form-label">Username</label>
                            <input
                                type="text"
                                class="form-control"
                                id="username"
                                name="username"
                                placeholder=""
                                value="${customer.username}"
                                readonly
                                />
                        </div>
                        <div class="col-lg-6">
                            <label for="" class="form-label">Password</label>
                            <div class="password-toggle">
                                <input id="password" class="form-control password" type="password" name="password" placeholder="Password" value="${customer.password}" required
                                       style="margin-top: 0;">
                                <i class="eye-icon fas fa-eye active"></i>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="userID" value="${sessionScope.LOGIN_USER.customer_id}" />
                    <!--                    <div class="row">
                                            <div class="col-lg-6">
                                                <label for="" class="form-label">Email</label>
                                                <input
                                                    type="text"
                                                    class="form-control"
                                                    id=""
                                                    placeholder="xxx@gmail.com"
                                                    value=""
                                                    disabled
                                                    />
                                            </div>
                                        </div>-->
                    <div class="forms-footer">
                        <div>
                            <button type="submit" name="action" value="approve" class="btn approve">Update</button>
                        </div>
                        <!--                        <div>
                                                    <button type="submit"  name="action" value="deny"class="btn decline">Cancel</button>
                                                </div>-->
                    </div>
                </div>
            </form>
        </div>
        <!--update image-->
        <script>
            function updateThumbnail(input) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    var showImg = input.parentNode.parentNode.querySelector('.image-container').querySelector('.showImg');
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
        <!--eye icon-->
        <script>
            const passwordInput = document.querySelector('.password');
            const eyeIcon = document.querySelector('.eye-icon');

            eyeIcon.addEventListener('click', togglePasswordVisibility);

            function togglePasswordVisibility() {
                if (passwordInput.type === 'password') {
                    passwordInput.type = 'text';
                    eyeIcon.classList.remove('active');
                } else {
                    passwordInput.type = 'password';
                    eyeIcon.classList.add('active');
                }
            }
        </script>
        <%@include file="footer.jsp" %>
    </body>
</html>