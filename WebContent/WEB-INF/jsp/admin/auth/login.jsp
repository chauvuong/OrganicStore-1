<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@include file="/templates/taglib.jsp"%>
<div class="container">
	<form class="login-form"
		action="${pageContext.request.contextPath }/login" method="post">

		<div class="login-wrap">

			<p class="login-img">
				<i class="icon_lock_alt"></i>
			</p>
			<c:if test="${param.error != null }">
				<p style="color: red; font-family: cursive;">Sai UserName Hoặc
					PassWord !</p>
			</c:if>
			<div class="input-group">

				<span class="input-group-addon"><i class="icon_profile"></i></span>

				<input type="text" class="form-control" name="username"
					placeholder="Username" autofocus>
			</div>
			<div class="input-group">
				<span class="input-group-addon"><i class="icon_key_alt"></i></span>
				<input type="password" name="password" class="form-control"
					placeholder="Password">
			</div>
			<label class="checkbox"> <input type="checkbox"
				name="remember-me"> Remember me <span class="pull-right">
					<a href="#"> Forgot Password?</a>
			</span>
			</label> <input class="btn btn-primary btn-lg btn-block" name="submit"
				id="submit" value="Login" type="submit" />
			<!--  <input class="btn btn-info btn-lg btn-block" type="submit" value="Signup" /> -->
		</div>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />

	</form>


	<div class="text-center">

		<%
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		%>
	</div>
</div>