<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="test.Database" %>
<html>
<head>
<title>Analysis Of Web traffic</title>
</head>
<body background="pro2.jpg" repeat = "no-repeat">
<style>
table{
display:inline-block;
vertical-align:top;
}
h2
{
font-family: Verdana;
font-size: 3.3vw; 
color: #993333; 
text-align: center ;
}

 #back{
 background-color: #993333; /* Brown */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
position:absolute;
right:900;
bottom:100;
}
 #homepage{
 background-color: #993333; /* Brown */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
position:absolute;
right:700;
bottom:100;
}
 #next{
 background-color: #993333; /* Brown */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
position:absolute;
right:500;
bottom:100;
}
</style>
<h2>TOP CONTENT TYPE</h2>
<%

Connection con = Database.dataConnection();	
//select Request,count(*) from log_1 where Request regexp '^.*\.(jpg|JPG|GIF|doc|DOC|pdf|PDF|txt|TXT|PNG|png)$' group by Request order by count(*) desc
String str = "select Request,count(*) from log_1 where Request regexp '^.*\\.(jpg|JPG|GIF|doc|DOC|pdf|PDF|txt|TXT|PNG|png)$' group by Request order by count(*) desc limit 5";
PreparedStatement ps = con.prepareStatement(str);
ResultSet rs=ps.executeQuery();

//select Request,count(*) from log_1 where Request regexp '^.*\.(jpg|JPG|GIF|doc|DOC|pdf|PDF|txt|TXT|PNG|png)$' group by Request order by count(*) desc
String str1 = "select Request,count(*) from log_2 where Request regexp '^.*\\.(jpg|JPG|GIF|doc|DOC|pdf|PDF|txt|TXT|PNG|png)$' group by Request order by count(*) desc limit 5";
PreparedStatement ps1 = con.prepareStatement(str1);
ResultSet rs1=ps1.executeQuery();
%>
<center>
<table cellpadding="15" border="2" style="background-color: #ffffcc;">
<TR bgcolor="#993333" style="color:#ffffff;">
<TH colspan="2"> LOG FILE ONE</TH>
</TR>
<TR bgcolor="blue" style="color:#ffffff;" >
<TH>REQUEST</TH>
<TH>NO. OF COUNT</TH>
</TR>
<%
while (rs.next()) {
%>
<TR>
<TD><b><%=rs.getString(1)%></b></TD>
<TD><b><%=rs.getInt(2)%></b></TD>
</TR>
<%}  %>

<table cellpadding="15" border="2" style="background-color: #ffffcc;">
<TR bgcolor="#993333" style="color:#ffffff;">
<TH colspan="2"> LOG FILE TWO</TH>
</TR>
<TR bgcolor="blue" style="color:#ffffff;" >
<TH>REQUEST</TH>
<TH>NO. OF COUNT</TH>
</TR>
<%
while (rs1.next()) {
%>
<TR>
<TD><b><%=rs1.getString(1)%></b></TD>
<TD><b><%=rs1.getInt(2)%></b></TD>
</TR>
<%}  %>

</font>
<font size="+3" color="red"></b>

</TABLE>
<FORM ACTION="query4.jsp " method="get" >
<button type="submit" id="back"><-- back</button>
</FORM>
<FORM ACTION="HomePage.jsp " method="get" >
<button type="submit" id="homepage">HomePage</button>
</FORM>
<FORM ACTION="query7.jsp " method="get" >
<button type="submit" id="next">next--></button>
</font>
</body>
</html>