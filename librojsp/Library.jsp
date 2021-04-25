
<%@ page import="java.io.*" %>

<jsp:useBean id="librodp" class="libraryModel.LibroDP" />
<jsp:useBean id="library" class="libraryModel.BiblioADjdbc" />

<jsp:setProperty name="librodp" property="*"/>

<%
    if(request.getParameter("bCapture") == null && request.getParameter("bConsult") == null && request.getParameter("bConsultEdit") == null 
    && request.getParameter("bConsultTitle") == null && request.getParameter("bConsultJson") == null && request.getParameter("bConsultEditJson") == null 
    && request.getParameter("bConsultTitleJson") == null && request.getParameter("bEditar") == null)  {
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
                <td align="center"><input type='text' name='titulo' value='' class="field"></td><br/>
            </tr>
            <tr>
                <td><p class="texto16 text-end"> AUTOR: </p></td>
                <td align="center"><input type='text' name='autor' value='' class="field"></td><br/>
            </tr>
            <tr>
                <td><p class="texto16 text-end"> EDITORIAL: </p></td>
                <td align="center"><input type='text' name='editorial' value='' class="field"></td><br/>
            </tr>
            </table>
            <table>
                <tr>
                    <td colspan="2" align="center">
                        <br><br><br><br>
                        <input type='submit' name='bCapture' value='Capturar Datos' class="button">
        			    <input type='submit' name='bConsult' value='Consultar Libros' class="button">
        			    <input type='submit' name='bConsultEdit' value='Consultar Editorial' class="button">
        			    <input type='submit' name='bConsultTitle' value='Consultar Titulo' class="button">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type='submit' name='bConsultJson' value='Consultar general JSON' class="buttonJson">
                        <input type='submit' name='bConsultEditJson' value='Consultar editorial JSON' class="buttonJson">
                        <input type='submit' name='bConsultTitleJson' value='Consultar Titulo JSON' class="buttonJson">
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

        if(request.getParameter("bConsult") != null){
            //response.sendRedirect("ServerResponse.jsp?data=Consultar datos");

            data = library.consultarLibros();

            //response.sendRedirect("ServerResponse.jsp?data="+data);
            //serverResponse(response, data);
%>
            <jsp:forward page="RespuestaGral2.jsp">
                <jsp:param name="data" value="<%= data %>" />
            </jsp:forward> 
<%
        }

        if(request.getParameter("bConsultJson") != null){
            //response.sendRedirect("ServerResponse.jsp?data=Consultar datos");

            data = library.consultarLibrosJson();

            //response.sendRedirect("ServerResponse.jsp?data="+data);
            serverResponse(response, data);
        }

        if(request.getParameter("bConsultEdit") != null){
            //response.sendRedirect("ServerResponse.jsp?data=Consultar nocta");

            //String ncta = request.getParameter("nocta");
            String ncta = librodp.getEditorial();

            data = library.consultarEditorial(ncta);

            //response.sendRedirect("ServerResponse.jsp?data="+data);
%>
            <jsp:forward page="RespuestaGral2.jsp">
                <jsp:param name="data" value="<%= data %>" />
            </jsp:forward> 
<%
        }

        if(request.getParameter("bConsultEditJson") != null){
            //response.sendRedirect("ServerResponse.jsp?data=Consultar datos");
            String editorial = librodp.getEditorial();

            data = library.consultarEditorialJson(editorial);

            //response.sendRedirect("ServerResponse.jsp?data="+data);
            serverResponse(response, data);
        }
        

        if(request.getParameter("bConsultTitle") != null){
            //response.sendRedirect("ServerResponse.jsp?data=Consultar type");

            //String tcta = request.getParameter("type");
            String tcta = librodp.getTitulo();

            data = library.consultarTitulo(tcta);

            //response.sendRedirect("ServerResponse.jsp?data="+data);
 %>
            <jsp:forward page="ServerResponse.jsp">
                <jsp:param name="data" value="<%= data %>" />
            </jsp:forward> 
 <%           
        }

        if(request.getParameter("bEditar") != null)
		{
		 	//String edit = tfEditorial.getText();
		 	//String tit  = request.getParameter("titulo");
            
            //datos = biblioad.consultarTitulo(tit);
            
            //response.sendRedirect("RespuestaGral.jsp?mensaje="+datos);
            //response.sendRedirect("RespuestaGral1.jsp?mensaje="+datos);
%>
			<%--<h2><%= librodp.getTitulo() %></h2>--%>
			<%--<h2><%= librodp.getAutor() %></h2>--%>
			<%--<h2><%= librodp.getEditorial() %></h2>--%>
			
			<%--<h2><jsp:getProperty name="librodp" property="titulo"/></h2>--%>
			<%--<h2><jsp:getProperty name="librodp" property="autor"/></h2>--%>
			<%--<h2><jsp:getProperty name="librodp" property="editorial"/></h2>--%>
			
			<jsp:forward page="Editar.jsp" >
            	<jsp:param name="titulo"    value="<%= librodp.getTitulo() %>" />
            	<jsp:param name="autor"     value="<%= librodp.getAutor() %>" />
            	<jsp:param name="editorial" value="<%= librodp.getEditorial() %>" />
            </jsp:forward>
            
<%
		}

        if(request.getParameter("bConsultTitleJson") != null){
            //response.sendRedirect("ServerResponse.jsp?data=Consultar datos");
            String titulo = librodp.getTitulo();

            data = library.consultarTituloJson(titulo);

            //response.sendRedirect("ServerResponse.jsp?data="+data);
            serverResponse(response, data);
        }
    }
%>

<%!
    private String getData(HttpServletRequest request) {
            
        String data, nocta, name, type, balance;
        nocta   = request.getParameter("nocta");
        name  = request.getParameter("name");
        type    = request.getParameter("type");
        balance   = request.getParameter("balance");

        data    = nocta+"_"+name+"_"+type+"_"+balance;
        return  data;
    }

    private void serverResponse(HttpServletResponse response, String dataJSON) throws IOException {
        PrintWriter serverOut = response.getWriter();
        response.setContentType("text.plain");
        serverOut.println(dataJSON);
    }
%>