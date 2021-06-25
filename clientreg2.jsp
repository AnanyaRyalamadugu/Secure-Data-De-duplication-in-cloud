<%@ page import="java.sql.*"%>


<%@ page  import="java.sql.*" import="databaseconnection.databasecon" import="javax.swing.JOptionPane"%>



<%! String name, lname, addr, city, state, zip, tele, email, uid, pwd;
	int i=0;
%>
<%


name=request.getParameter("name");

uid=request.getParameter("uid");
pwd=request.getParameter("pwd");
email=request.getParameter("em");
tele=request.getParameter("cn");

 

%>
<%
try{

Connection con = databasecon.getconnection();
Statement st=con.createStatement();
Statement st1=con.createStatement();

ResultSet rst=st1.executeQuery("select *from register where userid='"+uid+"'");

if(!rst.next()){
	int q= st.executeUpdate("insert into register values('"+name+"','"+uid+"','"+pwd+"','"+tele+"','"+email+"')");

	if(q>0)
	{
	response.sendRedirect("client.jsp?msg2=suces");
	
	}

}
else
response.sendRedirect("clientreg.jsp?msg3=duplicate");

}
catch(Exception e)
{
e.printStackTrace();
	}
%>
