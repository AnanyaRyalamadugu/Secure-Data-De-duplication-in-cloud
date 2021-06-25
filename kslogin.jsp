
<%@page import="databaseconnection.*,java.sql.*"%>
<%!
Connection con;
Statement stmt;
ResultSet rs;
%>
<%
String uname = request.getParameter("uid");
String password = request.getParameter("pwd");

con = databasecon.getconnection();
stmt = con.createStatement();

if(uname.equals("KS") && (password.equals("KS"))){
response.sendRedirect("kshome.jsp");
}else{
response.sendRedirect("keyserver.jsp?msg=unsucc");
}
%>