<%
    String data = request.getParameter("data");
%>
<html>
  <head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="styles.css">
      <title>WEB Server Tomcat</title>
      <style>
        body {background-color: #262a33;}
    </style>
</head>
    <body><center>
        <h1 class="texto16">Library DB:</h1><p>
        <hr>
        <h2 class="texto16"><%= data %></h2>
        <br>
        <form action="../librojsp/librofinal.html">
            <input type="submit" value="Regresar" class="button"/>
        </form>
    </center></body>
</html>