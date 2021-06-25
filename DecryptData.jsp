  <%@ include file="uheader.jsp"%>
 
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*,cp_abe.*"%>
<%@ page import="java.sql.*"%>
<%! String aKey=null;
boolean status;%>
<% String fid=request.getParameter("fid");
Connection con1=databasecon.getconnection();Statement st2=con1.createStatement();
%>


<%!String  thisLine = null;
StringBuffer sb1=null;
String filename=null,b,d,sd,exp,unm=null,fid=null,fnm=null,skey=null,akey=null,aces=null,pkey=null,symkey;
int i=0;byte data[]=null,sky[]=null;
%>
 <%
		

Connection con=databasecon.getconnection();
Statement st=con.createStatement();Statement st1=con.createStatement();

fid=request.getParameter("fid");
String ck=request.getParameter("ck");
String fnm=request.getParameter("fname");
PreparedStatement p=con.prepareStatement("select AES_DECRYPT(encfile,'"+ck+"') from cloud where fid="+fid+" ");
ResultSet rr=p.executeQuery();
if(rr.next()){
	
	data=rr.getBytes(1);
	status=false;
}
%>
<br>
<section class="logins py-5">
		<div class="container py-xl-5 py-lg-3">
			<div class="title-section mb-md-5 mb-4">
				<h6 class="w3ls-title-sub"></h6>
				<h3 class="w3ls-title text-uppercase text-dark font-weight-bold">File Decrypting</h3>
			            </div>
				</div>  
                </div> 
				
				   <form name="f1" action="finaldownload.jsp" method="post" class="login-wrapper">
					<div class="form-group">
                              <label >File Id</label>
                            <input  placeholder="" name="fid"class="form-control" value=<%=fid%> type="text" required=""><input type="hidden" name="ck" value=<%=ck%>>
							
                        </div>	
						
                       	
						<div class="form-group">
                            <label >File Name</label>
                            <input  placeholder="  " name="fname"class="form-control" value=<%=fnm%>  readonly type="text">
                        </div>	
							<div class="form-group">
                            <label>FileData</label>
                            <textarea  placeholder=" " name="file"  class="form-control"required type="text" required=""><%=data%></textarea>
                        </div>	
								
						<div class="form-group">
                        <br>
                        <input type="submit" value="Download">
                       
                     </form>
			</div>
		</div>
	</section>
		
		<br>






<%@ include file="footer.jsp"%>