<%@ page import="java.sql.*,databaseconnection.*"%>
<%	
		try{
		String unm=request.getParameter("uid");
		String pwd=request.getParameter("pwd");
		HttpSession ses=request.getSession();
	            Connection con=databasecon.getconnection();
				Statement st=con.createStatement();
				ResultSet rst=st.executeQuery("select *from register  where userid='"+unm+"' and passwrd='"+pwd+"'");
				if(rst.next()){
					ses.setAttribute("unm",unm);
				
					response.sendRedirect("userhome.jsp");	
				}
				else{
				response.sendRedirect("client.jsp?msg=failed");
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
			
			
%>