package test;
import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.regex.*;

import test.Database;

interface LogExample {
  public static final int NUM_FIELDS = 9;

  public static final String logEntryLine = "123.45.67.89 - - [27/Oct/2000:09:27:09 -0400] \"GET /java/javaResources.html HTTP/1.0\" 200 10450 \"-\" \"Mozilla/4.6 [en] (X11; U; OpenBSD 2.8 i386; Nav)\"";

}

public class LogRegExp implements LogExample {

  public static void main(String argv[]) {

    String logEntryPattern1 = "^(\\S+) (\\S+) (\\S+) \\[([\\w:/]+\\s[+\\+]\\d{4})\\] \"(.+?)\" (\\d{3}) (\\d+) \"([^\"]+)\" \"([^\"]+)\"";
    String logEntryPattern2 = "^(\\S+) (\\S+) (\\S+) \\[([\\w:/]+\\s[+\\-]\\d{4})\\] \"(\\S+) (\\S+) (\\S+)\" (\\d{3}) (\\S+)";
    
    int num=0;
    String line;
	BufferedReader reader;
	Pattern p ;
	Matcher matcher; 
	try 
	{
		reader=new BufferedReader(new FileReader("C:\\Users\\Lenovo\\Desktop\\tech hackathon/access_log.txt"));
		while((line=reader.readLine()) !=null )
		{
			System.out.println();
		    System.out.println("Input line is:");
			System.out.println(line);
			
			p = Pattern.compile(logEntryPattern1);
		    matcher = p.matcher(line);
		    if (!matcher.matches() || NUM_FIELDS != matcher.groupCount()) 
		    {
		    	p = Pattern.compile(logEntryPattern2);
			    matcher = p.matcher(line);
		    	if(!matcher.matches() || NUM_FIELDS != matcher.groupCount()) 
		    	{
		    	  System.err.println("Error!");
		    	}
		    }
		    /*System.out.println("IP Address: " + matcher.group(1));
		    System.out.println("Date&Time: " + matcher.group(4));
		    System.out.println("Method: " + matcher.group(5));
		    System.out.println("Request: " + matcher.group(6));
		    System.out.println("Protocol: " + matcher.group(7));
		    System.out.println("Response Code: " + matcher.group(8));
		    System.out.println("size: " + matcher.group(9));*/
		    
		    Connection con = Database.dataConnection();
			String str = "insert into log_1(IP,Date,Method,Request,Protocol,Response,Size) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(str);
			ps.setString(1,matcher.group(1));
			ps.setString(2,matcher.group(4));
			ps.setString(3,matcher.group(5));
			ps.setString(4,matcher.group(6));
			ps.setString(5,matcher.group(7));
			ps.setString(6,matcher.group(8));
			ps.setString(7,matcher.group(9));
			ps.execute();
		}
	}
	catch(Exception e) 
	{
		System.err.println(e);
	}
    
	//Connecting with the database
	
  }
}