
<%@ page  import="java.sql.*" import="databaseconnection.*,CT.*"%>

<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane"%>

<%! String name,username,pasword,gen,doj,branch,dept,subdept,eid,cno,adrs,etype;
	int i=0,exp=0,q=0;
%>
<%
try{
Connection con = databasecon.getconnection();
Statement st=con.createStatement();

String filename=request.getParameter("fnm");
String hashcode=request.getParameter("hashcode");
Random r=new Random();
int rkey=r.nextInt(100000);

String ck=BlindSignature.generateSign(hashcode, new Integer(rkey).toString());

//out.println(ck);


Statement st1=con.createStatement();
int i =st1.executeUpdate("update temp set ck='"+ck+"' where filename='"+filename+"' ");
if(i>0){
st.executeUpdate("update request set status='finish' where  filename='"+filename+"' ");

	response.sendRedirect("viewreq.jsp?key=done");
}
}
catch(Exception e)
{
e.printStackTrace();
	}
%>
