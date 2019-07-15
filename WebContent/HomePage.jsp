<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Analysis Of Web traffic</title>
</head>
<body background="pro2.jpg" repeat = "no-repeat">
<style>

h2
{
font-family: Verdana;
font-size: 5.3vw; 
color: #993333; 
text-align: center 
}
div
{
 
margin-left: 32px; 
margin-top: 12px; 
color: #993333;
font-size: 40px;
line-height: 24px;
text-align: center 
}
button {
 background-color: #993333; /* Brown */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
margin-left: 32px; 
margin-top: 12px;
}
</style>
<h2>Analysis</h2>

<div>
<p>Understanding Web Traffic </p>
</div>

<center>
<form name ="main1" method="GET" action="query1.jsp">
<button type="submit"><b>Top Clients by no of Request</b></button>
</form>
<form name ="main2" method="GET" action="query2.jsp">
<button type="submit"><b>Top URLS by no of Request</b></button>
</form>
<form name ="main3" method="GET" action="query3.jsp">
<button type="submit"><b>Top URLS by size of Response</b> </button>
</form>
<form name ="main4" method="GET" action="query4.jsp">
<button type="submit"><b>Top HTTP Request</b></button>
</form>
<form name ="main6" method="GET" action="query5.jsp">
<button type="submit"><b>Top Content type</b></button>
</form>
<form name ="main6" method="GET" action="query1.jsp">
<button type="submit"><b>Trend</b></button>
</form>
<form name ="main7" method="GET" action="query7.jsp">
<button type="submit"><b>Total Data Transfer</b></button>
</form>





<center>
</body>
</html>
    