<%--
    Document   : newPassword
    Created on : Jul 1, 2023, 12:08:13 AM
    Author     : hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Reset password</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/signIn.css" type="text/css">
        <style>
            .resetPass-container{
                margin-top: 1rem;
            }
            .resetPass-container .form-control{
                padding: 0;
                margin-top: 2rem;
                border-color: transparent;
                background: transparent;
                display: flex;
                flex-direction: column;
            }
            .resetPass-container .title{
                font-size: 3rem;
                font-weight: 800;
                margin-bottom: 1rem;
            }
            .resetPass-container .sub-title{
                font-size: 2rem;
                font-weight: 800;

            }
            .form-control .password, .confirm{
                width: 39rem !important;
                height: 5rem;
                font-size: 1.5rem;
                font-weight: 400;
                padding-left: 1.4rem;
                border-radius: 0.5rem;
                border: 2px solid #D9D9D9;
                background: #FFF;
                margin-top: 1.5rem;
                margin-top: 0;
            }
            label{
                font-weight: 700;
                font-size: 1rem;
                margin-left: 1rem;
            }
            .form-control .label-password, .label-confirm{
                margin-top: 1rem;
            }
            .password-toggle{
                position: relative;
            }
            .password-toggle i{
                position: absolute;
                margin-top: 1.8rem;
                right: 9rem
            }
            /* Eye icon styles */
            .eye-icon:before {
                content: "\f06e";
                /* Eye-slash icon Unicode value */
                font-family: "Font Awesome 5 Free";
                font-weight: 900;
                font-size: 1.5rem;
            }

            .eye-icon.active:before {
                content: "\f070";
                /* Eye icon Unicode value */
            }
            .reset-btn{
                margin-top: 2rem;
                width: 39rem;
                height: 4.6rem;
                border-color: transparent;
                outline: none;
                border-radius: 7px;
                border: 1px solid #D9D9D9;
                background: #1877F2;
                color:white;
                font-size: 2rem;
                font-weight: 700;
                margin-left: 0rem;
            }
        </style>
    </head>
    <body class='snippet-body'>
        <div class="container-fluid login-background">
            <img src="img/loginbg.jpg" alt="" class="login-bg" draggable="false">
            <div class="row login-box">
                <div class="col-lg-6 logo-side">
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
                <div class="col-lg-6 auth-side">
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
                    <div class="resetPass-container">
                        <p class="title">Reset Password</p>
                        <p class="sub-title">This will help you secure your password</p>
                        <form class="form-control" action="newPassword" method="POST" style="position: relative">
                            <label class="label-password" for="">Password</label>
                            <div class="password-toggle">
                                <input id="password" class="password" name="password" type="password" placeholder="Password" required>
                                <i class="eye-icon fas fa-eye active"></i>
                            </div>
                            <label class="label-confirm" for="">Confirm</label>
                            <input class="confirm" name="confPassword" type="password" placeholder="Confirm password" required>
                            <c:if test="${requestScope.message != null}">
                                <p class="text-danger" style="
                                   position: absolute;
                                   bottom: 0;
                                   left: 0px;
                                   font-size: 2rem;
                                   transform: translateY(60px);
                                   ">${requestScope.message}</p>
                            </c:if>
                            <button class="reset-btn" value="changePassword">Reset my password</button>
                        </form>
                    </div>
                </div>
            </div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
    </body>
</html>
