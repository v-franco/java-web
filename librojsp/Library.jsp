
<%@ page import="java.io.*" %>

<jsp:useBean id="librodp" class="libraryModel.LibroDP" />
<jsp:useBean id="library" class="libraryModel.BiblioADjdbc" />

<jsp:setProperty name="librodp" property="*"/>

<%
    if(request.getParameter("bCapture") == null && request.getParameter("bConsult") == null && request.getParameter("bConsultEdit") == null && request.getParameter("bConsultTitle") == null) {
%>
<html>
	<head><title>Library with JSP</title></head>
	<body>
		<h2>JSP Library</h2>
		<form action='../librojsp/Library.jsp' method='get'>
		<!--<form action='../basicos/ServletBanco' method='get'>-->
        	TITULO:    <input type='text' name='titulo' value=''><br/>
        	AUTOR:     <input type='text' name='autor' value=''><br/>
        	EDITORIAL: <input type='text' name='editorial' value=''><br/>
        			   <input type='submit' name='bCapture' value='Capturar Datos'>
        			   <input type='submit' name='bConsult' value='Consultar Libros'>
        			   <input type='submit' name='bConsultEdit' value='Consultar Editorial'>
        			   <input type='submit' name='bConsultTitle' value='Consultar Titulo'>
		</form>
	</body>
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
            serverResponse(response, data);
        }

        if(request.getParameter("bConsultEdit") != null){
            //response.sendRedirect("ServerResponse.jsp?data=Consultar nocta");

            //String ncta = request.getParameter("nocta");
            String ncta = librodp.getEditorial();

            data = library.consultarEditorial(ncta);

            //response.sendRedirect("ServerResponse.jsp?data="+data);
%>
            <jsp:forward page="ServerResponse.jsp">
                <jsp:param name="data" value="<%= data %>" />
            </jsp:forward> 
<%
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