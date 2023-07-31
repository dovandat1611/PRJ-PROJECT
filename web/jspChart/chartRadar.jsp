<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : charRadar
    Created on : Mar 20, 2023, 6:36:41 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
            <canvas id="myChart" width="240" height="100"></canvas>
        </div>
        
        <script>
            const ctx = document.getElementById('myChart');
            const data = {
                labels: [
                    'Garment',
                    'Accessories',
                    'Technology'
                ],
                datasets: [{
                        label: 'Category',
                        data: [${Garment.isEmpty()?0:Garment.get(0).getTotalcategory()},
                               ${Accessories.isEmpty()?0:Accessories.get(0).getTotalcategory()},
                               ${Technology.isEmpty()?0:Technology.get(0).getTotalcategory()}],
                        fill: true,
                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                        borderColor: 'rgb(255, 99, 132)',
                        pointBackgroundColor: 'rgb(255, 99, 132)',
                        pointBorderColor: '#fff',
                        pointHoverBackgroundColor: '#fff',
                        pointHoverBorderColor: 'rgb(255, 99, 132)'
                    }]
            };
            const config = new Chart(ctx, {
                type: 'radar',
                data: data,
                options: {
                    elements: {
                        line: {
                            borderWidth: 3
                        }
                    }
                }
            });
        </script>
    </body>
</html>
