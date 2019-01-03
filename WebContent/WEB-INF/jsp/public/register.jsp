<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section class="how-overlay2 bg-img1"
	style="background-image: url('${pageContext.request.contextPath }/templates/public/images/post.jpg');">
	<div class="container">
		<div class="txt-center p-t-160 p-b-165">
			<h2 class="txt-l-101 cl0 txt-center p-b-14 respon1">Đăng ký</h2>

			<span class="txt-m-201 cl0 flex-c-m flex-w"> <a
				href="${pageContext.request.contextPath }/"
				class="txt-m-201 cl0 hov-cl10 trans-04 m-r-6"> Home </a> <span>
					/ Đăng ký </span>
			</span>
		</div>
	</div>
</section>
<br />
<c:choose>
	<c:when test="${param['msg'] eq 'add' }">
		<center>
			<h4>
				<p style="color: red; font-family: cursive;">Email Đã Tồn Tại</p>
			</h4>
		</center>
	</c:when>
</c:choose>
<center>
	<h1 style="color: green; font-family: cursive;">${msg}</h1>
</center>
<!-- content page -->
<div class="bg0 p-t-10 p-b-5">
	<div class="container">
		<form enctype="multipart/form-data" method="post"
			action="${pageContext.request.contextPath}/addUser">
			<div style="margin: auto" class="col-md-6 p-b-50">
				<div class="p-l-15 p-rl-0-lg">
					<h4 class="txt-m-124 cl3 p-b-28">Đăng ký Tài Khoản</h4>

					<form class="how-bor3 p-rl-30 p-t-32 p-b-66">
						<div class="p-b-24">
							<div class="txt-s-101 cl6 p-b-10">
								Email <span class="cl12">*</span>
							</div>

							<input
								class="txt-s-120 cl3 size-a-21 bo-all-1 bocl15 p-rl-15 focus1"
								onchange="checkEmail(this.value)" value="" id="email"
								required="required" placeholder="Email" type="text" name="email">

							<div id="message"></div>

						</div>

						<div class="p-b-24">
							<div class="txt-s-101 cl6 p-b-10">
								Họ Và Tên <span class="cl12">*</span>
							</div>

							<input
								class="txt-s-120 cl3 size-a-21 bo-all-1 bocl15 p-rl-15 focus1"
								required="required" placeholder="Nhập Họ Và Tên" type="text"
								name="fullname">
						</div>

						<div class="p-b-24">
							<div class="txt-s-101 cl6 p-b-10">
								Số Điện Thoại <span class="cl12">*</span>
							</div>

							<input
								class="txt-s-120 cl3 size-a-21 bo-all-1 bocl15 p-rl-15 focus1"
								placeholder="Nhập Số Điện Thoại" required="required" type="text"
								name="phone">
						</div>

						<div class="p-b-24">
							<div class="txt-s-101 cl6 p-b-10">
								Password <span class="cl12">*</span>
							</div>

							<input
								class="txt-s-120 cl3 size-a-21 bo-all-1 bocl15 p-rl-15 focus1"
								required="required" placeholder="Nhập Password" type="password"
								name="password">
						</div>

						<div class="p-b-24">
							<div class="txt-s-101 cl6 p-b-10">
								Địa Chỉ <span class="cl12">*</span>
							</div>

							<input
								class="txt-s-120 cl3 size-a-21 bo-all-1 bocl15 p-rl-15 focus1"
								required="required" placeholder="Nhập Địa Chỉ" type="text"
								name="address">
						</div>



						<div class="flex-w flex-m p-t-5">
							<button
								class="flex-c-m txt-s-105 cl0 bg10 size-a-39 hov-btn2 trans-04 p-rl-10 m-r-18">
								Đăng ký</button>
						</div>
					</form>
				</div>
			</div>
		</form>
	</div>



	<script>
		function checkEmail(email) {
			//  $("#message").html("<img src='${pageContext.request.contextPath}/templates/admin/images/loader.gif' /> checking...");
					$.ajax({
						url : '${pageContext.request.contextPath}/checkemail',
						type : 'POST',
						cache : false, //True khi muon luu lai cac requet .
						data : {
							email : email,

						//Dữ liệu gửi đi
						},

						success : function(data) {

							if (data == 0) {
								$("#message")
										.html(
												"<img src='${pageContext.request.contextPath}/templates/admin/images/deactive.gif' /><span style=font-size:13px; color: red'> Username already taken</span>");
							} else {

								$("#message")
										.html(
												"<img src='${pageContext.request.contextPath}/templates/admin/images/active.gif' /><span style='font-size:13px; color: black'> Username available</span>");
							}

						},
						error : function() {
							alert('Có lỗi xảy ra');
						}
					});
			return false;
		}
	</script>


</div>
