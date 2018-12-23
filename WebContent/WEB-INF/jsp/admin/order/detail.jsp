<%@page import="dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> Chi Tiết Đơn Hàng
				</h3>
			
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i><a
						href="${pageContext.request.contextPath}/admin">Home</a></li>
					<li><i class="fa fa-laptop"></i><a
						href="${pageContext.request.contextPath }/admin/order">Đơn Hàng</a></li>
						<li><i class="fa fa-laptop"></i>
						<a
						href="javascript:void(0)">Chi Tiết Đơn Hàng</a></li>
					
				</ol>
			</div>
		</div>
		<h4>
			<p style="color: green;font-family: cursive;">${msg}</p>
		</h4>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<table class="table table-striped table-advance table-hover">
						<tbody>
							<tr>
								<th><i class="icon_pin_alt"></i> ID Đơn Hàng</th>
								<th><i class="icon_profile"></i> Sản Phẩm</th>
								<th><i class="icon_profile"></i> Số Lượng</th>
								<th><i class="icon_profile"></i> Đơn Giá</th>
								<th><i class="icon_mobile"></i> Thành tiền</th>
							</tr>

								<c:set var="tong"></c:set>
								<c:forEach items="${listDetail}" var="objDetail">
								<c:set var="sanpham" value="${objDetail.name}"></c:set>
								<c:set var="soluong" value="${objDetail.quatity}"></c:set>
								<c:set var="dongia" value="${objDetail.price}"></c:set>
								<c:set var="thanhtien" value="${dongia*soluong}"></c:set>
								<c:set var="tong" value="${tong+thanhtien}"></c:set>
									<tr>
										<td>${objDetail.id_order}</td>
										<td>${sanpham}</td>
										<td>${soluong}</td>
										<td>$${dongia }</td>
										<td>$${thanhtien }</td>
									</tr>
								</c:forEach>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td><b>Tổng Cộng:</b></td>
									<td style="color:red">$${tong} (USD)</td>
								</tr>
								
		</tbody>
			</table>
					
				</section>
z
			</div>
		</div>
	</section>
</section>