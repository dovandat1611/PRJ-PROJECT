<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : chartBar
    Created on : Mar 20, 2023, 6:35:56 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    </div>
    <div id="chart">
        <canvas id="myChart"  width="200" height="100" ></canvas>
    </div>
    <script>
        const ctx = document.getElementById('myChart').getContext("2d");
        const labels = ['January', 'February', 'March',
            'April', 'May', 'June', 'July', 'August'
                    , 'September ', 'October', 'November', 'December'];
        const data = {
            labels: labels,
            datasets: [{
                    label: 'Chart Order',
                    data: [${t1.isEmpty()?0:t1.get(0).getTotalorder()},
        ${t2.isEmpty()?0:t2.get(0).getTotalorder()},
        ${t3.isEmpty()?0:t3.get(0).getTotalorder()},
        ${t4.isEmpty()?0:t4.get(0).getTotalorder()},
        ${t5.isEmpty()?0:t5.get(0).getTotalorder()},
        ${t6.isEmpty()?0:t6.get(0).getTotalorder()},
        ${t7.isEmpty()?0:t7.get(0).getTotalorder()},
        ${t8.isEmpty()?0:t8.get(0).getTotalorder()},
        ${t9.isEmpty()?0:t9.get(0).getTotalorder()},
        ${t10.isEmpty()?0:t10.get(0).getTotalorder()},
        ${t11.isEmpty()?0:t11.get(0).getTotalorder()},
        ${t12.isEmpty()?0:t12.get(0).getTotalorder()}],

                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(255, 159, 64, 0.2)',
                        'rgba(255, 205, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(201, 203, 207, 0.2)'
                    ],
                    borderColor: [
                        'rgb(255, 99, 132)',
                        'rgb(255, 159, 64)',
                        'rgb(255, 205, 86)',
                        'rgb(75, 192, 192)',
                        'rgb(54, 162, 235)',
                        'rgb(153, 102, 255)',
                        'rgb(201, 203, 207)'
                    ],
                    borderWidth: 1
                }]
        };
        const config = new Chart(ctx, {
            type: 'bar',
            data: data,
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</body>
</html>
