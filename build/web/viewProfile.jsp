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
        <link rel="stylesheet" href="css/viewProfile.css"/>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="heading">
            Account Information
        </div>
        <div class="body-container">
            <div class="section-head">
                <div class="image-container">
                    <img src="img/Ellipse 22.png" alt="" width="100%" height="100%" />
                </div>
                <span>
                    Hoang Kim Nam
                </span>
            </div>
            <div class="form-container">
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
                            placeholder="Hoang Kim Nam"
                            value=""
                            disabled
                            />
                    </div>
                    <div class="col-lg-6">
                        <label for="" class="form-label">Contact number</label>
                        <input
                            type="number"
                            class="form-control"
                            id=""
                            placeholder="0123456789"
                            value=""
                            disabled
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
                            placeholder="hoangkimnam"
                            value=""
                            disabled
                            />
                    </div>
                    <div class="col-lg-6">
                        <label for="" class="form-label">Password</label>
                        <input
                            type="text"
                            class="form-control"
                            id=""
                            placeholder="hoangkimnam"
                            value=""
                            disabled
                            />
                    </div>
                </div>
                <div class="row">
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
                </div>
                <div class="forms-footer">
                    <div> 
                        <button type="submit" name="action" value="approve" class="btn approve">Update</button>
                    </div>
                    <div>
                        <button type="submit"  name="action" value="deny"class="btn decline">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>