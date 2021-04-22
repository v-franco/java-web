<%
    String data = request.getParameter("data");
%>
<html>
  <head>
      <title>WEB Server Tomcat</title>
      <link rel="stylesheet" type="text/css" href="styles.css">      
      <style>
          body {background-color: #262a33;}
          table.beta {
              font-weight:bold;
              font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
              border: 3px solid black;
              border-collapse: collapse;
              background-color: rgb(182, 194, 206);

              }

          table.beta  th, td {
              border: 3px solid black;  
              border-collapse: collapse;
              text-align: center;
              padding: 8px;

              }

          table.beta tr:nth-child(even){background-color: #43ffaf;}
      </style>
</head>
    <body><center> 
        <h1 class="title">Library DB:</h1><p>
        <hr>
        <table class="beta">
            <p class="texto16"><%= data %></p>
        </center></table>
    </body>
</html>