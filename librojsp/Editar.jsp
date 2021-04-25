<%@ page import="java.io.*" %>


<jsp:useBean id="librodp" class="libraryModel.LibroDP" />
<jsp:useBean id="library" class="libraryModel.BiblioADjdbc" />

<jsp:setProperty name="librodp" property="*"/>

<%
    if(request.getParameter("bCapture") == null)  {
%>
<html>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="styles.css">
	<head>
        <title>Library with JSP</title>
        <style>
            body {background-color: #262a33;} 
    
        </style>
    </head>
	<body><center>
		<h2 class="title">JSP Library</h2>
		<form action='../librojsp/Library.jsp' method='get'>
            <table style="width: 50%">
		<!--<form action='../basicos/ServletBanco' method='get'>-->
            <tr>
        	    <td><p class="texto16 text-end"> TITULO: </p></td>
                <td align="center"><input type='text' name='titulo' value='${param.titulo}' class="field"></td><br/>
            </tr>
            <tr>
                <td><p class="texto16 text-end"> AUTOR: </p></td>
                <td align="center"><input type='text' name='autor' value='${param.autor}' class="field"></td><br/>
            </tr>
            <tr>
                <td><p class="texto16 text-end"> EDITORIAL: </p></td>
                <td align="center"><input type='text' name='editorial' value='${param.editorial}' class="field"></td><br/>
            </tr>
            </table>
            <table>
                <tr>
                    <td colspan="2" align="center">
                        <br><br><br><br>
                        <input type='submit' name='bCapture' value='Actualizar Datos' class="button">

                    </td>
                </tr>
            </table>
        			   
		</form>
	</center></body>
</html>
<%
    }

    else{
        
        //BancoADjdbc library = new BancoADjdbc();
        
        String data, answer;

        if(request.getParameter("bCapture") != null){
            //response.sendRedirect("ServerResponse.jsp?data=Capturar datos");

            //data = getData(request);
            data = librodp.toString();

            //answer = library.capturar(data);
            answer = library.capturar(librodp);
            //answer = data

            response.sendRedirect("ServerResponse1.jsp?data="+answer);
        }
    }
%>