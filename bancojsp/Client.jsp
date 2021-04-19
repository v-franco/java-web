
<%@ page import="java.io.*" %>

<jsp:useBean id="clientdp" class="bankModel.ClienteDP" />
<jsp:useBean id="bank" class="bankModel.BancoADjdbc" />

<jsp:setProperty name="clientdp" property="*"/>

<%
    if(request.getParameter("bCapture") == null && request.getParameter("bConsult") == null && request.getParameter("bConsultNocta") == null && request.getParameter("bConsultType") == null) {
%>
<html>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <title>JSP Bank</title>
    <style>
        body {background-color: #242582;}
    </style>
	<body><center>
        <table>
            <h2 class="title">JSP Bank</h2>
            <form action='../bancojsp/Client.jsp' method='get'>
            <!--<form action='../basicos/ServletBanco' method='get'>-->
                <tr>
                    <td><p class="texto16"> CUENTA: </p></td>
                    <td align="center"><input type='text' name='nocta' class="field"></td><br/>
                </tr>
                <tr>
                    <td><p class="texto16"> NOMBRE: </p></td>
                    <td align="center"><input type='text' name='name' class="field"></td><br/>
                </tr>
                <tr>
                    <td><p class="texto16"> TIPO DE CUENTA: </p></td>
                    <td align="center"><input type='text' name='type' class="field"></td><br/>
                </tr>
                <tr>
                    <td><p class="texto16"> SALDO: </p></td>
                    <td align="center"><input type='text' name='balance' class="field"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type='submit' name='bCapture' value='Capturar datos' class="button">
                        <input type='submit' name='bConsult' value='Consultar clientes' class="button">
                        <input type='submit' name='bConsultNocta' value='Consultar No Cuenta' class="button">
                        <input type='submit' name='bConsultType' value='Consultar Tipo Cuenta' class="button">
                    </td>
                </tr>
                            
            </form>
        </table>
	</center></body>
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
                <jsp:param name="data" value="<%= data %>"/>
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