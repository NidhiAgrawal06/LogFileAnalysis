<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
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
<h2>TOTAL DATA TRANSFER</h2>
<%

Connection con = Database.dataConnection();		
String str = "select sum(Size) from log_1";
PreparedStatement ps = con.prepareStatement(str);
ResultSet rs=ps.executeQuery();

String str1 = "select sum(Size) from log_2";
PreparedStatement ps1 = con.prepareStatement(str1);
ResultSet rs1=ps1.executeQuery();
%>
<center>
<table cellpadding="15" border="2" style="background-color: #ffffcc;">
<TR bgcolor="#993333" style="color:#ffffff;">
<TH colspan="2"> LOG FILE ONE</TH>
</TR>
<TR bgcolor="blue" style="color:#ffffff;" >
<TH>DATA UPLOADED & DOWNLOADED</TH>
</TR>
<%
rs.next();
float var=rs.getInt(1);
var=(var/1024);
var=(var/1024);

Formatter formatter=new Formatter();
formatter.format(".2f",var);
%>
<TR>
<TD><b><%=var%> MB</b></TD>
</TR>
</TABLE>

<table cellpadding="15" border="2" style="background-color: #ffffcc;">
<TR bgcolor="#993333" style="color:#ffffff;">
<TH colspan="2"> LOG FILE TWO</TH>
</TR>
<TR bgcolor="blue" style="color:#ffffff;" >
<TH>DATA UPLOADED & DOWNLOADED</TH>
</TR>
<%
rs1.next();
double var1=rs1.getDouble(1);

var1=(var1/1024);

var1=(var1/1024);

Formatter formatter1=new Formatter();
formatter1.format(".2f",var1);

%>
<TR>
<TD><b><%=var1%> MB</b></TD>
</TR>
</TABLE>

</font>
<font size="+3" color="red"></b>

</TABLE>
<FORM ACTION="query5.jsp " method="get" >
<button type="submit" id="back"><-- back</button>
</FORM>
<FORM ACTION="HomePage.jsp " method="get" >
<button type="submit" id="homepage">HomePage</button>
</FORM>
<FORM ACTION="HomePage.jsp " method="get" >
<button type="submit" id="next">next--></button>
</FORM>
</font>
</body>
</html>