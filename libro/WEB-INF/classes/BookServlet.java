import javax.servlet.http.*;
import java.io.*;
//Class 2, 24:41
public class BookServlet extends HttpServlet {

    private BiblioADjdbc biblio = new BiblioADjdbc();

    private String getData(HttpServletRequest request) {
        
        String data, titulo, autor, editorial;
        titulo   = request.getParameter("titulo");
        autor  = request.getParameter("autor");
        editorial = request.getParameter("editorial");

        data = titulo+"_"+autor+"_"+editorial;
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

        if (transaction.equals("Capturar Datos")) {

            data = getData(request);

            answer = biblio.capturar(data);

            response.sendRedirect("ServerResponse1.jsp?data="+answer);
        
        }

        if(transaction.equals("Consultar Libros")){

            data = biblio.consultarLibros();

            //response.sendRedirect("ServerResponse.jsp?data="+data);
            serverResponse(response, data);

        }

        if(transaction.equals("Consultar Editorial")){

            String editorial = request.getParameter("editorial");

            data = biblio.consultarEditorial(editorial);

            response.sendRedirect("ServerResponse.jsp?data="+data);

        }

        if(transaction.equals("Consultar Titulo")){

            String titulo = request.getParameter("titulo");

            data = biblio.consultarTitulo(titulo);

            response.sendRedirect("ServerResponse.jsp?data="+data);

        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doGet(request, response);
    }
}