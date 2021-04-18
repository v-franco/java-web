<%
    String data = request.getParameter("data");
%>
<html>
  <head><title>WEB Server Tomcat</title>
    <style>
        body {background-color: dodgerblue;}
    </style>
  </head>
    <body>
        <h1>Bank DB:</h1><p>
        <hr>
        <h2><%= data %></h2>
    </body>
</html>