  <%@ include file="uheader.jsp"%>
<%@ page import ="java.sql.*"%>
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>CP-ABE</title>
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->

</head>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>
<%! int rno=0;
String s=null;StringBuffer filedata=null;%>
<%

String unm=(String)session.getAttribute("unm");


	 Connection con=databasecon.getconnection();
Statement st=con.createStatement();
Statement st1=con.createStatement();

String ck=request.getParameter("ck");
ResultSet r1=st1.executeQuery("select  *from temp ");
if(r1.next())
	{

 PreparedStatement p=con.prepareStatement("insert into cloud(fname,encfile,fhash,signcode,fdate,owner) values(?,AES_ENCRYPT(?,'"+ck+"'),?,?,now(),?)");
p.setString(1,r1.getString(1));
p.setBytes(2,r1.getBytes(2));
p.setString(3,r1.getString(3));
p.setString(4,ck);
p.setString(5,unm);
p.executeUpdate();

 %>
<%!String  thisLine = null;
StringBuffer sb1=null;
String filename=null,unm=null,fid=null,fnm=null,pkey=null;
int i=0;
byte data[]=null;
%>
<% 
String hashcode=r1.getString(3);
ResultSet r=st.executeQuery("select *from cloud where fhash='"+hashcode+"' ");
if(r.next())
	{
data=r.getBytes(3);
	
%>

<section class="logins py-5">
		<div class="container py-xl-5 py-lg-3">
			<div class="title-section mb-md-5 mb-4">
				<h6 class="w3ls-title-sub"></h6>
				<h3 class="w3ls-title text-uppercase text-dark font-weight-bold">File Uploading</h3>
			    </div>
				</div>
				<div class="login px-sm-4 mx-auto mw-100 login-wrapper">
				<form class="login-wrapper"action="fileupload.jsp?upload=done" method="post" id="demoForm">
                <div class="form-group">
						<label>File ID</label>
						<input type="text" class="form-control"name=""  value=<%=r.getInt(1)%> placeholder="" required="">
                        
					</div>
					<div class="form-group">
						<label>FileName</label>
						<input type="text" class="form-control"name="fnm" value=<%=r.getString(2)%> placeholder="" required="">
                        
					</div>
					
					
					<div class="form-group">
						<label>EncryptedData</label><br>
						<textarea name="file" cols=60 rows=10 readonly><%=data%></textarea>
                        
					</div>


    
	 
     
	
	                      <button type="submit" class="btn submit mt-4">Upload</button>
						</form>
			      </div>
		</div>
	</section>
		<%
	}
	}%>

<%@ include file="footer.jsp"%>