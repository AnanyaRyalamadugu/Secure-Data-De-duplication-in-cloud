<%@include file="header.jsp"%>
<%
if(request.getParameter("msg")!=null){

out.println("<script>alert('Registered Successfully')</script>");
}
if(request.getParameter("msg3")!=null){
	  out.println("<script>alert('User Id already Available')</script>");
}

%>
<div class="breadcrumb-agile py-1">
		<ol class="breadcrumb m-0">
			<li class="breadcrumb-item">
				<a href="">Client Registration</a>
			</li>
			<li class="breadcrumb-item active" aria-current="page"></li>
		</ol>
	</div>
<section class="logins py-5">
		<div class="container py-xl-5 py-lg-3">
			<div class="title-section mb-md-5 mb-4">
				<h6 class="w3ls-title-sub"></h6>
				<h3 class="w3ls-title text-uppercase text-dark font-weight-bold">Client Registration</h3>
			</div>
			<div class="login px-sm-4 mx-auto mw-100 login-wrapper">
				<form class="login-wrapper" action="clientreg2.jsp" method="post">


				<div class="form-group">
						<label>Name</label>
						<input type="text" class="form-control" name="name" placeholder="" required="">
					</div>
					
					<div class="form-group">
						<label>User ID</label>
						<input type="text" class="form-control" name="uid" placeholder="" required="">
					</div>
						<div class="form-group">
						<label class="mb-2">Password</label>
						<input type="password" class="form-control" name="pwd"  placeholder="" required="">
					</div>

					<div class="form-group">
						<label>Contact</label>
						<input type="text" pattern="[0-9]{10,10}" class="form-control" name="cn" placeholder="" required="">
					</div>
				
					
					<div class="form-group">
						<label>Email</label>
						<input type="email" class="form-control" name="em" placeholder="" required="">
					</div>
					
					<button type="submit" class="btn submit mt-4">Register</button>
					<p class="text-center mt-5">
						
					</p>
				</form>
			</div>
		</div>
	</section>
<%@include file="footer.jsp"%>