<%@ page import="java.util.StringTokenizer" %>

<%
    String data = request.getParameter("data");
    StringTokenizer st = new StringTokenizer(data,"*");
    StringTokenizer st2;
    String titulo, autor, editorial, imagen;
    String strRefTit, strRefImg, strHtmlImg;
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
            
<%
            while(st.hasMoreTokens()) {
                st2 = new StringTokenizer(st.nextToken(),"_");
                titulo    = st2.nextToken();
                autor     = st2.nextToken();
                editorial = st2.nextToken();
                imagen    = titulo+".jpg";

                strHtmlImg = "<img src='../librojsp/images/"+imagen+"' width=100 heigth=80>";
 				strRefTit  = "<a href='../librojsp/Library.jsp?bEditar=editar&autor="+autor+"&editorial="+editorial+"&titulo="+titulo+"'>"+titulo+"</a>";
 				strRefImg  = "<a href='../librojsp/Library.jsp?bEditar=editar&autor="+autor+"&editorial="+editorial+"&titulo="+titulo+"'>"+strHtmlImg+"</a>";
%>            
                <tr><td><%= strRefTit %></td><td><%= autor %></td><td><%= editorial %></td><td><%= strRefImg %></td></tr>
<%
            }
%>
        </center></table>
    </body>
</html>