<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : chartlineAdmin
    Created on : Mar 20, 2023, 5:04:20 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Visualize Data Beautifully Using JS Charts</title>
        <link href="/css/style.css" media="screen" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
                        .button {
                display: inline-block;
                padding: 10px 20px;
                background-color: #00504B;
                color: white;
                text-align: center;
                text-decoration: none;
                font-size: 16px;
                border-radius: 5px;
                border: none;
                cursor: pointer;
            }
             .button1 {
                display: inline-block;
                padding: 10px 20px;
                background-color: #D5762B;
                color: white;
                text-align: center;
                text-decoration: none;
                font-size: 16px;
                border-radius: 5px;
                border: none;
                cursor: pointer;
            } 
             .button2 {
                display: inline-block;
                padding: 10px 20px;
                background-color: #005F5F;
                color: white;
                text-align: center;
                text-decoration: none;
                font-size: 16px;
                border-radius: 5px;
                border: none;
                cursor: pointer;
            } 
             .button3 {
                display: inline-block;
                padding: 10px 20px;
                background-color: #82193A;
                color: white;
                text-align: center;
                text-decoration: none;
                font-size: 16px;
                border-radius: 5px;
                border: none;
                cursor: pointer;
            } 
            .mainchart{
                display: flex;
                justify-content: space-around;

            }
        </style>
    </head>
    <body>
        <div class="mainchart">
            <a href="ChartController?service=displayChartBuy" class="button">Chart Order</a>
            <a href="ChartController?service=displayCategory" class="button1">Chart Category</a> 
            <a href="ChartController" class="button2">Chart Money</a> 
            <a href="MainAdmin" class="button3">Home</a> 
        </div>
        <div id="chart">
            <canvas id="myChart" width="150" height="50" ></canvas>
        </div>
        <script>
            const ctx = document.getElementById('myChart');
            const labels = ['January', 'February', 'March',
                'April', 'May', 'June', 'July', 'August'
                        , 'September ', 'October', 'November', 'December'];
            const data = {
                labels: labels,
                datasets: [{
                        label: 'Money',
                        data: [${t1.isEmpty()?0:t1.get(0).getMoney()},
            ${t2.isEmpty()?0:t2.get(0).getMoney()},
            ${t3.isEmpty()?0:t3.get(0).getMoney()},
            ${t4.isEmpty()?0:t4.get(0).getMoney()},
            ${t5.isEmpty()?0:t5.get(0).getMoney()},
            ${t6.isEmpty()?0:t6.get(0).getMoney()},
            ${t7.isEmpty()?0:t7.get(0).getMoney()},
            ${t8.isEmpty()?0:t8.get(0).getMoney()},
            ${t9.isEmpty()?0:t9.get(0).getMoney()},
            ${t10.isEmpty()?0:t10.get(0).getMoney()},
            ${t11.isEmpty()?0:t11.get(0).getMoney()},
            ${t12.isEmpty()?0:t12.get(0).getMoney()}],
                        fill: false,
                        borderColor: 'rgb(75, 192, 192)',
                        tension: 0.6
                    }]
            };
            const config = new Chart(ctx, {
                type: 'line',
                data: data
            });
        </script>
    </body>
</html>
