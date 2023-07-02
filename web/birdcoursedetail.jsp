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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/birdcourseDetail.css" type="text/css">
    <title>JSP Page</title>
</head><body>
    <%@ include file="header.jsp" %>
<section class="section-head">
    <p>
        COURSE INFORMATION
    </p>
    <p>
        Decoy Bird - Call the Herd
    </p>
</section>
<section class="section-body" style="background-color: #DDE6F1">
    <div class="col-xl-5">
        <div class="body-content-left">
            <img src="img/Untitled (1).png">
            <p style="color: #617a55">
                £90.00
            </p>
            <p>
                Decoy bird - call the herd
            </p>
            <p style="color: #617a55">
                <i>Chim Chao Mao</i>
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
                        3 week
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
                <a href="detail">
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
            <!--                <div class="title">-->
            <!--                    <hr>-->
            <!--                    <p>-->
            <!--                        About Course-->
            <!--                    </p>-->
            <!--                    <hr>-->
            <!--                </div>-->
            <div class="line-container">
                <hr class="line">
                <span class="line-text">About Course</span>
            </div>
            <div class="text-detail">
                Our course will apply extensive knowledge and long experience of crested birds, including how to recognize and care for crested birds, how to train birds to sing and imitators of other sounds, as well as as techniques and strategies for training crested birds to sing and call out to the flock
            </div>
        </div>
        <div class="third-content">
            <div class="line-container">
                <hr class="line">
                <span class="line-text">Duration</span>
            </div>
            <div class="text-detail">
                This course will takes some times from 1 month - 3 months
                based on their birds and some related features.
            </div>
        </div>
    </div>
    <hr>
</section>
<section class="section-footer" style="background-color: #DDE6F1">
    <p style="font-size: 3rem; font-weight: bolder;text-align: center;padding-bottom: 3rem">
        MODULES FOR THIS COURSE
    </p>
    <div class="module-container">
        <div class="content-left">
            <p style="font-weight: bolder; font-size: 3rem">
                Module 1
            </p>
        </div>
        <div class="content-right">
            <p style="font-weight: bolder; font-size: 3rem;color: #617a55">
                Getting used to the training mode for the first time
            </p>
            <p style="font-size: 2rem">
                In this foundational module, we guide you through the exciting transition into the world of bird training. Whether you're a new bird owner or embarking on training for the first time, this module provides essential insights and techniques to help you and your feathered companion embrace the training journey.
            </p>
            <hr>
        </div>
    </div>
    <div class="module-container">
        <div class="content-left">
            <p style="font-weight: bolder; font-size: 3rem">
                Module 2
            </p>
        </div>
        <div class="content-right">
            <p style="font-weight: bolder; font-size: 3rem;color: #617a55">
                Practice flying techniques
            </p>
            <p style="font-size: 2rem">
                In this foundational module, we guide you through the exciting transition into the world of bird training. Whether you're a new bird owner or embarking on training for the first time, this module provides essential insights and techniques to help you and your feathered companion embrace the training journey.
            </p>
            <hr>
        </div>
    </div>
    <div class="module-container">
        <div class="content-left">
            <p style="font-weight: bolder; font-size: 3rem">
                Module 3
            </p>
        </div>
        <div class="content-right">
            <p style="font-weight: bolder; font-size: 3rem;color: #617a55">
                Outdoor Access
            </p>
            <p style="font-size: 2rem">
                In this foundational module, we guide you through the exciting transition into the world of bird training. Whether you're a new bird owner or embarking on training for the first time, this module provides essential insights and techniques to help you and your feathered companion embrace the training journey.
            </p>
            <hr>
        </div>
    </div>
    <div class="module-container">
        <div class="content-left">
            <p style="font-weight: bolder; font-size: 3rem">
                Module 4
            </p>
        </div>
        <div class="content-right">
            <p style="font-weight: bolder; font-size: 3rem;color: #617a55">
                Strengthen the connection
            </p>
            <p style="font-size: 2rem">
                In this foundational module, we guide you through the exciting transition into the world of bird training. Whether you're a new bird owner or embarking on training for the first time, this module provides essential insights and techniques to help you and your feathered companion embrace the training journey.
            </p>
            <hr>
        </div>
    </div>
    <div class="module-container">
        <div class="content-left">
            <p style="font-weight: bolder; font-size: 3rem">
                Module 5
            </p>
        </div>
        <div class="content-right">
            <p style="font-weight: bolder; font-size: 3rem;color: #617a55">
                Check for safe behavior before you let go
            </p>
            <p style="font-size: 2rem">
                In this foundational module, we guide you through the exciting transition into the world of bird training. Whether you're a new bird owner or embarking on training for the first time, this module provides essential insights and techniques to help you and your feathered companion embrace the training journey.
            </p>
            <hr>
        </div>
    </div>
</section>
<p style="font-size: 3rem;font-weight: bolder;padding:5rem 5rem;background-color: white">
    FORM SUBMISSION
<hr style="margin: 0">
</p>

<section class="form-container" style="background-color: white">
    <div class="col-xl-6">
        <p style="font-size: 4rem;font-weight: bolder;margin-top: 4rem;margin-bottom: 4rem">
            Bird Details
        </p>
        <div class="form-input">
            <p>
                *Bird’s name
            </p>
            <input type="text">
        </div>
        <div class="form-input">
            <p>
                *Bird type
            </p>
            <input type="text">
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
            Payment method
        </p>
        <div class="radio-content">
            <input type="radio" style="width: 2rem;margin-bottom: 3rem;margin-right: 2rem">
            <p style="font-size: 2rem;margin-bottom: 3rem">
                Payment at <b>Bird Training Center</b>
            </p>
        </div>
        <button>
            <a>
                Submit Form
            </a>
        </button>
    </div>
    <div class="col-xl-5">
        <p style="font-size: 4rem;font-weight: bolder;margin-bottom: 4rem">
            Payment Details
        </p>
        <div class="payment-detail">
            <div class="detail-content">
                <div class="col-xl">
                    <img src="img/Untitled (1).png">
                </div>
                <div class="col-xl detail">
                    <p>
                        Decoy - Call the Herd
                    </p>
                    <p>
                        £120.00
                    </p>
                </div>
                <hr>
            </div>
            <div class="price-content">
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
                        £120.00
                    </p>
                    <p>
                        £12.00
                    </p>
                </div>
            </div>
            <hr style="margin-bottom: 5rem">
            <div class="total">
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
            </div>
        </div>
    </div>
</section>
<%@ include file="footer.jsp" %>
<script>
    const fileInput = document.getElementById('myfile');
    const previewImage = document.getElementById('preview-image');

    fileInput.addEventListener('change', function(event) {
        const file = event.target.files[0];
        const reader = new FileReader();

        reader.onload = function(e) {
            previewImage.src = e.target.result;
            previewImage.style.opacity=100;
            document.getElementById('choose-image').style.opacity=0;
        };

        if (file) {
            reader.readAsDataURL(file);
        }
    });
</script>
</body>
</html>
