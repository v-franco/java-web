<%
    String data = request.getParameter("data");
%>
<html>
  <head><title>Bank Servlet</title>
    <style>
        body {background-color: #242582;}
    </style>
  </head>
    <body>
        <h1 class="texto16">Bank DB:</h1><p>
        <hr>
        <h2 class="texto16"><%= data %></h2>
    </body>
</html>