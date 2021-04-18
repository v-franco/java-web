<%
    String data = request.getParameter("data");
%>
<html>
  <head><title>Bank JSP</title>
    <style>
        body {background-color: dodgerblue;}
    </style>
  </head>
    <body>
        <h1>Bank DB:</h1><p>
        <hr>
        <table border=1>
            <%= data %>
        </table>
    </body>
</html>