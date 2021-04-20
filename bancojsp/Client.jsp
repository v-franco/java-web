
<%@ page import="java.io.*" %>

<jsp:useBean id="clientdp" class="bankModel.ClienteDP" />
<jsp:useBean id="bank" class="bankModel.BancoADjdbc" />

<jsp:setProperty name="clientdp" property="*"/>

<%
    if(request.getParameter("bCapture") == null && request.getParameter("bConsult") == null && request.getParameter("bConsultNocta") == null && request.getParameter("bConsultType") == null && request.getParameter("bConsultJson") == null & request.getParameter("bConsultNoctaJson") == null & request.getParameter("bConsultTypeJson") == null) {
%>
<html>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="styles.css">
    <title>JSP Bank</title>
    <style>
        body {background-color: #262a33;} 

    </style>
	<body><center>
        
            <br>
            <h2 class="title">JSP Bank</h2>
            <form action='../bancojsp/Client.jsp' method='get'>
                <table style="width: 50%">
            <!--<form action='../basicos/ServletBanco' method='get'>-->
                    <tr>
                        <td><p class="texto16 text-end"> CUENTA: </p></td>
                        <td align="center"><input type='text' name='nocta' class="field" placeholder="CUENTA"></td><br/>
                    </tr>
                    <tr>
                        <td><p class="texto16 text-end"> NOMBRE: </p></td>
                        <td align="center"><input type='text' name='name' class="field" placeholder="NOMBRE"></td><br/>
                    </tr>
                    <tr>
                        <td><p class="texto16 text-end"> TIPO DE CUENTA: </p></td>
                        <td align="center"><input type='text' name='type' class="field" placeholder="TIPO DE CUENTA"></td><br/>
                    </tr>
                    <tr>
                        <td><p class="texto16 text-end"> SALDO: </p></td>
                        <td align="center"><input type='text' name='balance' class="field" placeholder="SALDO"></td>
                    </tr>
                </table>
                <table>  
                    <tr>
                        <td colspan="2" align="center">
                            <br><br><br><br>
                            <input type='submit' name='bCapture' value='Capturar datos' class="button">
                            <input type='submit' name='bConsult' value='Consultar clientes' class="button">
                            <input type='submit' name='bConsultNocta' value='Consultar No Cuenta' class="button">
                            <input type='submit' name='bConsultType' value='Consultar Tipo Cuenta' class="button">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type='submit' name='bConsultJson' value='Consultar clientes JSON' class="buttonJson">
                            <input type='submit' name='bConsultNoctaJson' value='Consultar No Cuenta JSON' class="buttonJson">
                            <input type='submit' name='bConsultTypeJson' value='Consultar Tipo Cuenta JSON' class="buttonJson">
                        </td>
                    </tr>
                </table>      
            </form>
       
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
            //serverResponse(response, data);
%>
            <jsp:forward page="ServerResponse.jsp">
                <jsp:param name="data" value="<%= data %>"/>
            </jsp:forward> 
<%
        }

        if(request.getParameter("bConsultJson") != null){
            //response.sendRedirect("ServerResponse.jsp?data=Consultar datos");

            data = bank.consultDataJson();

            //response.sendRedirect("ServerResponse.jsp?data="+data);
            serverResponse(response, data);
        }

        if(request.getParameter("bConsultNocta") != null){
            //response.sendRedirect("ServerResponse.jsp?data=Consultar nocta");

            //String ncta = request.getParameter("nocta");
            String ncta = clientdp.getNocta();

            data = bank.consultNcta(ncta);

            //response.sendRedirect("ServerResponse.jsp?data="+data);
            //serverResponse(response, data);
%>
            <jsp:forward page="ServerResponse.jsp">
                <jsp:param name="data" value="<%= data %>"/>
            </jsp:forward> 
<%
        }

        if(request.getParameter("bConsultNoctaJson") != null){
            //response.sendRedirect("ServerResponse.jsp?data=Consultar datos");
            String ncta = clientdp.getNocta();
            data = bank.consultNctaJson(ncta);

            //response.sendRedirect("ServerResponse.jsp?data="+data);
            serverResponse(response, data);
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

        if(request.getParameter("bConsultTypeJson") != null){
            //response.sendRedirect("ServerResponse.jsp?data=Consultar datos");
            String tcta = clientdp.getType();
            data = bank.consultTypeJson(tcta);

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