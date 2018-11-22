<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section class="how-overlay2 bg-img1" style="background-image: url('${pageContext.request.contextPath }/templates/public/images/post.jpg');">
		<div class="container">
			<div class="txt-center p-t-160 p-b-165">
				<h2 class="txt-l-101 cl0 txt-center p-b-14 respon1">
					Đăng ký
				</h2>

				<span class="txt-m-201 cl0 flex-c-m flex-w">
					<a href="${pageContext.request.contextPath }/" class="txt-m-201 cl0 hov-cl10 trans-04 m-r-6">
						Home
					</a>

					<span>
						/ Đăng ký
					</span>
				</span>
			</div>
		</div>
	</section>
	<br />
	<center><h1 style="color: green; font-family: cursive; ">${msg}</h1></center>
	<!-- content page -->
	<div  class="bg0 p-t-95 p-b-50">
		<div class="container">
				<form enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/addUser">
				<div style="margin: auto" class="col-md-6 p-b-50">
					<div class="p-l-15 p-rl-0-lg">
						<h4 class="txt-m-124 cl3 p-b-28">
							Đăng ký Tài Khoản
						</h4>

						<form class="how-bor3 p-rl-30 p-t-32 p-b-66">
							<div class="p-b-24">
								<div class="txt-s-101 cl6 p-b-10">
									Email <span class="cl12">*</span>
								</div>

								<input class="txt-s-120 cl3 size-a-21 bo-all-1 bocl15 p-rl-15 focus1" required="required"  placeholder="Email" type="text" name="email">
							</div>
							<div class="p-b-24">
								<div class="txt-s-101 cl6 p-b-10">
									Họ Và Tên <span class="cl12">*</span>
								</div>

								<input class="txt-s-120 cl3 size-a-21 bo-all-1 bocl15 p-rl-15 focus1" required="required"  placeholder="Nhập Họ Và Tên" type="text" name="fullname">
							</div>
							
							<div class="p-b-24">
								<div class="txt-s-101 cl6 p-b-10">
									Số Điện Thoại <span class="cl12">*</span>
								</div>

								<input class="txt-s-120 cl3 size-a-21 bo-all-1 bocl15 p-rl-15 focus1"  placeholder="Nhập Số Điện Thoại" required="required" type="text" name="phone">
							</div>

							<div class="p-b-24">
								<div class="txt-s-101 cl6 p-b-10">
									Password <span class="cl12">*</span>
								</div>

								<input class="txt-s-120 cl3 size-a-21 bo-all-1 bocl15 p-rl-15 focus1" required="required"  placeholder="Nhập Password" type="text" name="password">
							</div>
							
							<div class="p-b-24">
								<div class="txt-s-101 cl6 p-b-10">
									Địa Chỉ <span class="cl12">*</span>
								</div>

								<input class="txt-s-120 cl3 size-a-21 bo-all-1 bocl15 p-rl-15 focus1" required="required"  placeholder="Nhập Địa Chỉ" type="text" name="address">
							</div>
							
							

							<div class="flex-w flex-m p-t-15">
								<button class="flex-c-m txt-s-105 cl0 bg10 size-a-39 hov-btn2 trans-04 p-rl-10 m-r-18">
									Đăng ký
								</button>
							</div>
						</form>
					</div>
				</div>
				</form>
		</div>
	</div>