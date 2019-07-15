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
bottom:60;
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
bottom:60;
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
bottom:60;
}
</style>
<h2>TOP URL BY NUMBER OF REQUEST</h2>
<%

Connection con = Database.dataConnection();		
String str = "select Request,count(*) as topic from log_1 group by Request order by count(*) desc limit 5";
String str1 = "select URL,count(*) as topic from log_2 where URL <>'-' group by URL order by count(*) desc limit 5";

PreparedStatement ps = con.prepareStatement(str);
PreparedStatement ps1 = con.prepareStatement(str1);
ResultSet rs=ps.executeQuery();
ResultSet rs1=ps1.executeQuery();
%>
<center>
<table cellpadding="15" border="2" style="background-color: #ffffcc;">
<TR bgcolor="#993333" style="color:#ffffff;">
<TH colspan="2"> LOG FILE ONE</TH>
</TR>
<TR bgcolor="blue" style="color:#ffffff;">
<TH>REQUEST</TH>
<TH>NO. OF REQUESTS</TH>
</TR>
<%
while (rs.next()) {
%>
<TR>
<TD><b><%=rs.getString(1)%></b></TD>
<TD><b><%=rs.getInt(2)%></b></TD>
</TR>
<% } %>

<table cellpadding="15" border="2" style="background-color: #ffffcc;">
<TR bgcolor="#993333" style="color:#ffffff;">
<TH colspan="2"> LOG FILE TWO</TH>
</TR>
<TR bgcolor="blue" style="color:#ffffff;" >
<TH>URL</TH>
<TH>NO. OF REQUESTS</TH>
</TR>
<%
while (rs1.next()) {
%>
<TR>
<TD><b><%=rs1.getString(1)%></b></TD>
<TD><b><%=rs1.getInt(2)%></b></TD>
</TR>
<% } %>

</font>
<font size="+3" color="red"></b>

</TABLE>

<FORM ACTION="query1.jsp " method="get" >
<button type="submit" id="back"><-- back</button>
</FORM>
<FORM ACTION="HomePage.jsp " method="get" >
<button type="submit" id="homepage">HomePage</button>
</FORM>
<FORM ACTION="query3.jsp " method="get" >
<button type="submit" id="next">next--></button>
</FORM>
</font>
</body>
</html>