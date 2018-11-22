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
						href="${pageContext.request.contextPath }/admin/user/add">Thêm
							Quản Trị</a></li>
				</ol>
			</div>
		</div>
		<c:choose>
			<c:when test="${param['msg'] eq 'add' }">
				<h4>
					<p style="color: red; font-family: cursive;">Tên Đăng Nhập Đã Tồn Tại</p>
				</h4>
			</c:when>
		</c:choose>
		<h4>
			<p style="color: red;">${msg}</p>
		</h4>
		<div class="row">

			<div class="col-lg-12">
				<section class="panel">
					<header class="panel-heading"> Thêm Tài Khoản </header>
					<div class="panel-body">
						<div class="form">
							<form action="${pageContext.request.contextPath }/admin/user/add"
								method="post" class="niceform">
								<div class="form-group">
									<label for="exampleInputEmail1">Tên Đăng Nhập:</label> <input
										type="text" class="form-control" name="username"
										id="exampleInputEmail1" placeholder="Nhập Tên Đăng Nhập" <c:if test="${user != null}"> value="${user.username}"</c:if> /> 
								
								</div>
								<p><form:errors path="user.username" cssStyle="color:red; font-family: cursive;"></form:errors></p>
								

								<div class="form-group">
									<label for="exampleInputEmail1">Họ Tên:</label> <input
										type="text" class="form-control" name="fullname"
										id="exampleInputEmail1" placeholder="Nhập Họ Tên" <c:if test="${user != null}"> value="${user.fullname}"</c:if>>

								</div>
								<p><form:errors path="user.fullname" cssStyle="color:red; font-family: cursive;"></form:errors></p>

								<div class="form-group">
									<label for="exampleInputEmail1">Số Điện Thoại:</label> <input
										type="text" class="form-control" name="phone"
										id="exampleInputEmail1" placeholder="Nhập SĐT" <c:if test="${user != null}"> value="${user.phone}"</c:if>>

								</div>
								<p><form:errors path="user.phone" cssStyle="color:red; font-family: cursive;"></form:errors></p>

								<div class="form-group">
									<label for="exampleInputEmail1">Địa Chỉ:</label> <input
										type="text" class="form-control" name="address"
										id="exampleInputEmail1" placeholder="Nhập Địa Chỉ" <c:if test="${user != null}"> value="${user.address}"</c:if>>

								</div>
								<p><form:errors path="user.address" cssStyle="color:red; font-family: cursive;"></form:errors></p>

								<div class="form-group">
									<label for="exampleInputEmail1">Password:</label> <input
										type="password" class="form-control" name="password"
										id="exampleInputEmail1" placeholder="Nhập Mật Khẩu" <c:if test="${user != null}"> value="${user.password}"</c:if>>

								</div>
								<p><form:errors path="user.password" cssStyle="color:red; font-family: cursive;"></form:errors></p>


								<div class="form-group">
									<label for="exampleInputEmail1">Quyền:</label> <select
										required="required" size="1" name="role_id"
										class="form-control m-bot15">
										<c:forEach items="${listRole }" var="objRole">
										<c:choose>
										<c:when test="${user ne null and user.role_id eq objRole.role_id}">
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

								<input type="submit" value="Thêm" class="btn btn-primary" /> <input
									type="reset" value="Nhập Lại" class="btn btn-danger" />
							</form>
						</div>
					</div>
				</section>
			</div>
		</div>
	</section>
</section>