<%@ include file="uheader.jsp"%>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*,CT.*"%>
<%@ page import="java.sql.*"%>


<%!String  hashcode = null;
StringBuffer sb1=null;
String filename=null,unm=null,fid=null,fnm=null;
int i=0;
%>
 <% 
	

try{


 fid=request.getParameter("fid");
unm=(String)session.getAttribute("unm");




%>
<section class="logins py-5">
		<div class="container py-xl-5 py-lg-3">
			<div class="title-section mb-md-5 mb-4">
				<h6 class="w3ls-title-sub"></h6>
				<h3 class="w3ls-title text-uppercase text-dark font-weight-bold">Proof of Ownership</h3>
			</div>
			</div>
			<div class="login px-sm-4 mx-auto mw-100 login-wrapper">
				<form class="login-wrapper" name="f1"  action="pow.jsp" method="post" id="demoForm">
               
                    <div class="form-group">
						<label>User ID</label><input type="hidden" name="fid" value=<%=fid%>>
						<input type="text" class="form-control"name="uid" value=<%=unm%>  placeholder="" required="">
                         
					</div>
				
     
	
	                      <button type="submit" class="btn submit mt-4">Get Challenge Value</button>
						</form>
			      </div>
		</div>
	</section>
                  

              <%
			  

			  
			  }catch(Exception e11)
{
e11.printStackTrace();
}
%>        
                      
						

		<br><br><br>
		
	<%@ include file="footer.jsp"%>
	