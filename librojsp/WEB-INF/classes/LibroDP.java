package libraryModel;

import java.io.*;
import java.util.*;
import java.sql.*;
public class LibroDP
{
	private String titulo, autor, editorial;
	
	
	// Constructores
	public LibroDP()
	{
		this.titulo    = "";
		this.autor     = "";
		this.editorial = "";
	}
	
	public LibroDP(String datos)
	{
		StringTokenizer st = new StringTokenizer(datos,"_");
		
		this.titulo    = st.nextToken();
		this.autor     = st.nextToken();
		this.editorial = st.nextToken();
	}
	
	// Accesors (geter)
	public String getTitulo()
	{
		return this.titulo;
	}
	
	public String getAutor()
	{
		return this.autor;
	}
	
	public String getEditorial()
	{
		return this.editorial;
	}
	
	
	// Mutators (seter)
	public void setTitulo(String tit)
	{
		this.titulo = tit;
	}
	
	public void setAutor(String aut)
	{
		this.autor = aut;
	}
	
	public void setEditorial(String edit)
	{
		this.editorial = edit;
	}
	
	
	public String toString()
	{
		return this.titulo+"_"+this.autor+"_"+this.editorial;
	}
	
	public String toStringSql()
	{
		return "'"+this.titulo+"','"+this.autor+"','"+this.editorial+"'";
	}

    public String toStringHTML(){
        return "<tr><td>"+titulo+"</td><td>"+autor+"</td><td>"+editorial+"</td></tr>";
    }

    public String toStringHtmlImg(){
        return "<tr><td>"+titulo+"</td><td>"+autor+"</td><td>"+editorial+"</td><td>"+"<img src='../librojsp/images/"+titulo+".jpg' width=100 height=80></img>"+"</td></tr>";
    }

    
    public String toStringJSON(){
        return "{\"titulo\":\""+titulo+"\",\"autor\":\""+autor+"\",\"editorial\":\""+editorial+"\"}";
    }
}
