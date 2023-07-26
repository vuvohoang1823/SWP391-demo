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
        <div class="body-container">
            <div class="section-head">
                <div class="image-container">
                    <img src="data:images/jpg;base64,${customer.image}" alt="" width="100%" height="100%" />
                </div>
                <span>
                    ${customer.fullName}
                </span>
            </div>
            <div class="form-container">
                <form action="Customer_Profile_Edit.jsp?fullName=${custmer.fullName} method="POST" enctype="multipart/form-data">

                      <div class="row" style="padding-top: 32rem;">
                        <p>
                            Personal Information
                        </p>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <label for="" class="form-label">Full name</label>
                            <input
                                type="text"
                                class="form-control"
                                id=""
                                value="${customer.fullName}"
                                disabled
                                />
                            <input type="hidden" name="fullName" value="${customer.fullName}" />
                        </div>
                        <div class="col-lg-6">
                            <label for="" class="form-label">Contact number</label>
                            <input
                                type="number"
                                class="form-control"
                                id=""
                                placeholder=""
                                value="${customer.contact}"
                                disabled
                                />
                            <input type="hidden" name="contact" value="${customer.contact}" />
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
                                placeholder=""
                                value="${customer.username}"

                                disabled
                                />
                            <input type="hidden" name="username" value="${customer.username}" />
                        </div>
                        <div class="col-lg-6">
                            <label for="" class="form-label">Password</label>
                            <input
                                type="password"
                                class="form-control"
                                id=""
                                placeholder=""
                                value="${customer.password}"
                                disabled
                                />
                            <input type="hidden" name="password" value="${customer.password}" />
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
                            <button type="submit" name="action" value="approve" class="btn approve">Edit</button>
                        </div>
                        <!--                        <div>
                                                    <button type="submit"  name="action" value="deny"class="btn decline">Cancel</button>
                                                </div>-->
                    </div>
                </form>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>