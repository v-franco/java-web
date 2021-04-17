package bankModel;

import java.io.*;
import java.util.*;
import java.sql.*;

import com.cedarsoftware.util.io.JsonWriter;

public class BancoADjdbc{

    private PrintWriter archiveOut;
    private BufferedReader archiveIn;
    private Connection conexion;
    private Statement statement;
    private ClienteDP clientedp;

    public BancoADjdbc(){
        try{
        //Class.forName("com.mysql.jdbc.Driver").newInstance();
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/banco2?user=root");
        System.out.println("Successfully connected to Database");
        }
        catch(ClassNotFoundException cnfe){
            System.out.println("Error 1:"+cnfe);
        }
        catch(InstantiationException ie){
            System.out.println("Error 2:"+ie);
        }
        catch(IllegalAccessException iae){
            System.out.println("Error 3:"+iae);
        }
        catch(SQLException sqle){
            System.out.println("Error 4:"+sqle);
        }
    }
    //public String captureData(String data){
    public String captureData(ClienteDP clientdp){
        String result="";
        String insertClient, ncta, name, type, balance;
        StringTokenizer st;
        //INSERT for Database
        //insertClient = "INSERT INTO cliente VALUES('1177','VIGELMY LOPEZ','AHORRO',7000)";
        // st = new StringTokenizer(data,"_");
        // ncta = st.nextToken();
        // name = st.nextToken();
        // type = st.nextToken();
        // balance = st.nextToken();
        // insertClient = "INSERT INTO cliente VALUES('"+ncta+"','"+name+"','"+type+"',"+balance+")";
        //clientedp = new ClienteDP(data);
        insertClient = "INSERT INTO cliente VALUES("+clientdp.toStringSql()+")";
        try{
            // archiveOut = new PrintWriter(new FileWriter("Clientes.txt", true));
            statement = conexion.createStatement();
            // archiveOut.println(data);
            statement.executeUpdate(insertClient);
            // archiveOut.close();
            statement.close();
            result = "Data saved";
            System.out.println(insertClient);
        }
        catch(SQLException sqle){
             result = "Error, cannot open database, or insert values";
             System.out.println("Error, cannot open database: "+sqle);
         }
        
        return result;
    }

    public String consultData(){
        String data="";
        String client, query, ncta, name, type;
        int balance;
        ResultSet trClient;
        query = "SELECT * FROM Cliente";
        try{
            //Open file or DB
            //archiveIn = new BufferedReader(new FileReader("Clientes.txt"));
            statement = conexion.createStatement();

            //Process file or DB for data display 
            // while(archiveIn.ready()){
            //     client=archiveIn.readLine();
            //     System.out.println(client);
            //     data=data+client+"\n";
            // }
            trClient = statement.executeQuery(query);
            clientedp = new ClienteDP();

            data = "[";
            while(trClient.next()){
               clientedp.setNocta(trClient.getString(1));
               clientedp.setName(trClient.getString(2));
               clientedp.setType(trClient.getString(3));
               clientedp.setBalance(trClient.getInt(4));

               //data = data + clientedp.toString() + "\n";
               //data = data + clientedp.toStringHTML();
               //data = data + clientedp.toStringJSON()+",";
               data = data + JsonWriter.objectToJson(clientedp)+",";
            }
            //data = data + "]";
            data = data.substring(0,data.length()-1) + "]";
            //Close file or DB
            statement.close();
            System.out.println(query);

            //archiveIn.close();
        }
        catch(SQLException sqle){
            data = "Error, cannot open database, or insert values";
            System.out.println("Error, cannot open database: "+sqle);
         }
         //IOException only used when reading from files, not DB
        // catch(IOException ioe){
        //     data = "Error, cannot close file";
        //     System.out.println("Error: "+ioe);
        // }
        return data;
    }

    public String consultType(String tcta){
        String data="", client, ncta, name, type, query, balance;
        StringTokenizer stClient;
        ResultSet trClient;
        boolean found = false;

        query = "SELECT * FROM Cliente WHERE tipo='"+tcta+"'";

        try{
            //archiveIn = new BufferedReader(new FileReader("Clientes.txt"));
            statement = conexion.createStatement();

            // while(archiveIn.ready()){
            //     client=archiveIn.readLine();
            //     stClient = new StringTokenizer(client,"_");
            //     ncta = stClient.nextToken();
            //     name = stClient.nextToken();
            //     type = stClient.nextToken();
            //     balance = stClient.nextToken();

            //     if(tcta.equals(type)){
            //         data = data+client+"\n";
            //         found = true;
            //     }
            //     if(!found){
            //         data = "Account type not found";
            //     }
            trClient = statement.executeQuery(query);
            clientedp = new ClienteDP();
            while(trClient.next()){
               clientedp.setNocta(trClient.getString(1));
               clientedp.setName(trClient.getString(2));
               clientedp.setType(trClient.getString(3));
               clientedp.setBalance(trClient.getInt(4));

               //data = data + clientedp.toString() + "\n";
               data = data + clientedp.toStringHTML();
               
               found = true;
            }
            if(!found){
                     data = "Account type not found";
            }
                
            // }
            statement.close();
            System.out.println(query);
            // archiveIn.close();
        }
        catch(SQLException sqle){
            data = "Error, cannot open database, or insert values";
            System.out.println("Error, cannot open database: "+sqle);
        }
        return data;
    } 

    public String consultNcta(String nocta){
        String data="", client, ncta, name, type, balance, query;
        StringTokenizer stClient;
        ResultSet trClient;
        boolean found = false;

        query = "SELECT * FROM Cliente WHERE nocta='"+nocta+"'";

        try{
            // archiveIn = new BufferedReader(new FileReader("Clientes.txt"));
            statement = conexion.createStatement();
            trClient = statement.executeQuery(query);
            clientedp = new ClienteDP();
            while(trClient.next()){
               clientedp.setNocta(trClient.getString(1));
               clientedp.setName(trClient.getString(2));
               clientedp.setType(trClient.getString(3));
               clientedp.setBalance(trClient.getInt(4));

               //data = data + clientedp.toString() + "\n";
               data = data + clientedp.toStringHTML();
               found = true;
            }
            if(!found){
                data = "Account not found";
            }
            // }
            statement.close();
            System.out.println(query);

            // while(archiveIn.ready()){
            //     client=archiveIn.readLine();
            //     stClient = new StringTokenizer(client,"_");
            //     ncta = stClient.nextToken();
            //     name = stClient.nextToken();
            //     type = stClient.nextToken();
            //     balance = stClient.nextToken();
            //     if(nocta.equals(ncta)){
            //         data = data+client+"\n";
            //         found = true;
            //     }
            //     if(!found){
            //         data = "Account not found";
            //     }
            // }
            // archiveIn.close();
        }
        catch(SQLException sqle){
            data = "Error, cannot open database, or insert values";
            System.out.println("Error, cannot open database: "+sqle);
        }
        return data;
    }
}