<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section id="main-content">
	<section class="wrapper">
		<!--overview start-->
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> Thống Kê
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i><a href="${pageContext.request.contextPath}/admin">Home</a></li>
					<li><i class="fa fa-laptop"></i><a href="${pageContext.request.contextPath}/admin">Thống Kê</a></li>
				</ol>
			</div>
		</div>

		<div class="row">
			<a href="${pageContext.request.contextPath}/admin/member"><div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<div class="info-box blue-bg">
					<i class="fa fa-users"></i>
					<div class="count">${sumMember}</div>
					<div class="title">Thành Viên</div>
				</div>
				<!--/.info-box-->
			</div></a>
			<!--/.col-->

			<a href="${pageContext.request.contextPath}/admin/order"><div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<div class="info-box brown-bg">
					<i class="fa fa-shopping-cart"></i>
					<div class="count">${sumOrder}</div>
					<div class="title">Đơn Hàng</div>
				</div>
				<!--/.info-box-->
			</div></a>
			<!--/.col-->

			<a href="${pageContext.request.contextPath}/admin/cat"><div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<div class="info-box dark-bg">
					<i class="fa fa-list-ul"></i>
					<div class="count">${sumCat}</div>
					<div class="title">Danh Mục</div>
				</div>
				<!--/.info-box-->
			</div></a>
			<!--/.col-->

			<a href="${pageContext.request.contextPath}/admin/product"><div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<div class="info-box green-bg">
					<i class="fa fa-cubes"></i>
					<div class="count">${sumNews}</div>
					<div class="title">Sản Phẩm</div>
				</div>
				<!--/.info-box-->
			</div></a>
			<!--/.col-->

		</div>
		<!--/.row-->

	</section>

</section>