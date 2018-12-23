<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> Cấp Bậc
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i><a
						href="${pageContext.request.contextPath}/admin">Home</a></li>
					<li><i class="fa fa-laptop"></i><a
						href="${pageContext.request.contextPath }/admin/role">Cấp Bậc</a></li>
					<li><i class="fa fa-laptop"></i><a
						href="${pageContext.request.contextPath }/admin/role/edit">Sửa
							Cấp Bậc</a></li>
				</ol>
			</div>
		</div>
		<c:choose>
			<c:when test="${param['msg'] eq 'add' }">
				<h4>
					<p style="color: red;font-family: cursive;">Cấp Bậc Đã Tồn Tại</p>
				</h4>
			</c:when>
		</c:choose>
		<h4>
			<p style="color: red;font-family: cursive;">${msg}</p>
		</h4>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<header class="panel-heading"> Sửa Phân Quyền </header>
					<div class="panel-body">
						<div class="form">
							<form
								action="${pageContext.request.contextPath }/admin/role/edit/${objRole.role_id}"
								method="post" class="niceform">
								<div class="form-group">
									<label for="exampleInputEmail1">Tên Danh Mục</label> <input
										type="text" class="form-control" name="name" <c:if test="${objRole != null}"> value="${objRole.name}"</c:if>
										value="<c:if test="${objRole.name ne null}">${objRole.name}</c:if>"
										id="exampleInputEmail1" placeholder="Tên Quyền">

								</div>
								<p><form:errors path="objRole.name" cssStyle="color:red; font-family: cursive;"></form:errors></p>
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
