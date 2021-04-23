
<%--<%@ page import="biblioModel.BiblioADjdbc" %>--%>

<%@ page import="java.io.*" %>

<jsp:useBean id="librodp" class="biblioModel.LibroDP" />
<jsp:useBean id="biblioad" class="biblioModel.BiblioADjdbc" />

<jsp:setProperty name="librodp" property="*" />

<%
	if(request.getParameter("bCapturar") == null && request.getParameter("bConsultar") == null && request.getParameter("bConsultarEditorial") == null && 
	request.getParameter("bConsultarTitulo") == null && request.getParameter("bEditar") == null && request.getParameter("bActualizar") == null &&
	request.getParameter("bConsultarJson") == null && request.getParameter("bConsultarEditorialJson") == null)
	
	{
%>

		<html>
		  <head><title>WEB Server Tomcat</title></head>
		    <body>
		      <center>
		        <h1>Bibliteca TEC:</h1><p>
		        <form action='../biblioJsp/Libro.jsp' method='get'>
		        	TITULO:    <input type='text' name='titulo'                id='titulo' value=''><br/>
		        	AUTOR:     <input type='text' name='autor'                 id='autor' value=''><br/>
		        	EDITORIAL: <input type='text' name='editorial'             id='editorial' value=''><br/>
		        			   <input type='button' name='bCapturar'           id='bCapturar' value='Capturar Datos' onclick='capturarDatos()'>
		        			   <input type='button' name='bConsultar'          id='bConsultar' value='Consultar Libros' onclick='consultarLibros()'>
        			   		   <input type='button' name='bConsultarEditorial' id='bConsultarEditorial' value='Consultar Editorial' onclick='consultarEditorial()'>
        			   		   <input type='button' name='bConsultarTitulo'    id='bConsultarTitulo'    value='Consultar Titulo'  onclick='consultarTitulo()'>
        		</form>
		        <br/>
        			Transaccion: <div id='transaccion'></div>
      		  </center>
		    </body>
		</html>
<%
	}
	else
	{
		//BiblioADjdbc biblioad = new BiblioADjdbc();
		
		String datos="";
		String resultado;
		
		if(request.getParameter("bCapturar") != null)
		{
			// 1. Obtener los datos de los JTextFields
            //datos = obtenerDatos(librodp.getTitulo(), librodp.getAutor(), librodp.getEditorial());
            
            // 2. Capturar los datos a traves del objeto BiblioAD
            /*if(datos.equals("VACIO"))
                resultado = "Algun campo esta vacio...";
            else
            	//resultado = datos;
             	//resultado = biblioad.capturar(datos);*/
             	resultado = biblioad.capturar(librodp);
            
            // 3. Enviar los datos al Server Http
            //response.sendRedirect("RespuestaGral.jsp?mensaje="+resultado);
%>
            <jsp:forward page="RespuestaGral.jsp" >
            	<jsp:param name="mensaje" value="<%= resultado %>" />
            </jsp:forward>
<%
		}
		
		if(request.getParameter("bConsultar") != null)
		{
			datos = biblioad.consultarLibros();
            
            //response.sendRedirect("RespuestaGral.jsp?mensaje="+datos);
            //response.sendRedirect("RespuestaGral1.jsp?mensaje="+datos);
            //response.sendRedirect("RespuestaGral2.jsp?mensaje="+datos);
%>
            <jsp:forward page="RespuestaGral2.jsp" >
            	<jsp:param name="datos" value="<%= datos %>" />
            </jsp:forward>
<%
		}
		
		if(request.getParameter("bConsultarEditorial") != null)
		{
		 	//String edit = tfEditorial.getText();
		 	String edit = request.getParameter("editorial");
            
            datos = biblioad.consultarEditorial(edit);
            
            //response.sendRedirect("RespuestaGral.jsp?mensaje="+datos);
            //response.sendRedirect("RespuestaGral1.jsp?mensaje="+datos);
%>
            <jsp:forward page="RespuestaGral1.jsp" >
            	<jsp:param name="datos" value="<%= datos %>" />
            </jsp:forward>
<%
		}
		
		if(request.getParameter("bConsultarTitulo") != null)
		{
		 	//String edit = tfEditorial.getText();
		 	String tit = request.getParameter("titulo");
            
            datos = biblioad.consultarTitulo(tit);
            
            //response.sendRedirect("RespuestaGral.jsp?mensaje="+datos);
            //response.sendRedirect("RespuestaGral1.jsp?mensaje="+datos);
%>
            <jsp:forward page="RespuestaGral1.jsp" >
            	<jsp:param name="datos" value="<%= datos %>" />
            </jsp:forward>
<%
		}
		
		if(request.getParameter("bConsultarJson") != null)
		{
			datos = biblioad.consultarLibrosJson();
            
           	PrintWriter salidaServer = response.getWriter();
			response.setContentType("text/plain");
		
			salidaServer.println(datos);
		}
		
		if(request.getParameter("bConsultarEditorialJson") != null)
		{
		 	//String edit = tfEditorial.getText();
		 	String edit = request.getParameter("editorial");
            
            datos = biblioad.consultarEditorialJson(edit);
            
            PrintWriter salidaServer = response.getWriter();
			response.setContentType("text/plain");
		
			salidaServer.println(datos);
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
		
		if(request.getParameter("bActualizar") != null)
		{
			// Actualizar daots del libro
           	resultado = biblioad.actualizarLibro(librodp);
            
            // 3. Enviar los datos al Server Http
%>
            <jsp:forward page="RespuestaGral.jsp" >
            	<jsp:param name="mensaje" value="<%= resultado %>" />
            </jsp:forward>
<%
		}
	}
%>


