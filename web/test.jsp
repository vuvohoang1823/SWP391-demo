<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="DAO.test" %>
<%
    test top = new test(); // Instantiate your DAO class
    List<Double> revenueData = top.getRevenueData();
%>
<%
    Gson gsonObj = new Gson();
    List<Map<Object, Object>> list = new ArrayList<>();

    for (int i = 0; i < revenueData.size(); i++) {
        Map<Object, Object> map = new HashMap<>();
        map.put("label", "Month " + (i + 1));
        map.put("y", revenueData.get(i));
        list.add(map);
    }

    String dataPoints = gsonObj.toJson(list);
%>

<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            window.onload = function () {

                var chart = new CanvasJS.Chart("chartContainer", {
                    title: {
                        text: "Revenue for the Last 6 Months"
                    },
                    axisX: {
                        title: "Month"
                    },
                    axisY: {
                        title: "Revenue"
                    },
                    data: [{
                            type: "column",
                            dataPoints: <%= dataPoints%>
                        }]
                });
                chart.render();

            }
        </script>
    </head>
    <body>
        <div id="chartContainer" style="height: 370px; width: 100%;"></div>
        <script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>
    </body>
</html> 
