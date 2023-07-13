<%--
    Document   : EnterOtp0
    Created on : Jul 1, 2023, 12:07:25 AM
    Author     : hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify OTP</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/signIn.css" type="text/css">
        <style>
            .sendOTP-container{
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                margin-top: 2rem;
            }
            .sendOTP-container .title{
                margin-top: 2rem;
                font-size: 3rem;
                font-weight: 800;
                margin-bottom: 1rem;
            }
            .sendOTP-container .sub-title{
                font-size: 2rem;
                font-weight: 800;
                color: #FA5943;
                margin-bottom: 1rem;
            }
            .form-control{
                background-color: transparent;
                border-color: transparent;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }
            .input-form{
                width: 459.975px;
                display: flex;
                flex-direction: row;
            }
            .input-form .mail-redirect{
                border-radius: 0.5rem 0 0 0.5rem;
                height: 4.8rem;
                outline: none;
                border-top: 1px solid #D9D9D9;
                border-left: 1px solid #D9D9D9;
                border-bottom: 1px solid #D9D9D9;
                border-right: 0 none;
                margin-top: 2rem;
            }
            .sendOTP-container form .input-form a{
                display: inline-block;

            }
            .sendOTP-container .form-control .input-form input{
                height: 4.8rem;
                border-radius: 0 0.5rem 0.5rem 0;
                border: 1px solid #D9D9D9;
                background: #FFF;
                padding: 1.5rem 1.5rem;
                font-size: 1.5rem;
                font-weight: 400;
                outline: none;
                margin-top: 2rem;
                width: 100%;
            }
            /*            .form-control > button{
                            margin-top: 2rem;
                            outline: none;
                            border-color: transparent;
                            background-color: #1877F2;
                            padding: 1rem 4rem;
                            font-size: 2rem;
                            font-weight: 700;
                            color: white;
                            border-radius: 7px;
                            width: 34rem
                        }*/
            .btn-container{
                margin-top: 2rem;
                display: flex;
            }
            .btn-container button{
                outline: none;
                border-color: transparent;
            }
            .btn-container button:nth-child(2){
                background-color: #1877F2;
                color: white;
                font-size: 2rem;
                font-weight: 700;
                padding: 1rem 4rem;
                border-radius: 0.7rem;
                border: 1px solid #D9D9D9;
                margin-left: 1rem;
            }
            .btn-container button:nth-child(1){
                background-color: #e4e6eb;
                padding: 1rem 4rem;
                border-radius: 0.7rem;
                border: 1px solid #4b4f56;
                border-color: transparent;
                color: #4b4f56;
                font-size: 2rem;
                font-weight: 700;
            }
        </style>
    </head>
    <body class='snippet-body'>
        <%
            String previousPage = request.getHeader("Referer");
        %>
        <div class="container-fluid login-background">
            <img src="img/loginbg.jpg" alt="" class="login-bg" draggable="false">
            <div class="row login-box">
                <div class="col-lg-5 logo-side">
                    <div class="logo-container">
                        <svg width="102" height="60" viewBox="0 0 102 64" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path
                            d="M81.7791 0.000239911C81.5099 0.000239911 81.2183 0.0143231 80.9491 0.022773C80.2088 0.0593894 79.4461 0.141072 78.6609 0.272046C75.6548 0.779042 72.4917 2.01836 69.8445 4.20126C69.5753 4.89838 69.5977 5.51523 69.867 5.97011C70.3156 6.6785 71.37 7.34323 74.5555 7.66292L73.9274 10.1599C70.54 9.82751 68.0498 8.92055 66.7263 7.65306C65.4475 9.57683 64.4829 11.9062 64.0342 14.7087L63.9221 15.2721L63.2042 15.6101C36.3513 27.8202 14.8375 41.8049 0 55.0008C21.4105 52.0715 41.668 48.931 56.9004 43.9455C72.8955 38.6925 83.3271 31.6368 84.7628 20.4265C84.7628 19.2858 84.2917 18.5253 83.6636 17.9761C82.9008 17.3423 81.824 16.9621 80.635 16.8071C79.4461 16.6382 78.1674 16.7367 77.2251 16.9902C76.3054 17.2437 75.8118 17.5817 75.6324 18.0042L71.7289 17.3846C72.2449 16.0889 73.8377 15.1453 75.6099 14.6665C79.1544 13.7511 83.3271 14.2158 86.0191 15.8354C86.6697 14.4553 87.4997 13.0328 88.2624 11.6386C88.4643 11.2724 88.6662 10.9063 88.8457 10.5542C92.1659 8.51495 95.6431 7.29816 101.947 10.5683C102.642 6.73906 96.3834 2.99151 90.5282 3.77736C89.9674 2.43664 88.6662 1.46208 86.894 0.812841C85.4807 0.284721 83.7084 -0.00961834 81.7791 0.000239911ZM84.7852 2.42819C85.9069 2.42819 86.8043 2.99574 86.8043 3.69568C86.8043 4.39561 85.9069 4.96316 84.7852 4.96316C83.6636 4.96316 82.7662 4.39561 82.7662 3.69568C82.7662 2.99574 83.6636 2.42819 84.7852 2.42819ZM77.7187 37.2137C75.6772 38.6643 73.4114 40.0022 70.9213 41.2556C70.5175 44.4947 70.1361 47.8606 68.0274 51.142C69.1042 51.1984 70.1586 51.2265 71.0784 51.1843C72.1327 51.1279 72.9628 50.9871 73.4563 50.804C73.9723 50.6069 74.2415 50.4379 74.4434 50.0154C76.3727 45.8326 77.1578 41.5514 77.7187 37.2137ZM66.5244 43.2977C64.0791 44.3257 61.4992 45.2834 58.7624 46.1847C56.5414 46.9171 54.2308 47.5931 51.8528 48.255L53.468 52.1278C53.7148 52.7193 54.0289 52.8602 54.7916 53.0151C55.5319 53.17 56.7658 53.17 58.0669 53.001C59.3905 52.832 60.7589 52.494 61.7909 52.1419C62.8228 51.7899 63.4958 51.2829 63.3837 51.4237C65.4251 48.931 66.0757 46.1847 66.5244 43.2977ZM34.422 52.2264C26.3684 53.7615 17.8212 55.0994 9.03173 56.3528C8.09626 57.1837 7.36268 58.085 7.12713 58.6906C7.01047 59.0005 7.02618 59.1976 7.0531 59.268C9.95375 60.2679 14.0995 60.62 16.9911 60.5637C20.7151 60.4792 24.4615 59.9159 26.7273 59.2399C28.8585 58.6202 31.6627 56.0289 33.5022 53.5362C33.8387 53.0855 34.1304 52.6489 34.422 52.2264ZM72.9179 53.5784C72.4019 53.6348 71.9084 53.677 71.3924 53.7052C70.5624 53.7474 69.7099 53.7474 68.8574 53.7193L69.867 61.465H59.4129L60.1084 55.2966C59.7046 55.367 59.3008 55.4233 58.897 55.4797C57.9548 55.6064 56.9901 55.6768 56.003 55.6768L55.3749 61.465H47.9943L44.8536 64H90.932L87.3427 61.465H73.9274L72.9179 53.5784Z"
                            fill="white" />
                        </svg>
                        <p>BIRD<br /> TRAINING<br /> CENTER</p>
                    </div>
                    <img src="img/img-logo.jpg" style="filter: brightness(70%);" alt="" draggable="false">
                </div>
                <div class="col-lg-7 auth-side" style="padding-left: 3rem;">
                    <div class="close-btn d-flex" style="visibility: hidden">
                        <div class="d-flex align-items-center" style="padding: 0.5rem 1rem; user-select: none">Back to home</div>
                        <a href="homepage.jsp" style="height: 100%; background: #617a55; padding: 0.5rem;">
                            <svg width="15" height="17" viewBox="0 0 22 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M7.26332 19.221C7.79569 19.221 8.14725 18.8594 8.14725 18.3371C8.14725 18.0759 8.06689 17.8851 7.90617 17.7243L5.01332 14.9018L3.10485 13.2746L5.46533 13.375H18.2823C20.6227 13.375 21.5971 12.3003 21.5971 10.0302V4.0938C21.5971 1.75337 20.6227 0.779053 18.2823 0.779053H12.6573C12.1048 0.779053 11.7432 1.18084 11.7432 1.67301C11.7432 2.16522 12.1048 2.56697 12.6573 2.56697H18.2823C19.347 2.56697 19.8091 3.02905 19.8091 4.0938V10.0302C19.8091 11.125 19.347 11.5871 18.2823 11.5871H5.46533L3.10485 11.6875L5.01332 10.0603L7.90617 7.23775C8.06689 7.07704 8.14725 6.87612 8.14725 6.615C8.14725 6.10268 7.79569 5.73107 7.26332 5.73107C7.04235 5.73107 6.78117 5.84155 6.61043 6.0123L0.704161 11.8081C0.503289 11.9989 0.402832 12.2299 0.402832 12.4811C0.402832 12.7221 0.503289 12.9632 0.704161 13.1541L6.61043 18.9498C6.78117 19.1206 7.04235 19.221 7.26332 19.221Z"
                                fill="white" />
                            </svg>
                        </a>
                    </div>
                    <div class="sendOTP-container">
                        <svg width="68" height="76" viewBox="0 0 31 39" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M20.5627 37H10.2521C5.6184 36.9193 1.92513 33.0025 2.00115 28.25V19.5C1.9589 15.5658 4.49495 12.0914 8.18753 11.025V9.875C8.06445 5.6569 11.295 2.13325 15.4075 2C19.5197 2.13325 22.7502 5.6569 22.6272 9.875V11.025C26.3197 12.0914 28.856 15.5658 28.8137 19.5V28.25C28.8897 33.0025 25.1965 36.9193 20.5627 37Z"
                              stroke="black" stroke-width="3.75" stroke-linecap="round" stroke-linejoin="round" />
                        <path
                            d="M13.5324 28.25C13.5324 29.2855 14.3719 30.125 15.4074 30.125C16.4429 30.125 17.2824 29.2855 17.2824 28.25H13.5324ZM17.2824 23.875C17.2824 22.8395 16.4429 22 15.4074 22C14.3719 22 13.5324 22.8395 13.5324 23.875H17.2824ZM22.1347 12.8341C23.1337 13.1062 24.1642 12.5168 24.4364 11.5176C24.7084 10.5185 24.1189 9.48795 23.1199 9.21588L22.1347 12.8341ZM7.69727 9.21588C6.69812 9.48795 6.10872 10.5185 6.3808 11.5176C6.65287 12.5168 7.68342 13.1062 8.68257 12.8341L7.69727 9.21588ZM17.2824 28.25V23.875H13.5324V28.25H17.2824ZM23.1199 9.21588C22.2862 8.98885 21.4267 8.87418 20.5634 8.875L20.5652 12.625C21.0939 12.6245 21.6227 12.6947 22.1347 12.8341L23.1199 9.21588ZM20.5634 8.875H10.252L10.2503 12.625H20.5652L20.5634 8.875ZM10.252 8.875C9.38865 8.87418 8.53092 8.98885 7.69727 9.21588L8.68257 12.8341C9.1945 12.6947 9.72145 12.6245 10.2503 12.625L10.252 8.875Z"
                            fill="black" />
                        </svg>
                        <p class="title">Enter OTP</p>
                        <P class="sub-title">An OTP code was sent to your email</P>
                        <form action="ValidateOtpRegitser" class="form-control" role="form" autocomplete="off" method="post" style="position: relative">
                            <c:if test="${requestScope.errormessage != null}">
                                <p class="text-danger" style="
                                   position: absolute;
                                   top: 0;
                                   right: 50px;
                                   font-size: 2rem;
                                   transform: translateY(-20px);
                                   text-transform: capitalize;
                                   ">${requestScope.errormessage}</p>
                            </c:if>
                            <input type="hidden" name="fullname" value="${sessionScope.fullname_params}">
                            <input type="hidden" name="email" value="${sessionScope.email_params}">
                            <input type="hidden" name="contact" value="${sessionScope.contact_params}">
                            <input type="hidden" name="username" value="${sessionScope.username_paramas}">
                            <input type="hidden" name="password" value="${sessionScope.password_params}">
                            <div class="input-form">
                                <button class="mail-redirect">
                                    <a class="m-0" href="https://mail.google.com/mail/u/0/#inbox">
                                        <svg width="31" height="21" viewBox="0 0 51 41" fill="none"
                                             xmlns="http://www.w3.org/2000/svg">
                                        <path d="M5.93872 7.58984L25.9387 22.3398L45.9387 7.58984" stroke="black"
                                              stroke-width="5" stroke-linecap="round" stroke-linejoin="round" />
                                        <path
                                            d="M43.4387 3.33984H8.43872C5.6773 3.33984 3.43872 5.57842 3.43872 8.33984V33.3398C3.43872 36.1013 5.6773 38.3398 8.43872 38.3398H43.4387C46.2001 38.3398 48.4387 36.1013 48.4387 33.3398V8.33984C48.4387 5.57842 46.2001 3.33984 43.4387 3.33984Z"
                                            stroke="black" stroke-width="5" stroke-linecap="round"
                                            stroke-linejoin="round" />
                                        </svg>
                                    </a>
                                </button>
                                <input type="text" name="otp" placeholder="Enter OTP" required />
                            </div>
                            <input type="hidden" class="hide" name="token" id="token" value="">
                            <div class="btn-container">
                                <a class="m-0" href="<%= previousPage%>">
                                    <button type="button">Back</button>
                                </a>
                                <button name="recover-submit" value="Create Account" type="submit">Create Account</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
    </body>
</html>