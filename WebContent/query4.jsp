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
<h2>TOP HTTP METHODS BY NUMBER OF REQUESTS</h2>
<%

Connection con = Database.dataConnection();		
String str = "select Method,Request,count(*) from log_1 group by Method,Request order by count(*) desc limit 5";
PreparedStatement ps = con.prepareStatement(str);
ResultSet rs=ps.executeQuery();

String str1 = "select Method,Request,count(*) from log_2 group by Method,Request order by count(*) desc limit 5";
PreparedStatement ps1 = con.prepareStatement(str1);
ResultSet rs1=ps1.executeQuery();
%>
<center>
<table cellpadding="15" border="2" style="background-color: #ffffcc;">
<TR bgcolor="#993333" style="color:#ffffff;">
<TH colspan="3"> LOG FILE ONE</TH>
</TR>
<TR bgcolor="blue" style="color:#ffffff;" >
<TH>METHOD</TH>
<TH>REQUEST</TH>
<TH>NO. OF REQUEST</TH>
</TR>
<%
while (rs.next()) {
%>
<TR>
<TD><b><%=rs.getString(1)%></b></TD>
<TD><b><%=rs.getString(2)%></b></TD>
<TD><b><%=rs.getInt(3)%></b></TD>
</TR>
<% } %>

<table cellpadding="15" border="2" style="background-color: #ffffcc;">
<TR bgcolor="#993333" style="color:#ffffff;">
<TH colspan="3"> LOG FILE TWO</TH>
</TR>
<TR bgcolor="blue" style="color:#ffffff;" >
<TH>METHOD</TH>
<TH>REQUEST</TH>
<TH>NO. OF REQUEST</TH>
</TR>
<%
while (rs1.next()) {
%>
<TR>
<TD><b><%=rs1.getString(1)%></b></TD>
<TD><b><%=rs1.getString(2)%></b></TD>
<TD><b><%=rs1.getInt(3)%></b></TD>
</TR>
<% } %>

</font>
<font size="+3" color="red"></b>

</TABLE>
<FORM ACTION="query3.jsp " method="get" >
<button type="submit" id="back"><-- back</button>
</FORM>
<FORM ACTION="HomePage.jsp " method="get" >
<button type="submit" id="homepage">HomePage</button>
</FORM>
<FORM ACTION="query5.jsp " method="get" >
<button type="submit" id="next">next--></button>
</FORM>
</font>
</body>
</html>