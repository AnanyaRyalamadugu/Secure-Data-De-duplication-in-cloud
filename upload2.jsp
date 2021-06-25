<%@ page import="java.io.*"%>


<%! File f=null;%>
<%!String uid,file=null; String sha1,sha2=null; byte [] filedata=null;%>

<%@ page  import="java.sql.*" import="databaseconnection.databasecon" import="javax.swing.JOptionPane"%>
<%@ page import="java.sql.*"%>
<% uid=(String)session.getAttribute("uid");%>
<%  



Connection con=databasecon.getconnection();
Statement st=con.createStatement();
Statement st2=con.createStatement();
Statement st3=con.createStatement();

String hashcode=request.getParameter("hashcode");

String fname=request.getParameter("fname");

String sql="select * from cloud where fhash='"+hashcode+"' ";
ResultSet r1=st.executeQuery(sql);
if(r1.next())
{
	
	System.out.println("File data  already exist");


String fileid=r1.getString(1);


	response.sendRedirect("duplication.jsp?fid="+fileid);
}
else{

response.sendRedirect("upload3.jsp?hashcode="+hashcode+"&fname="+fname+" ");

}
%>


<%@ include file="footer.jsp"%>