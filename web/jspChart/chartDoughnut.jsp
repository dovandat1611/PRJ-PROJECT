<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : chartAdmin
    Created on : Mar 20, 2023, 4:57:59 PM
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
            .chart{
                width: 30px;
                height: 20px;
            }
            .button {
                display: inline-block;
                padding: 10px 20px;
                background-color: #4CAF50;
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
            <a href="ChartController?service=displayCategory" class="button">Chart Category</a> 
            <a href="ChartController" class="button">Chart Money</a> 
        </div>
        <div id="chart">
            <canvas id="myChart"  width="200" height="100" ></canvas>
        </div>
        <script>
            const ctx = document.getElementById('myChart').getContext("2d");
            const data = {
                labels: [
                    'Red',
                    'Blue',
                    'Yellow'
                ],
                datasets: [{
                        label: 'My First Dataset',
                        data: [300, 50, 100],
                        backgroundColor: [
                            'rgb(255, 99, 132)',
                            'rgb(54, 162, 235)',
                            'rgb(255, 205, 86)'
                        ],
                        hoverOffset: 4
                    }]
            };
            const config = new Chart(ctx, {
                type: 'doughnut',
                data: data
            });
        </script>
    </body>
</html>


