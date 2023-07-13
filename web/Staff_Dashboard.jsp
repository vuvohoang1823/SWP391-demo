<%--
    Document   : ConsultationForm
    Created on : Jun 15, 2023, 2:21:36 AM
    Author     : thang
--%>
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
        <link rel="stylesheet" href="css/Trainer_Dashboard.css" />
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
                        <div class="title">
                            Revenue for this month
                        </div>
                        <div class="section-head">
                            <div class="box">
                                <span style="font-size: 2rem;">
                                    Bird course
                                </span>
                                <span style="font-size: 4rem;font-weight: bolder">
                                    ${DASHBOARD6.birdCourse}$
                                </span>
                            </div>
                            <div class="box">
                                <span style="font-size: 2rem;">
                                    Online course
                                </span>
                                <span style="font-size: 4rem;font-weight: bolder">
                                    ${DASHBOARD6.onlineCourse}$
                                </span>
                            </div>
                            <div class="box">
                                <span style="font-size: 2rem;">
                                    Private Consultation
                                </span>
                                <span style="font-size: 4rem;font-weight: bolder">
                                    ${DASHBOARD6.consultation}$
                                </span>
                            </div>
                            <div class="box">
                                <span style="font-size: 2rem;">
                                    Workshop
                                </span>
                                <span style="font-size: 4rem;font-weight: bolder">
                                    ${DASHBOARD6.workshop}$
                                </span>
                            </div>
                            <div class="box">
                                <span style="font-size: 2rem;">
                                    Total
                                </span>
                                <span style="font-size: 4rem;font-weight: bolder">
                                    ${DASHBOARD6.total}$
                                </span>
                                <span>
                            </div>
                        </div>
                        <div style="height: 480px;overflow-y: hidden;margin-left: 3rem;">
                            <div id="chartContainer" style="height: 492px; width: 98%;background: #617255; border-radius: 20px;"></div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <script>
            window.addEventListener('DOMContentLoaded', function () {
                var headerWidth = document.getElementById('headerPage').offsetWidth;
                var container = document.getElementById('containerPage');
                container.style.maxWidth = 'calc(100% - ' + headerWidth + 'px)';
            });
        </script>
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
            }
        </script>
        <script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>
    </body>
</html>
