<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section id="main-content">
	<section class="wrapper">

		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> Hình Thức Thanh Toán
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i><a
						href="${pageContext.request.contextPath }/admin/">Home</a></li>
					<li><i class="fa fa-laptop"></i><a
						href="${pageContext.request.contextPath }/admin/payment">Hình
							Thức Thanh Toán</a></li>
					<li><i class="fa fa-laptop"></i><a
						href="${pageContext.request.contextPath }/admin/payment/add">Thêm
							Hình Thức Thanh Toán</a></li>
				</ol>
			</div>
		</div>
		<c:choose>
			<c:when test="${param['msg'] eq 'add' }">
				<h4>
					<p style="color: red;font-family: cursive;">Phương Thức Thanh Toán Đã Tồn Tại</p>
				</h4>
			</c:when>
		</c:choose>
		<h4>
			<p style="color: red;font-family: cursive;">${msg}</p>
		</h4>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<header class="panel-heading"> Thêm Hình Thức Thanh Toán </header>
					<div class="panel-body">
						<div class="form">
							<form
								action="${pageContext.request.contextPath }/admin/payment/add"
								method="post" class="niceform">
								<div class="form-group">
									<label for="exampleInputEmail1">Phương Thức Thanh Toán</label>
									<input type="text" class="form-control" name="name"
										id="exampleInputEmail1"
										placeholder="Nhập Phương Thức Thanh Toán">

								</div>
								<p><form:errors path="pay.name" cssStyle="color:red; font-family: cursive;"></form:errors></p>

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