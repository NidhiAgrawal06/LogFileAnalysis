package test;
import java.sql.*;
public class Database 
{
	static Connection con;
	public static Connection dataConnection()
	{
		String url="jdbc:mysql://localhost:3306/user";
		String user="root";
		String password="Passw0rd";		
		
		
		//1.Loading Driver
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(url, user, password);
			System.out.println("Database Connected...");

		} 
		catch (ClassNotFoundException e) 
		{
			System.out.println("Database not Connected...");
			e.printStackTrace();
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
	
		return con;
		
	}
}

