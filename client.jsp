<%@include file="header.jsp"%>

<% if(request.getParameter("msg")!=null){
	  out.println("<script>alert('Login fail')</script>");
}
if(request.getParameter("msg2")!=null){
	  out.println("<script>alert('Register Successfully,Login Here.')</script>");
}

%>
<div class="breadcrumb-agile py-1">
		<ol class="breadcrumb m-0">
			<li class="breadcrumb-item">
				<a href="">Client Login</a>
			</li>
			<li class="breadcrumb-item active" aria-current="page"></li>
		</ol>
	</div>
	<section class="logins py-5">
		<div class="container py-xl-5 py-lg-3">
			<div class="title-section mb-md-5 mb-4">
				<h3 class="w3ls-title text-uppercase text-dark font-weight-bold">Client Login </h3>
			</div>
			<div class="login px-sm-4 mx-auto mw-100 login-wrapper">
				<form class="login-wrapper" action="loginchk.jsp" method="post">
					<div class="form-group">
						<label>User Name</label>
						<input type="text" class="form-control" name="uid" placeholder="" required="">
						
					</div>
					<div class="form-group">
						<label>Password</label>
						<input type="password" class="form-control" name="pwd" placeholder="" required="">
					</div>
					<button type="submit" class="btn submit mt-4">Login</button>
					<p class="text-center mt-5">
						<a href="clientreg.jsp"> Don't have an Account?</a>
					</p>
				</form>
			</div>
		</div>
	</section>
	<!-- //login -->

	
<%@include file="footer.jsp"%>