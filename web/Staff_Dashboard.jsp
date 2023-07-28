<%--
    Document   : ConsultationForm
    Created on : Jun 15, 2023, 2:21:36 AM
    Author     : thang
--%>
<%@page import="DAO.DashBoard_v2_DAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<%
    List<Integer> revenueData = (List<Integer>) request.getAttribute("DASHBOARD");
    int month = (int) request.getAttribute("MONTH");

    Gson gsonObj = new Gson();
    List<Map<Object, Object>> list = new ArrayList<>();

    for (int i = 0; i < revenueData.size(); i++) {
        Map<Object, Object> map = new HashMap<>();
        map.put("label", "Month " + (month++));
        map.put("y", revenueData.get(i));
        list.add(map);
    }

    String dataPoints = gsonObj.toJson(list);

    DashBoard_v2_DAO dashboardDAO = new DashBoard_v2_DAO();
    String totalBirdCourse = dashboardDAO.getNumberOfBirdCourse();
    String totalWorkshop = dashboardDAO.getNumberOfWorkshop();
    String totalOnline = dashboardDAO.getNumberOfOnline();
    String customerBirdCourse = dashboardDAO.getCustomerOfBirdCourse();
    String customerWorkshop = dashboardDAO.getCustomerOfWorkshop();
    String customerOnline = dashboardDAO.getCustomerOfOnline();
    String customerAppointment = dashboardDAO.getCustomerOfAppointment();

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <!-- w3Table -->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
        <!-- css -->
        <link rel="stylesheet" href="css/reset.css" />
        <link rel="stylesheet" href="css/Staff_Dashboard.css" />
    </head>
    <body>
        <div class="container-fluid">
            <div class="row flex-nowrap">
                <!--            header-->
                <%@ include file="header.jsp" %>
                <div id="containerPage" class="col-md-8 col-lg-10 min-vh-100 p-0" style="flex-grow: 1; width: unset">
                    <section class="form-head">
                        <div class="heading d-flex align-items-center">
                            <svg width="40" height="40" viewBox="0 0 21 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M7 19V7" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M20 7H1" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M1 6.976C1 2.05476 2.11336 1 7.308 1H13.692C18.8866 1 20 2.05476 20 6.976V13.024C20 17.9452 18.8866 19 13.692 19H7.308C2.11336 19 1 17.9452 1 13.024V6.976Z" stroke="black" stroke-width="2"/>
                            </svg>
                            <span style="padding-left: 2rem">Dashboard</span>
                        </div>
                    </section>
                    <section class="form-body">
                        <div class="title-head">
                            Revenue for this month
                        </div>
                        <div class="section-head">
                            <div class="box">
                                <span style="font-size: 2rem;">
                                    Bird course
                                </span>
                                <span style="font-size: 4rem;font-weight: bolder">
                                    $${DASHBOARD6.birdCourse}
                                </span>
                            </div>
                            <div class="box">
                                <span style="font-size: 2rem;">
                                    Online course
                                </span>
                                <span style="font-size: 4rem;font-weight: bolder">
                                    $${DASHBOARD6.onlineCourse}
                                </span>
                            </div>
                            <div class="box">
                                <span style="font-size: 2rem;">
                                    Private Consultation
                                </span>
                                <span style="font-size: 4rem;font-weight: bolder">
                                    $${DASHBOARD6.consultation}
                                </span>
                            </div>
                            <div class="box">
                                <span style="font-size: 2rem;">
                                    Workshop
                                </span>
                                <span style="font-size: 4rem;font-weight: bolder">
                                    $${DASHBOARD6.workshop}
                                </span>
                            </div>
                            <div class="box">
                                <span style="font-size: 2rem;">
                                    Total
                                </span>
                                <span style="font-size: 4rem;font-weight: bolder">
                                    $${DASHBOARD6.total}
                                </span>
                                <span>
                            </div>
                        </div>
                        <div style="height: 480px;overflow-y: hidden;margin-left: 3rem; border-radius: 10px">
                            <div id="chartContainer" style="height: 492px; width: 98%;background: #617255; border-radius: 20px;"></div>
                        </div>
                        <div class="title-head">
                            Service overall
                        </div>
                        <div class="accordion accordion-flush" id="accordionFlushExample" style="width: 95%; margin: auto; border-radius: 10px; overflow: hidden">
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                        <div class="accordion-body">
                                            <div class="content">
                                                <div class="logo-container">
                                                    <div class="logo">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="38" height="38" viewBox="0 0 38 38"
                                                             fill="none">
                                                        <g clip-path="url(#clip0_2503_289)">
                                                        <path
                                                            d="M36.4761 9.81275L37.1716 8.88533L35.3168 7.4942L34.6212 8.42162C33.8387 9.46497 32.9113 10.3634 31.8679 11.088L31.3752 12.0733C31.3752 12.3632 31.4042 12.653 31.4042 12.9428C31.4042 20.7389 25.5789 31.6941 12.653 31.6941C11.6676 31.6941 10.6822 31.6071 9.72581 31.4622L8.56653 31.2883L8.21875 33.5779L9.37802 33.7518C10.4504 33.9257 11.5806 34.0126 12.682 34.0126C20.623 34.0126 25.5789 30.2739 28.3322 27.1439C31.781 23.2313 33.7518 18.0726 33.7518 12.9428C33.7518 12.8269 33.7518 12.7109 33.7518 12.595C34.7661 11.8125 35.6646 10.8561 36.4761 9.81275Z"
                                                            fill="white" />
                                                        <path
                                                            d="M3.58146 30.9695C7.0303 30.9695 10.2763 29.8392 13.0006 27.7235L13.899 26.999L12.4789 25.1731L11.5805 25.8977C9.29089 27.6946 6.53761 28.651 3.61045 28.651C3.08877 28.651 2.59608 28.622 2.07441 28.564L0.915134 28.4191L0.654297 30.7087L1.81357 30.8536C2.39321 30.9405 3.00183 30.9695 3.58146 30.9695Z"
                                                            fill="white" />
                                                        <path
                                                            d="M7.05891 23.782C7.78345 23.782 8.508 23.6951 9.20357 23.4922L10.3339 23.2024L9.72524 20.9708L8.59495 21.2606C7.75447 21.4924 6.82705 21.5214 5.9576 21.3475L4.82731 21.1157L4.39258 23.4052L5.52287 23.6371C6.04454 23.753 6.56622 23.782 7.05891 23.782Z"
                                                            fill="white" />
                                                        <path
                                                            d="M7.5809 17.7828L7.66784 15.4642L6.50857 15.4352C5.58115 15.4063 4.68271 15.1454 3.87122 14.7107L2.85685 14.16L1.72656 16.1888L2.74093 16.7394C3.87122 17.377 5.14642 17.7248 6.45061 17.7538L7.5809 17.7828Z"
                                                            fill="white" />
                                                        <path
                                                            d="M19.8694 13.4645C19.7824 13.0297 19.7245 12.595 19.7245 12.1313C19.7245 8.91432 22.3328 6.27697 25.5788 6.27697C27.2018 6.27697 28.7378 6.94355 29.8391 8.13181L30.9114 8.47959C32.2736 8.21875 33.6068 7.75504 34.853 7.11744L35.8963 6.59577L34.853 4.53806L33.8096 5.05973C32.9402 5.49446 32.0128 5.84224 31.0564 6.0741C29.5783 4.74093 27.6075 3.95842 25.5788 3.95842C21.0866 3.95842 17.4059 7.61013 17.4059 12.1313C17.4059 12.2472 17.4059 12.3342 17.4059 12.4501C12.6529 11.8415 8.24764 9.43599 5.20454 5.69733L3.29174 5.84224C2.56719 7.05948 2.19043 8.47959 2.19043 9.92868V11.088H4.50898V9.92868C4.50898 9.46497 4.56694 9.00126 4.68287 8.56653C8.36356 12.3342 13.3774 14.6237 18.6811 14.8846L19.8694 13.4645Z"
                                                            fill="white" />
                                                        </g>
                                                        <defs>
                                                        <clipPath id="clip0_2503_289">
                                                            <rect width="37.0968" height="37.0968" fill="white"
                                                                  transform="translate(0.451172 0.451614)" />
                                                        </clipPath>
                                                        </defs>
                                                        </svg>
                                                    </div>
                                                    <div class="title">
                                                        <span>
                                                            <b>Bird Course</b>
                                                        </span>
                                                    </div>
                                                </div>
                                                <jsp:useBean id="dashboard" class="DAO.DashBoard_v2_DAO" ></jsp:useBean>

                                                    <div class="stat_content" style="margin-left: 30rem">
                                                        <span>
                                                            Total Bird Courses
                                                        </span>
                                                        <div class="stat_number">
                                                            <span>
                                                            <%= totalBirdCourse%>
                                                        </span>
                                                        <span class="unit" style="display: flex;align-items: center;padding-left: 1rem;">
                                                            courses
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="stat_content" style="margin-left: 30rem">
                                                    <span>
                                                        Total Enrolled Customers
                                                    </span>
                                                    <div class="stat_number">
                                                        <span>
                                                            <%= customerBirdCourse%>

                                                        </span>
                                                        <span class="unit" style="display: flex;align-items: center;padding-left: 1rem;">
                                                            customers
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </button>
                                </h2>
                                <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                    <span class="heading">
                                        <b>
                                            Top 3 bird courses of last month
                                        </b>
                                    </span>


                                    <div class="card-container">
                                        <c:forEach var="birdcourse" items="${dashboard.getDetailTop3BirdCourse()}">
                                            <div class="card-item">
                                                <img src="data:images/jpg;base64,${birdcourse.course_img}"/>
                                                <div class="text">
                                                    <div class="title">
                                                        Bird Course Name
                                                    </div>
                                                    <div class="content">
                                                        ${birdcourse.title}
                                                    </div>
                                                    <div class="title">
                                                        Enrolled Customers
                                                    </div>
                                                    <div class="content">
                                                        ${birdcourse.participant_count}
                                                    </div>
                                                </div>
                                            </div>

                                        </c:forEach>
                                    </div>

                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                                        <div class="accordion-body">
                                            <div class="content">
                                                <div class="logo-container">
                                                    <div class="logo" style="background-color: #EF7B6B;">
                                                        <svg style="background-color: #EF7B6B;" xmlns="http://www.w3.org/2000/svg"
                                                             width="44" height="44" viewBox="0 0 44 44" fill="none">
                                                        <path
                                                            d="M34.8804 23.2558V28.6517C34.8813 28.898 34.8335 29.1421 34.7399 29.3699C34.6463 29.5977 34.5086 29.8048 34.3347 29.9793C34.1609 30.1537 33.9543 30.2922 33.7268 30.3866C33.4994 30.4811 33.2555 30.5297 33.0092 30.5297H8.45196C7.94115 30.5298 7.45096 30.3283 7.08786 29.969C6.72476 29.6097 6.51807 29.1217 6.5127 28.6109V12.2802C6.51269 12.1188 6.5446 11.959 6.60657 11.81C6.66855 11.6609 6.75938 11.5256 6.87383 11.4118C6.98829 11.2979 7.12411 11.2079 7.2735 11.1467C7.42288 11.0856 7.58288 11.0545 7.7443 11.0554H20.0263"
                                                            stroke="white" stroke-width="2.8125" />
                                                        <path
                                                            d="M35.1939 34.6464H6.67648C6.30808 34.6473 5.94313 34.5754 5.6026 34.4349C5.26206 34.2943 4.95266 34.0878 4.69216 33.8273C4.43166 33.5668 4.22519 33.2574 4.08463 32.9169C3.94406 32.5764 3.87216 32.2114 3.87306 31.843V30.5297H37.6503V32.1628C37.6503 32.8168 37.3924 33.4444 36.9325 33.9094C36.4726 34.3744 35.8478 34.6393 35.1939 34.6464Z"
                                                            stroke="white" stroke-width="2.8125" />
                                                        <path
                                                            d="M21.7552 8.96647H38.671C39.0572 8.96647 39.4276 9.11989 39.7006 9.39297C39.9737 9.66605 40.1271 10.0364 40.1271 10.4226V21.5751C40.1271 21.9613 39.9737 22.3317 39.7006 22.6047C39.4276 22.8778 39.0572 23.0312 38.671 23.0312H21.1632C20.777 23.0312 20.4066 22.8778 20.1335 22.6047C19.8604 22.3317 19.707 21.9613 19.707 21.5751V11.0078C19.707 10.7392 19.7601 10.4732 19.8631 10.225C19.9661 9.97693 20.1171 9.7516 20.3073 9.56195C20.4976 9.37231 20.7234 9.22209 20.9719 9.1199C21.2203 9.01772 21.4865 8.96558 21.7552 8.96647Z"
                                                            stroke="white" stroke-width="2.8125" />
                                                        <path d="M19.707 14.5665H40.1271" stroke="white" stroke-width="2.8125" />
                                                        <path
                                                            d="M36.221 17.5673C35.8711 17.5697 35.5317 17.6868 35.2548 17.9007C34.9755 17.6863 34.6338 17.5692 34.2817 17.5673C33.8612 17.5673 33.458 17.7343 33.1607 18.0316C32.8633 18.329 32.6963 18.7322 32.6963 19.1527C32.6963 19.5732 32.8633 19.9765 33.1607 20.2738C33.458 20.5711 33.8612 20.7381 34.2817 20.7381C34.6338 20.7362 34.9755 20.6191 35.2548 20.4047C35.4543 20.5597 35.6879 20.6648 35.9362 20.7112C36.1845 20.7576 36.4404 20.7439 36.6824 20.6714C36.9244 20.5989 37.1455 20.4697 37.3274 20.2944C37.5094 20.1191 37.6468 19.9029 37.7282 19.6638C37.8096 19.4246 37.8327 19.1695 37.7956 18.9196C37.7585 18.6697 37.6621 18.4323 37.5147 18.2272C37.3672 18.0221 37.1729 17.8552 36.9478 17.7404C36.7228 17.6256 36.4736 17.5663 36.221 17.5673Z"
                                                            stroke="white" />

                                                        </svg>
                                                    </div>
                                                    <div class="title" style="color: #EF7B6B;">
                                                        <span>
                                                            <b>Online Course</b>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="stat_content" style="margin-left: 26.5rem">
                                                    <span>
                                                        Total Online Courses
                                                    </span>
                                                    <div class="stat_number">
                                                        <span>
                                                            <%= totalOnline%>
                                                        </span>
                                                        <span class="unit" style="display: flex;align-items: center;padding-left: 1rem;">
                                                            courses
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="stat_content" style="margin-left: 28.5rem">
                                                    <span>
                                                        Total Enrolled Customers
                                                    </span>
                                                    <div class="stat_number">
                                                        <span>
                                                            <%= customerOnline%>
                                                        </span>
                                                        <span class="unit" style="display: flex;align-items: center;padding-left: 1rem;">
                                                            customers
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </button>
                                </h2>

                                <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                    <span class="heading">
                                        <b>
                                            Top 3 online courses of last month
                                        </b>
                                    </span>

                                    <div class="card-container" style="display: flex">
                                        <c:forEach var="online" items="${dashboard.getDetailTop3Online()}">
                                            <div class="card-item">
                                                <img src="data:images/jpg;base64,${online.course_img}"/>
                                                <div class="text">
                                                    <div class="title">
                                                        Online Course Name
                                                    </div>
                                                    <div class="content">
                                                        ${online.title}
                                                    </div>
                                                    <div class="title">
                                                        Enrolled Customers
                                                    </div>
                                                    <div class="content">
                                                        ${online.participant_count}
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>

                                    </div>

                                </div>

                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                                        <div class="accordion-body">
                                            <div class="content">
                                                <div class="logo-container">
                                                    <div class="logo" style="background:#F69C14;">
                                                        <svg style="background:#F69C14;" xmlns="http://www.w3.org/2000/svg" width="35"
                                                             height="35" viewBox="0 0 35 35" fill="none">
                                                        <g clip-path="url(#clip0_2503_230)">
                                                        <path
                                                            d="M34.7417 24.6277H28.9622V21.7379H31.852V4.39918H5.84389V7.28897H2.9541V1.5094H34.7417V24.6277Z"
                                                            fill="white" />
                                                        <path d="M23.183 0.0645142H14.5137V5.84408H23.183V0.0645142Z"
                                                              fill="white" />
                                                        <path
                                                            d="M18.8481 34.7419H0.0644531V27.5175C0.0644531 24.1942 1.94281 21.1599 4.8326 19.715C3.67668 18.5591 2.95424 16.9697 2.95424 15.2359C2.95424 11.6236 5.84402 8.73386 9.45626 8.73386C13.0685 8.73386 15.9583 11.6236 15.9583 15.2359C15.9583 16.2473 15.8138 17.1142 15.3803 17.8367C17.4032 16.9697 20.2929 15.2359 23.6162 11.9126L26.506 9.02283L28.5288 11.0457L26.6505 13.0685L29.2513 15.6693L28.8178 16.5363C28.6733 16.8253 25.3501 24.4832 19.2815 26.9395C18.9925 27.084 18.8481 27.2285 18.8481 27.5175V34.7419ZM2.95424 31.8521H15.9583V27.5175C15.9583 26.0726 16.8252 24.7722 18.1256 24.1942C22.0268 22.6048 24.7721 18.1257 25.7835 16.2473L24.6276 15.0914C17.5477 21.7379 12.2016 21.7379 11.6236 21.7379H8.73381C5.55505 21.7379 2.95424 24.3387 2.95424 27.5175V31.8521ZM9.45626 18.8481C11.4791 18.8481 13.0685 17.2587 13.0685 15.2359C13.0685 13.213 11.4791 11.6236 9.45626 11.6236C7.43341 11.6236 5.84402 13.213 5.84402 15.2359C5.84402 17.2587 7.43341 18.8481 9.45626 18.8481Z"
                                                            fill="white" />
                                                        </g>
                                                        <defs>
                                                        <clipPath id="clip0_2503_230">
                                                            <rect width="34.6774" height="34.6774" fill="white"
                                                                  transform="translate(0.0644531 0.0645142)" />
                                                        </clipPath>
                                                        </defs>
                                                        </svg>
                                                    </div>
                                                    <div class="title" style="color: #F69C14;">
                                                        <span>
                                                            <b>Workshop</b>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="stat_content" style="margin-left: 31.5rem">
                                                    <span>
                                                        Total Workshops
                                                    </span>
                                                    <div class="stat_number"style="margin-left: 3.5rem;">
                                                        <span>
                                                            <%= totalWorkshop%>
                                                        </span>
                                                        <span class="unit" style="display: flex;align-items: center;padding-left: 1rem;">
                                                            workshops
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="stat_content" style="margin-left: 31.5rem">
                                                    <span>
                                                        Total Enrolled Customers
                                                    </span>
                                                    <div class="stat_number">
                                                        <span>
                                                            <%= customerWorkshop%>
                                                        </span>
                                                        <span class="unit" style="display: flex;align-items: center;padding-left: 1rem;">
                                                            customers
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </button>
                                </h2>
                                <div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                    <span class="heading">
                                        <b>
                                            Top 3 workshops of last month
                                        </b>
                                    </span>

                                    <div class="card-container" style="display: flex">
                                        <c:forEach var="workshop" items="${dashboard.getDetailTop3Workshop()}">
                                            <div class="card-item">
                                                <img src="data:images/jpg;base64,${workshop.course_img}"/>
                                                <div class="text">
                                                    <div class="title">
                                                        Workshop Name
                                                    </div>
                                                    <div class="content">
                                                        ${workshop.title}
                                                    </div>
                                                    <div class="title">
                                                        Enrolled Customers
                                                    </div>
                                                    <div class="content">
                                                        ${workshop.participant_count}
                                                    </div>
                                                </div>
                                            </div>

                                        </c:forEach>
                                    </div>

                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button toggle1" type="button" disabled>
                                        <div class="accordion-body">
                                            <div class="content">
                                                <div class="logo-container">
                                                    <div class="logo" style="background: #237EEF;">
                                                        <svg style="background: #237EEF;" xmlns="http://www.w3.org/2000/svg" width="50"
                                                             height="50" viewBox="0 0 50 50" fill="none">
                                                        <rect width="50" height="50" rx="10" fill="#237EEF" />
                                                        <path
                                                            d="M20.4298 18.1689H14.3366C12.654 18.1689 11.29 19.5282 11.29 21.2049V34.8672C11.29 36.544 12.654 37.9032 14.3366 37.9032H35.6628C37.3454 37.9032 38.7094 36.544 38.7094 34.8672V21.2049C38.7094 19.5282 37.3454 18.1689 35.6628 18.1689H29.5696M20.4298 18.1689V15.1328C20.4298 13.4561 21.7938 12.0968 23.4764 12.0968H26.523C28.2056 12.0968 29.5696 13.4561 29.5696 15.1328V18.1689M20.4298 18.1689H29.5696"
                                                            stroke="white" stroke-width="5" stroke-linecap="round"
                                                            stroke-linejoin="round" />
                                                        </svg>
                                                    </div>
                                                    <div class="title" style="color: #237EEF;">
                                                        <span>
                                                            <b>Private Consultation</b>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="stat_content" style="margin-left: 17.5rem">
                                                    <span>
                                                        Total Hours
                                                    </span>
                                                    <div class="stat_number" style="margin-left: 4rem;">
                                                        <span>
                                                            840
                                                        </span>
                                                        <span class="unit" style="display: flex;align-items: center;padding-left: 1rem;">
                                                            hours
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="stat_content" style="margin-left: 32rem">
                                                    <span>
                                                        Total Enrolled Customers
                                                    </span>
                                                    <div class="stat_number" style="">
                                                        <span>
                                                            <%= customerAppointment%>
                                                        </span>
                                                        <span class="unit" style="display: flex;align-items: center;padding-left: 1rem;">
                                                            customers
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </button>
                                </h2>
                                <!-- <div id="flush-collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                    <span class="heading">
                                        <b>
                                            Top 3 bird course
                                        </b>
                                    </span>
                                    <div class="card-container">
                                        <div class="card-item">
                                                <img src="img/trainer2.jpg">
                                            <div class="text">
                                                <div class="title">
                                                    Bird Course Name
                                                </div>
                                                <div class="content">
                                                    Advanced Recall Techniques:
                                                    Developing Reliable Flight Responses
                                                </div>
                                                <div class="title">
                                                    Enrolled Customers
                                                </div>
                                                <div class="content">
                                                    128
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div> -->
                            </div>
                        </div>
                        <div class="title-head" style="display: flex">
                            Top 3 trainers of last month
                        </div>
                        <div class="top-trainer">
                            <c:forEach var="trainer" items="${dashboard.getTop3Trainer()}">
                                <div class="card-item">
                                    <img src="data:images/jpg;base64,${trainer.trainer_img}"/>
                                    <div class="text">
                                        <div class="title">
                                            Trainer Name
                                        </div>
                                        <div class="content">
                                            ${trainer.fullname}
                                        </div>
                                        <div class="title">
                                            Total income
                                        </div>
                                        <div class="content">
                                            $ ${trainer.total_earnings}
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <!--        <script>
                    window.addEventListener('DOMContentLoaded', function () {
                        var headerWidth = document.getElementById('headerPage').style.width;
                        var container = document.getElementById('containerPage');
                        container.style.maxWidth = 'calc(100% - ' + headerWidth + 'px)';
                    });
                </script>-->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"
        ></script>
        <script type="text/javascript">
            window.onload = function () {

                var chart = new CanvasJS.Chart("chartContainer", {
                    title: {
                        text: "Total revenue of 4 services for the last 6 months"
                    },
                    axisX: {
                        title: "Month"
                    },
                    axisY: {
                        title: "Revenue"
                    },
                    data: [{
                            type: "column",
                            dataPoints: <%=dataPoints%>
                        }]
                });
                chart.render();
                document.getElementById('loading-screen').style.display = 'none';
                document.body.classList.remove('loading');
            };
        </script>
        <script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>
    </body>
</html>
