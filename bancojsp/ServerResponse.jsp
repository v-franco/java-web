<%
    String data = request.getParameter("data");
%>
<html>
    <link rel="stylesheet" type="text/css" href="styles.css">       
    <head><title>Bank JSP</title>
        <style>
            body {background-color: #242582;}
            table {
            border: 3px solid black;
            border-collapse: collapse;
            background-color: lightslategrey;

            }

            th, td {
            border: 3px solid black;  
            border-collapse: collapse;
            text-align: center;
            padding: 8px;

            }

            tr:nth-child(even){background-color: steelblue;}
        </style>
    </head>
        <body><center> 
            <h1 class="title">Bank DB:</h1><p>
            <hr>
            <table class="texto16">
                <%= data %>
            </table>
        </center></body>
</html>