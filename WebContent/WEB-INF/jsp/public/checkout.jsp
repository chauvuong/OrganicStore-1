<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section class="how-overlay2 bg-img1" style="background-image: url('${pageContext.request.contextPath }/templates/public/images/post.jpg');">
		<div class="container">
			<div class="txt-center p-t-160 p-b-165">
				<h2 class="txt-l-101 cl0 txt-center p-b-14 respon1">
					Thanh toán
				</h2>

				<span class="txt-m-201 cl0 flex-c-m flex-w">
					<a href="${pageContext.request.contextPath }/" class="txt-m-201 cl0 hov-cl10 trans-04 m-r-6">
						Home
					</a>

					<span>
						/ Thanh toán
					</span>
				</span>
			</div>
		</div>
	</section>

	<!-- content page -->
	<div class="bg0 p-t-95 p-b-50">
		<div class="container">
			
							<c:choose>
							<c:when test="${userInfo != null}">
							
							</c:when>

							<c:otherwise>
		<div>
				<div class="txt-s-101 txt-center">
					<span class="cl3">
						
					</span>

					<span class="cl10 hov12 js-toggle-panel1">
						BẠN LÀ THÀNH VIÊN ?
					</span>
				</div>

				<div class="how-bor3 p-rl-15 p-tb-28 m-tb-33 dis-none js-panel1">
					<form class="size-w-60 m-rl-auto" method="post" action="${pageContext.request.contextPath}/login-member">
						<p class="txt-s-120 cl9 txt-center p-b-26">
							If you have shopped with us before, please enter your details in the boxes below. If you are a new customer, please proceed to the Billing & Shipping section.
						</p>

						<div class="row">
							<div class="col-sm-6 p-b-20">
								<div>
									<div class="txt-s-101 cl6 p-b-10">
										Email <span class="cl12">*</span>
									</div>

									<input class="txt-s-120 cl3 size-a-21 bo-all-1 bocl15 p-rl-15 focus1" required="required" placeholder="Email" type="text" name="email">
								</div>
							</div>

							<div class="col-sm-6 p-b-20">
								<div>
									<div class="txt-s-101 cl6 p-b-10">
										Password <span class="cl12">*</span>
									</div>

									<input class="txt-s-120 cl3 size-a-21 bo-all-1 bocl15 p-rl-15 focus1" required="required" placeholder="Mật khẩu" type="password" name="password">
								</div>
							</div>

							<div class="col-12">
								<button class="flex-c-m txt-s-105 cl0 bg10 size-a-21 hov-btn2 trans-04 p-rl-10">
									Đăng Nhập
								</button>

								<div class="flex-w flex-m p-t-10 p-b-3">
									<a href="${pageContext.request.contextPath}/register">
									<label for="check-creatacc" class="txt-s-101 cl9">
										Tạo Một Tài Khoản?
									</label>
									</a>
								</div>

								<!-- <a href="#" class="txt-s-101 cl9 hov-cl10 trans-04">
									Lost your password?
								</a> -->
							</div>
						</div>
					</form>
				</div>
			</div>
	</c:otherwise>
		</c:choose>
						
			
		<!-- 	<div class="p-t-17 p-b-70">
				<div class="txt-s-101 txt-center">
					<span class="cl3">
						voucher? 
					</span>

					<span class="cl10 hov12 js-toggle-panel1">
						Click here để nhập mã 
					</span>
				</div>

				<div class="m-t-35 dis-none js-panel1">
					<div class="size-w-60 flex-w m-rl-auto">
						<input class="bo-all-1 bocl15 focus1 size-a-37 txt-s-120 cl3 plh2 p-rl-20 w-full-sm" type="text" name="coupon" placeholder="Coupon code">
						<button class="bg10 size-a-36 txt-s-105 cl0 p-rl-15 trans-04 hov-btn2 mt-4 mt-sm-0 w-full-sm">
							Ap dụng voucher
						</button>
					</div>
				</div>
			</div> -->
 
			<div class="row">
				<div class="col-md-7 col-lg-8 p-b-50">
					<div>
						<h4 class="txt-m-124 cl3 p-b-28">
							Chi tiết đơn hàng
						</h4>
						
						<div class="row p-b-50">
							<div class="col-sm-6 p-b-23">
								<div>
									<div class="txt-s-101 cl6 p-b-10">
										Tên <span class="cl12">*</span>
									</div>

									<input class="txt-s-120 cl3 size-a-21 bo-all-1 bocl15 p-rl-20 type="text" <c:if test="${userInfo != null}"> value="${userInfo.fullname}"</c:if> name="first-name" placeholder="Nhập Tên Khách Hàng">
								</div>
							</div>

				

							

							<div class="col-12 p-b-23">
								<div>
									<div class="txt-s-101 cl6 p-b-10">
										Đại Chỉ <span class="cl12">*</span>
									</div>

									<input class="plh2 txt-s-120 cl3 size-a-21 bo-all-1 bocl15 p-rl-20 focus1 m-b-20" type="text" <c:if test="${userInfo != null}"> value="${userInfo.address}"</c:if> name="street" placeholder="Nhập Địa Chỉ">

									
								</div>
							</div>

						
							<div class="col-sm-6 p-b-23">
								<div>
									<div class="txt-s-101 cl6 p-b-10">
										Số Điện Thoại <span class="cl12">*</span>
									</div>

									<input class="txt-s-120 cl3 size-a-21 bo-all-1 bocl15 p-rl-20 focus1"  placeholder="Nhập Số Điện Thoại" <c:if test="${userInfo != null}"> value="${userInfo.phone}"</c:if> type="text" name="phone">
								</div>
							</div>

							<div class="col-sm-6 p-b-23">
								<div>
									<div class="txt-s-101 cl6 p-b-10">
										Email <span class="cl12">*</span>
									</div>

									<input class="txt-s-120 cl3 size-a-21 bo-all-1 bocl15 p-rl-20 focus1"  placeholder="Nhập Email" <c:if test="${userInfo != null}"> value="${userInfo.email}"</c:if> type="text" name="email">
								</div>
							</div>

							
						</div>

						<h4 class="txt-m-124 cl3 p-b-19">
							
						</h4>

						<div>
							<div class="txt-s-101 cl6 p-b-10">
								Ghi Chú Order
							</div>

							<textarea class="plh2 txt-s-120 cl3 size-a-38 bo-all-1 bocl15 p-rl-20 p-tb-10 focus1" name="note" placeholder="Ghi Chú Order Của Bạn "></textarea>
						</div>
					</div>
				</div>

				<div class="col-md-5 col-lg-4 p-b-50">
					<div class="how-bor4 p-t-35 p-b-40 p-rl-30 m-t-5">
						<h4 class="txt-m-124 cl3 p-b-11">
							Sản Shẩm Order
						</h4>

						<div class="flex-w flex-sb-m txt-m-103 cl6 bo-b-1 bocl15 p-b-21 p-t-18">
							<span>
								Sản Phẩm
							</span>

							<span>
								Tiền
							</span>
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
						<div class="flex-w flex-sb-m txt-s-101 cl6 bo-b-1 bocl15 p-b-21 p-t-18">
							<span>
								${name }
								<img class="m-rl-3" src="${pageContext.request.contextPath }/templates/public/images/icons/icon-multiply.png" alt="icon">
								${soluong}
							</span>

							<span>
								$${thanhtien}
							</span>
						</div>
						</c:forEach>
			

						<div class="flex-w flex-m txt-m-103 p-tb-23">
							<span class="size-w-61 cl6">
								Tổng Cộng:
							</span>

							<span class="size-w-62 cl10">
								$${tongtien }
							</span>
						</div>
						
						<div class="bo-all-1 bocl15 p-b-25 m-b-30">
							<div class="flex-w flex-m bo-b-1 bocl15 p-rl-20 p-tb-16">
								<input class="m-r-15" id="radio1" type="radio" name="pay" value="payment" checked="checked">
								<label class="txt-m-103 cl6" for="radio1">
									Thanh Toán Khi Nhận Hàng
								</label>
							</div>

							<div class="content-payment bo-b-1 bocl15 p-rl-20 p-tb-15">
								<p class="txt-s-120 cl9">
									Vui Lòng Nhập Đúng Địa Chỉ
								</p>
							</div>
							
							
							<div class="flex-w flex-m bo-b-1 bocl15 p-rl-20 p-tb-16">
								<input class="m-r-15" id="radio1" type="radio" name="pay" value="payment" checked="checked">
								<label class="txt-m-103 cl6" for="radio2">
									Thanh Toán Thông Qua Ngân Lượng
								</label>
							</div>

							<div class="content-payment bo-b-1 bocl15 p-rl-20 p-tb-15">
								<p class="txt-s-120 cl9">
									Vui Lòng Kiểm Tra Đúng Số Tiền
								</p>
							</div>

							<div class="flex-w flex-m p-rl-20 p-t-17 p-b-10">
								<input class="m-r-15" id="radio2" type="radio" name="pay" value="paypal">
								<label class="txt-m-103 cl6" for="radio3">
									Thanh Toán Thông Qua PayPal
								</label>

								<div class="w-full p-l-29 p-t-16">
									<a href="#"><img src="${pageContext.request.contextPath }/templates/public/images/icons/paypal.png" alt="IMG"></a>
								</div>
							</div>

							<div class="content-paypal bo-tb-1 bocl15 p-rl-20 p-tb-15 m-tb-10 dis-none">
								<p class="txt-s-120 cl9">
									Vui Lòng Kiểm Tra Đúng Số Tiền
								</p>
							</div>

							<div class="p-l-49">
								<a href="#" class="txt-s-120 cl6 hov-cl10 trans-04 p-t-10">
									What is paypal?
								</a>
							</div>								
						</div>

						<button class="flex-c-m txt-s-105 cl0 bg10 size-a-21 hov-btn2 trans-04 p-rl-10">
							Thanh toán
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>