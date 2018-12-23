<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section class="how-overlay2 bg-img1"
	style="background-image: url('${pageContext.request.contextPath }/templates/public/images/post.jpg');">
	<div class="container">
		<div class="txt-center p-t-160 p-b-165">
			<h2 class="txt-l-101 cl0 txt-center p-b-14 respon1">Thanh toán</h2>

			<span class="txt-m-201 cl0 flex-c-m flex-w"> <a
				href="${pageContext.request.contextPath }/"
				class="txt-m-201 cl0 hov-cl10 trans-04 m-r-6"> Home </a> <span>
					/ Thanh toán </span>
			</span>
		</div>
	</div>
</section>
<div class="bg0 p-t-95 p-b-50">
	<div class="container">

		<c:choose>
			<c:when test="${empty listCart}">
				<div
					class="bo-all-1 bocl15 flex-w flex-sb-m p-rl-30 p-tb-10 p-rl-15-ssm">
					<div class="flex-t p-tb-10 m-r-30">
						<img class="m-t-6 m-r-10"
							src="${pageContext.request.contextPath }/templates/public/images/icons/icon-list.png"
							alt="IMG"> <span class="size-w-53 txt-s-101 cl6">
							Chưa Có Sản Phẩm Nào Được Order. </span>
					</div>

					<a href="${pageContext.request.contextPath }/"
						class="flex-c-m txt-s-105 cl0 bg10 size-a-42 hov-btn2 trans-04 p-rl-10 m-tb-8">
						Mua Ngay </a>
				</div>
			</c:when>

			<c:otherwise>


				<form enctype="multipart/form-data" method="post"
					action="${pageContext.request.contextPath}/confirm">
					<div class="row">

						<div class="col-md-7 col-lg-8 p-b-50">

							<div>
								<h4 class="txt-m-124 cl3 p-b-28">Chi tiết đơn hàng</h4>

							

								<h4 class="txt-m-124 cl3 p-b-19"></h4>

								<div>
									<div class="txt-s-101 cl6 p-b-10">Ghi Chú Order</div>

									<textarea
										class="plh2 txt-s-120 cl3 size-a-38 bo-all-1 bocl15 p-rl-20 p-tb-10 focus1"
										name="note" placeholder="Ghi Chú Order Của Bạn "></textarea>
								</div>
							</div>
						</div>


						<div class="col-md-5 col-lg-4 p-b-50">
							<div class="how-bor4 p-t-35 p-b-40 p-rl-30 m-t-5">
								<h4 class="txt-m-124 cl3 p-b-11">Sản Shẩm Order</h4>

								<div
									class="flex-w flex-sb-m txt-m-103 cl6 bo-b-1 bocl15 p-b-21 p-t-18">
									<span> Sản Phẩm </span> <span> Tiền </span>
								</div>
								<c:forEach items="${listCart}" var="objCart">
									<c:set var="name" value="${objCart.name}"></c:set>
									<c:set var="id" value="${objCart.id_product}"></c:set>
									<c:set var="gia" value="${objCart.price}"></c:set>
									<c:set var="slug" value="${slugUtil.makeSlug(name)}"></c:set>
									<c:set var="soluong" value="${objCart.quatity}"></c:set>
									<c:set var="thanhtien" value="${soluong*gia}"></c:set>
									<c:set var="tongtien" value="${tongtien+thanhtien}"></c:set>
									<!--  -->
									<div
										class="flex-w flex-sb-m txt-s-101 cl6 bo-b-1 bocl15 p-b-21 p-t-18">
										<span> ${name } <img class="m-rl-3"
											src="${pageContext.request.contextPath }/templates/public/images/icons/icon-multiply.png"
											alt="icon"> ${soluong}
										</span> <span> $${thanhtien} </span>
									</div>
								</c:forEach>


								<div class="flex-w flex-m txt-m-103 p-tb-23">
									<span class="size-w-61 cl6"> Tổng Cộng: </span> <span
										class="size-w-62 cl10"> $${tongtien } </span>
								</div>

								<div class="bo-all-1 bocl15 p-b-25 m-b-30">


									<c:forEach items="${alPay }" var="objPay">
										<div class="flex-w flex-m bo-b-1 bocl15 p-rl-20 p-tb-16">
											<input class="m-r-15" id="radio" type="radio" name="pay"
												value="${objPay.id_pay }" checked="checked"> <label
												class="txt-m-103 cl6"> ${objPay.name } </label>
										</div>
									</c:forEach>

								</div>
								<button type="submit"
									class="flex-c-m txt-s-105 cl0 bg10 size-a-21 hov-btn2 trans-04 p-rl-10">
									Xác Nhận Đơn Hàng</button>
								<br /> <a href="javaScript:window.history.back();"><button
										class="flex-c-m txt-s-105 cl0 bg10 size-a-21 hov-btn2 trans-04 p-rl-10">
										Quay Lại</button></a>
							</div>
						</div>
					</div>
				</form>

			</c:otherwise>
		</c:choose>
	</div>
</div>
