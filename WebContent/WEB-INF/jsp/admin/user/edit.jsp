<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> Quản Trị
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i><a
						href="${pageContext.request.contextPath}/admin">Home</a></li>
					<li><i class="fa fa-laptop"></i><a
						href="${pageContext.request.contextPath }/admin/user">Quản Trị</a></li>
					<li><i class="fa fa-laptop"></i><a
						href="${pageContext.request.contextPath }/admin/user/edit">Sửa
							Quản Trị</a></li>
				</ol>
			</div>
		</div>
		<c:choose>
			<c:when test="${param['msg'] eq 'edit' }">
				<h4>
					<p style="color: red; font-family: cursive;">Tên Đăng Nhập Đã
						Tồn Tại</p>
				</h4>
			</c:when>
		</c:choose>
		<h4>
			<p style="color: red; font-family: cursive;">${msg}</p>
		</h4>
		<div class="row">

			<div class="col-lg-12">
				<section class="panel">
					<header class="panel-heading"> Sửa Tài Khoản </header>
					<div class="panel-body">
						<div class="form">
							<form
								action="${pageContext.request.contextPath}/admin/user/edit/${objUser.id_user}"
								method="post" class="niceform">
								<div class="form-group">
									<label for="exampleInputEmail1">Tên Đăng Nhập:</label> <input
										type="text" class="form-control" name="username"
										value="<c:if test="${objUser.username ne null}">${objUser.username}</c:if>"
										id="exampleInputEmail1" placeholder="Nhập Tên Đăng Nhập"
										<c:if test="${objUser != null}"> value="${objUser.username}"</c:if> />
								</div>
								<p>
									<form:errors path="objUser.username"
										cssStyle="color:red; font-family: cursive;"></form:errors>
								</p>

								<div class="form-group">
									<label for="exampleInputEmail1">Họ Tên:</label> <input
										type="text" class="form-control" name="fullname"
										value="<c:if test="${objUser.fullname ne null}">${objUser.fullname}</c:if>"
										id="exampleInputEmail1" placeholder="Nhập Họ Tên">

								</div>
								<p>
									<form:errors path="objUser.fullname"
										cssStyle="color:red; font-family: cursive;"></form:errors>
								</p>

								<div class="form-group">
									<label for="exampleInputEmail1">Số Điện Thoại:</label> <input
										type="text" class="form-control" name="phone"
										value="<c:if test="${objUser.phone ne null}">${objUser.phone}</c:if>"
										id="exampleInputEmail1" placeholder="Nhập SĐT">

								</div>
								<p>
									<form:errors path="objUser.phone"
										cssStyle="color:red; font-family: cursive;"></form:errors>
								</p>

								<div class="form-group">
									<label for="exampleInputEmail1">Địa Chỉ:</label> <input
										type="text" class="form-control" name="address"
										value="<c:if test="${objUser.address ne null}">${objUser.address}</c:if>"
										id="exampleInputEmail1" placeholder="Nhập Địa Chỉ">

								</div>
								<p>
									<form:errors path="objUser.address"
										cssStyle="color:red; font-family: cursive;"></form:errors>
								</p>

								<div class="form-group">
									<label for="exampleInputEmail1">Password:</label> <input
										type="password" class="form-control" name="password"
										id="exampleInputEmail1" placeholder="Nhập Mật Khẩu">

								</div>


								<c:choose>
									<c:when test="${'admin' == objUser.username}">
										<div class="form-group">
											<label for="exampleInputEmail1">Quyền:</label> <select
												required="required" size="1" name="role_id"
												class="form-control m-bot15">
												<c:forEach items="${listRole }" var="objRole">
													<c:choose>
														<c:when test="${objUser.role_id  eq objRole.role_id}">
															<c:set var="acti" value="selected = 'selected' "></c:set>
														</c:when>
														<c:otherwise>
															<c:set var="acti" value=""></c:set>
														</c:otherwise>
													</c:choose>
													<option ${acti} value="${objRole.role_id}">${objRole.name}</option>
												</c:forEach>
											</select>
										</div>
									</c:when>
									<c:otherwise>
										<div class="form-group">
											<label for="exampleInputEmail1">Quyền:</label> <select
												required="required" size="1" name="role_id"
												class="form-control m-bot15">


												<c:forEach items="${listRole }" var="objRole">
													<c:choose>
														<c:when test="${objUser.role_id  eq objRole.role_id}">
															<c:set var="acti" value="selected = 'selected' "></c:set>
														</c:when>
														<c:otherwise>
															<c:set var="acti" value=""></c:set>
														</c:otherwise>
													</c:choose>

													<option ${acti} value="${objRole.role_id}">${objRole.name}</option>
												</c:forEach>
											</select>
										</div>
									</c:otherwise>
								</c:choose>

								<input type="submit" value="Lưu" class="btn btn-primary" /> <input
									type="reset" value="Nhập Lại" class="btn btn-danger" />
							</form>
						</div>
					</div>
				</section>
			</div>
		</div>
	</section>
</section>