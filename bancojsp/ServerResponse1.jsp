<%
    String data = request.getParameter("data");
%>
<html>
  <head><title>Bank JSP</title>
    <style>
        body {background-color: #262a33;}
    </style>
  </head>
    <body>
        <h1 class="texto16">Bank DB:</h1><p>
        <hr>
        <h2 class="texto16"><%= data %></h2>
    </body>
</html>