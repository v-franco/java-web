package bankModel;

import java.io.*;
import java.util.*;
import java.sql.*;
public class ClienteDP{
    //Attributes
    private String nocta, name, type;
    private int balance;
    //Constructors
    public ClienteDP(){
        this.nocta = "";
        this.name = "";
        this.type = "";
        this.balance = 0;
    }

    public ClienteDP(String data){
        
        StringTokenizer st = new StringTokenizer(data,"_");
        this.nocta   = st.nextToken();
        this.name    = st.nextToken();
        this.type    = st.nextToken();
        this.balance = Integer.parseInt(st.nextToken());
    }

    //Accesors
    public String getNocta(){
        return this.nocta;
    }
    public String getName(){
        return this.name;
    }
    public String getType(){
        return this.type;
    }
    public int getBalance(){
        return this.balance;
    }
    //Mutators
    public void setNocta(String ncta){
        this.nocta = ncta;
    }
    public void setName(String nombre){
        this.name = nombre;
    }
    public void setType(String tcta){
        this.type = tcta;
    }
    public void setBalance(int money){
        this.balance = money;
    }

    public String toString(){
        return nocta+"_"+name+"_"+type+"_"+balance;
    }

    public String toStringSql(){
        return "'"+nocta+"','"+name+"','"+type+"',"+balance;
    }

    public String toStringHTML(){
        return "<tr><td>"+nocta+"</td><td>"+name+"</td><td>"+type+"</td><td>"+balance+"</td></tr>";
    }

    // public String toStringJSON(){
    //     return "{nocta:'"+nocta+"',nombre:'"+name+"',tipo:'"+type+"',saldo:'"+balance+"'}";
    // }

    // public String toStringJSON(){
    //     return "{'nocta':'"+nocta+"','nombre':'"+name+"','tipo':'"+type+"','saldo':'"+balance+"'}";
    // }

    public String toStringJSON(){
        return "{\"nocta\":\""+nocta+"\",\"nombre\":\""+name+"\",\"tipo\":\""+type+"\",\"saldo\":\""+balance+"\"}";
    }
}