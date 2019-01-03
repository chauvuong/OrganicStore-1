<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<!-- Title page -->
<section class="how-overlay2 bg-img1"
	style="background-image: url('${pageContext.request.contextPath }/templates/public/images/post.jpg');">
	<div class="container">
		<div class="txt-center p-t-160 p-b-165">
			<h2 class="txt-l-101 cl0 txt-center p-b-14 respon1">Sản phẩm yêu
				thích</h2>

			<span class="txt-m-201 cl0 flex-c-m flex-w"> <a
				href="home.htm" class="txt-m-201 cl0 hov-cl10 trans-04 m-r-6">
					Home </a> <span> / Wishlist </span>
			</span>
		</div>
	</div>
</section>

<!-- content page -->
<div class="bg0 p-t-100 p-b-80">
	<div class="container">

		<c:choose>
			<c:when test="${empty wishList}">
				<div
					class="bo-all-1 bocl15 flex-w flex-sb-m p-rl-30 p-tb-10 p-rl-15-ssm">
					<div class="flex-t p-tb-10 m-r-30">
						<img class="m-t-6 m-r-10"
							src="${pageContext.request.contextPath }/templates/public/images/icons/icon-list.png"
							alt="IMG"> <span class="size-w-53 txt-s-101 cl6">
							Chưa Có Sản Phẩm Yêu Thích. </span>
					</div>

					<a href="${pageContext.request.contextPath }/"
						class="flex-c-m txt-s-105 cl0 bg10 size-a-42 hov-btn2 trans-04 p-rl-10 m-tb-8">
						Trang Chủ </a>
				</div>
			</c:when>

			<c:otherwise>
				<div class="wrap-table-shopping-cart rs1-table">
					<table class="table-shopping-cart">
						<tr class="table_head bg12">
							<th class="column-1 p-l-30">Tên sản phẩm</th>
							<th class="column-4">Giá</th>
							<th class="column-2">Thông tin</th>
							<th class="column-4">Thêm vào giỏ</th>
						</tr>
						<c:forEach var="objProduct" items="${wishList}">
							<tr class="table_row">
								<td class="column-1">
									<div class="flex-w flex-m">
										<div class="wrap-pic-w size-w-50 bo-all-1 bocl12 m-r-30">
											<img
												src="${pageContext.request.contextPath }/files/${objProduct.picture}"
												alt="IMG">
										</div>

										<span> ${objProduct.name} </span>
									</div>
								</td>
								<td class="column-4">${objProduct.price}</td>
								<td class="column-2">
									<div class="flex-t">
										<span class="size-w-53 txt-m-104 cl6">
											${objProduct.preview} </span>
									</div>
								</td>
								<td class="column-4">
									<div class="flex-w flex-sb-m">
										<a href="javascript:void(0)"
											onclick="sanpham(${objProduct.id_product})"
											class="flex-c-m txt-s-103 cl6 size-a-2 how-btn1 bo-all-1 bocl11 hov-btn1 trans-04">
											Thêm <span class="lnr lnr-chevron-right m-l-7"></span> <span
											class="lnr lnr-chevron-right"></span>
										</a>

										<div class="fs-15 hov-cl10 pointer">
											<span onclick="delwish(${objProduct.id_product})"
												class="lnr lnr-cross"></span>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>


				<div class="flex-w flex-sb-m p-t-30">
					<div class="flex-w flex-m m-r-50 m-tb-10">
						<a href="${pageContext.request.contextPath }/wishlist"
							onclick="dellAll()"
							class="flex-c-m txt-s-103 cl6 size-h-9 how-btn1 bo-all-1 bocl11 hov-btn1 trans-04 pointer p-rl-29 m-tb-10 m-r-30">
							Xóa tất cả</a>
					</div>

					<a href="${pageContext.request.contextPath }/"
						class="flex-c-m txt-s-103 cl0 bg10 size-h-9 hov-btn2 trans-04 pointer p-rl-29 m-tb-10">
						Tiếp tục mua hàng </a>
				</div>
			</c:otherwise>

		</c:choose>
	</div>
</div>
<script>
function dellAll(){
	$.ajax({
		url:"${pageContext.request.contextPath}/dellAll",
		type: 'POST',
		cache: false,
		error: function (){
			alert('Xóa Thất Bại!!!')
		}
	});	
}
function sanpham(id){
	$.ajax({
		url:"${pageContext.request.contextPath}/cart",
		type: 'POST',
		cache: false,
		data: {
			aid_sp:id,			
		},
		success: function(data){
			alert('Đã thêm vào giỏ hàng!');
			$("#content_shop_cart").html(data);
		},
		error: function (){
			alert('Thêm Giỏ Hàng Thất Bại!!!')
		}
	});	
}
function delwish(id){
	$.ajax({
		url:"${pageContext.request.contextPath}/delwish",
		type: 'POST',
		cache: false,
		data: {
			aid_sp:id,			
		},
		success: function(data){
			$(".table-shopping-cart").html(data);
		},
		error: function (){
			alert('Xóa Thất Bại!!!')
		}
	});	
}
</script>