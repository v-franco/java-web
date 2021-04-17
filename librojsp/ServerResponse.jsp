<%
    String data = request.getParameter("data");
%>
<html>
  <head><title>WEB Server Tomcat</title></head>
    <body>
        <h1>Library DB:</h1><p>
        <hr>
        <table border=1>
            <%= data %>
        </table>
    </body>
</html>