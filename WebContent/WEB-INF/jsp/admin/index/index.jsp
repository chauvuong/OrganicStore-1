<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section id="main-content">
	<section class="wrapper">
		<!--overview start-->
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> Thống Kê
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i><a
						href="${pageContext.request.contextPath}/admin">Home</a></li>
					<li><i class="fa fa-laptop"></i><a
						href="${pageContext.request.contextPath}/admin">Thống Kê</a></li>
				</ol>
			</div>
		</div>

		<div class="row">
			<a href="${pageContext.request.contextPath}/admin/member"><div
					class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box blue-bg">
						<i class="fa fa-users"></i>
						<div class="count">${sumMember}</div>
						<div class="title">Thành Viên</div>
					</div>
					<!--/.info-box-->
				</div></a>
			<!--/.col-->

			<a href="${pageContext.request.contextPath}/admin/order"><div
					class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box brown-bg">
						<i class="fa fa-shopping-cart"></i>


						<c:choose>
							<c:when test="${empty sumOrder}">
								<div class="count">0</div>
								<div class="title">Đơn Hàng</div>
							</c:when>

							<c:otherwise>
								<div class="count">${sumOrder}</div>
								<div class="title">Đơn Hàng</div>
							</c:otherwise>
						</c:choose>



					</div>
					<!--/.info-box-->
				</div></a>
			<!--/.col-->

			<a href="${pageContext.request.contextPath}/admin/cat"><div
					class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box dark-bg">
						<i class="fa fa-list-ul"></i>
						<div class="count">${sumCat}</div>
						<div class="title">Danh Mục</div>
					</div>
					<!--/.info-box-->
				</div></a>
			<!--/.col-->

			<a href="${pageContext.request.contextPath}/admin/product"><div
					class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box green-bg">
						<i class="fa fa-cubes"></i>
						<div class="count">${sumNews}</div>
						<div class="title">Sản Phẩm</div>
					</div>
					<!--/.info-box-->
				</div></a> <a href="${pageContext.request.contextPath}/admin/contact"><div
					class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box red-bg">
						<i class="fa fa-list-ul"></i>
						<div class="count">${sumContact}</div>
						<div class="title">Liên Hệ</div>
					</div>
					<!--/.info-box-->
				</div></a> <a href="${pageContext.request.contextPath}/admin/user"><div
					class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box pink-bg">
						<i class="fa fa-user"></i>
						<div class="count">${sumAdmin}</div>
						<div class="title">Quản Trị</div>
					</div>
					<!--/.info-box-->
				</div></a> <a href="${pageContext.request.contextPath}/admin/comment"><div
					class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box blue-bg">
						<i class="fa fa-comments"></i>
						<c:choose>
							<c:when test="${empty sumComment}">
								<div class="count">0</div>
								<div class="title">Bình Luận</div>
							</c:when>

							<c:otherwise>
								<div class="count">${sumComment}</div>
								<div class="title">Bình Luận</div>
							</c:otherwise>
						</c:choose>

					</div>
					<!--/.info-box-->
				</div></a> <a href="${pageContext.request.contextPath}/admin/payment"><div
					class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box yellow-bg">
						<i class="fa fa-credit-card"></i>
						<div class="count">${sumPay}</div>
						<div class="title">Hình Thức Thanh Toán</div>
					</div>
					<!--/.info-box-->
				</div></a>
			<!--/.col-->

		</div>
		<!--/.row-->

	</section>

</section>