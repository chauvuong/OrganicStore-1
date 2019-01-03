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
						href="${pageContext.request.contextPath }/admin/payment/edit">Sửa
							Hình Thức Thanh Toán</a></li>
				</ol>
			</div>
		</div>
		<c:choose>
			<c:when test="${param['msg'] eq 'edit' }">
				<h4>
					<p style="color: red; font-family: cursive;">Phương Thức Thanh
						Toán Đã Tồn Tại</p>
				</h4>
			</c:when>
		</c:choose>
		<h4>
			<p style="color: red; font-family: cursive;">${msg}</p>
		</h4>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<header class="panel-heading"> Sửa Hình Thức Thanh Toán </header>
					<div class="panel-body">
						<div class="form">
							<form
								action="${pageContext.request.contextPath }/admin/payment/edit/${objPay.id_pay}"
								method="post" class="niceform">
								<div class="form-group">
									<label for="exampleInputEmail1">Phương Thức Thanh Toán</label>
									<input type="text" class="form-control" name="name"
										<c:if test="${objPay != null}"> value="${objPay.name}"</c:if>
										id="exampleInputEmail1"
										value="<c:if test="${objPay.name ne null}">${objPay.name}</c:if>"
										placeholder="Nhập Phương Thức Thanh Toán"
										value="<c:if test="${objPay.name ne null}">${objPay.name}</c:if>">

								</div>
								<p>
									<form:errors path="objPay.name"
										cssStyle="color:red; font-family: cursive;"></form:errors>
								</p>
								<input type="submit" value="Lưu" id="submit" name="submit"
									class="btn btn-primary" /> <input type="reset"
									value="Nhập Lại" id="submit" class="btn btn-danger" />
							</form>
						</div>
					</div>
				</section>
			</div>
		</div>
	</section>
</section>