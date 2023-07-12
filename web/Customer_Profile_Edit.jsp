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
                        <input type="file" id="customer_image" name="customer_image" class="form-control" accept="image/*" multiple required>
                        <!--<img src="data:images/jpg;base64,{customer.image}" alt="" width="100%" height="100%" />-->
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
                                id=""
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
                                id=""
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
                                id=""
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