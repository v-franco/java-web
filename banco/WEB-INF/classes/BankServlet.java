import javax.servlet.http.*;
import java.io.*;
//Class 2, 24:41
public class BankServlet extends HttpServlet {

    private BancoADjdbc bank = new BancoADjdbc();

    private String getData(HttpServletRequest request) {
        
        String data, nocta, nombre, tipo, saldo;
        nocta   = request.getParameter("nocta");
        nombre  = request.getParameter("nombre");
        tipo    = request.getParameter("tipo");
        saldo   = request.getParameter("saldo");

        data    = nocta+"_"+nombre+"_"+tipo+"_"+saldo;
        return  data;
    }

    private void serverResponse(HttpServletResponse response, String dataJSON) throws IOException {
        PrintWriter serverOut = response.getWriter();
        response.setContentType("text.plain");
        serverOut.println(dataJSON);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    
        String transaction, data, answer;

        transaction = request.getParameter("boton");

        if (transaction.equals("Capturar datos")) {

            data = getData(request);

            answer = bank.captureData(data);

            response.sendRedirect("ServerResponse1.jsp?data="+answer);
        
        }

        if(transaction.equals("Consultar clientes")){

            data = bank.consultData();

            //response.sendRedirect("ServerResponse.jsp?data="+data);
            serverResponse(response, data);

        }

        if(transaction.equals("Consultar Tipo Cuenta")){

            String tcta = request.getParameter("tipo");

            data = bank.consultType(tcta);

            response.sendRedirect("ServerResponse.jsp?data="+data);

        }

        if(transaction.equals("Consultar No Cuenta")){

            String ncta = request.getParameter("nocta");

            data = bank.consultNcta(ncta);

            response.sendRedirect("ServerResponse.jsp?data="+data);

        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doGet(request, response);
    }
}