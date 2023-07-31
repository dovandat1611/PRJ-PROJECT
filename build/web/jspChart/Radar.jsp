<%-- 
    Document   : Radar
    Created on : Mar 20, 2023, 11:42:36 PM
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
    </head>
    <body>
        <canvas id="myChart" height="50px" width="150px"></canvas> 
        <script>
            const ctx = document.getElementById('myChart');
            const data = {
                labels: [
                    'Garment',
                    'Accessories',
                    'Technology'
                ],
                datasets: [{
                        label: 'My First Dataset',
                        data: [65, 59, 90],
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
