
<%@ page import="java.io.*" %>

<jsp:useBean id="clientdp" class="bankModel.ClienteDP" />
<jsp:useBean id="bank" class="bankModel.BancoADjdbc" />

<jsp:setProperty name="clientdp" property="*"/>

<%
    if(request.getParameter("bCapture") == null && request.getParameter("bConsult") == null && request.getParameter("bConsultNocta") == null && request.getParameter("bConsultType") == null) {
%>
<html>
	<head><title>Banco Servlets</title></head>
	<body>
		<h2>JSP Bank</h2>
		<form action='../bancojsp/Client.jsp' method='get'>
		<!--<form action='../basicos/ServletBanco' method='get'>-->
			NO. CUENTA:  <input type='text' name='nocta'><br/>
			NOMBRE:      <input type='text' name='name'><br/>
			TIPO CUENTA: <input type='text' name='type'><br/>
			SALDO:       <input type='text' name='balance'><br/><br/>
					     <input type='submit' name='bCapture' value='Capturar datos'>
					     <input type='submit' name='bConsult' value='Consultar clientes'>
					     <input type='submit' name='bConsultNocta' value='Consultar No Cuenta'>
					     <input type='submit' name='bConsultType' value='Consultar tipo de Cuenta'>
		</form>
	</body>
</html>
<%
    }

    else{
        
        //BancoADjdbc bank = new BancoADjdbc();
        
        String data, answer;

        if(request.getParameter("bCapture") != null){
            //response.sendRedirect("ServerResponse.jsp?data=Capturar datos");

            //data = getData(request);
            data = clientdp.toString();

            //answer = bank.captureData(data);
            answer = bank.captureData(clientdp);
            //answer = data

            response.sendRedirect("ServerResponse1.jsp?data="+answer);
        }

        if(request.getParameter("bConsult") != null){
            //response.sendRedirect("ServerResponse.jsp?data=Consultar datos");

            data = bank.consultData();

            //response.sendRedirect("ServerResponse.jsp?data="+data);
            serverResponse(response, data);
        }

        if(request.getParameter("bConsultNocta") != null){
            //response.sendRedirect("ServerResponse.jsp?data=Consultar nocta");

            //String ncta = request.getParameter("nocta");
            String ncta = clientdp.getNocta();

            data = bank.consultNcta(ncta);

            //response.sendRedirect("ServerResponse.jsp?data="+data);
%>
            <jsp:forward page="ServerResponse.jsp">
                <jsp:param name="data" value="<%= data %>" />
            </jsp:forward> 
<%
        }

        if(request.getParameter("bConsultType") != null){
            //response.sendRedirect("ServerResponse.jsp?data=Consultar type");

            //String tcta = request.getParameter("type");
            String tcta = clientdp.getType();

            data = bank.consultType(tcta);

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