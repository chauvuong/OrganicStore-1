<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section class="how-overlay2 bg-img1"
	style="background-image:  url('${pageContext.request.contextPath }/templates/public/images/post.jpg');">
	<div class="container">
		<div class="txt-center p-t-160 p-b-165">
			<h2 class="txt-l-101 cl0 txt-center p-b-14 respon1">LIÊN HỆ</h2>

			<span class="txt-m-201 cl0 flex-c-m flex-w"> <a
				href="${pageContext.request.contextPath }/"
				class="txt-m-201 cl0 hov-cl10 trans-04 m-r-6"> Home </a> <span>
					/ Contact </span>
			</span>
		</div>
	</div>
</section>
<br />
<center>
	<h1 style="color: green; font-family: cursive;">${msg}</h1>
</center>
<!-- Form Contact -->
<section class="container bg0 p-t-5 p-b-30">
	<div class="row">
		<div class="col-sm-10 col-md-6 col-lg-5 m-rl-auto p-b-10">
			<div class="h-full how5 m-r--30 m-r-0-lg m-l-15-xl">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3833.8064418392196!2d108.15146261430685!3d16.0755309435403!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x714561e9f3a7292c!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBCw6FjaCBLaG9hIC0gxJDhuqFpIGjhu41jIMSQw6AgTuG6tW5n!5e0!3m2!1svi!2s!4v1545357941109"
					width="490" height="800" frameborder="0" style="border: 0"
					allowfullscreen></iframe>

			</div>

		</div>

		<div class="col-sm-10 col-md-6 col-lg-7 m-rl-auto p-b-10">
			<div class="p-t-75 p-l-70 p-rl-0-lg">
				<div class="size-a-1 flex-col-l p-b-20">
					<div class="txt-m-201 cl10 how-pos1-parent m-b-14">
						<span style="font-size: 50px">Liên Hệ Với Chúng Tôi</span>

						<ul>
							<li class="txt-s-101 cl6 flex-t p-b-10"><span
								class="size-w-13">
							</span> <span class="size-w-12 p-t-1" style="color: red; font-size: 20px;">CÔNG TY TNHH ORGANIC STORE </span></li>
							<li class="txt-s-101 cl6 flex-t p-b-10"><span
								class="size-w-11"> <img
									src="${pageContext.request.contextPath }/templates/public/images/icons/icon-mail.png"
									alt="ICON-MAIL">
							</span> <span class="size-w-12 p-t-1"> OrganicStore@gmail.com </span></li>



							<li class="txt-s-101 cl6 flex-t p-b-10"><span
								class="size-w-11"> <img
									src="${pageContext.request.contextPath }/templates/public/images/icons/icon-pin.png"
									alt="ICON-MAIL">
							</span> <span class="size-w-12 p-t-1"> 54 Nguyễn Lương Bằng, Hoà
									Khánh Bắc, Liên Chiểu, Đà Nẵng </span></li>

							<li class="txt-s-101 cl6 flex-t p-b-10"><span
								class="size-w-11"> <img
									src="${pageContext.request.contextPath }/templates/public/images/icons/icon-phone.png"
									alt="ICON-MAIL">
							</span> <span class="size-w-12 p-t-1"> 0236 3777 999 </span></li>

						</ul>

						<div class="how-pos1">
							<img
								src="${pageContext.request.contextPath }/templates/public/images/icons/symbol-02.png"
								alt="IMG">
						</div>
					</div>



				</div>

				<h3 class="txt-l-101 cl3 respon1">LIÊN HỆ</h3>
			</div>

			<form enctype="multipart/form-data" method="post"
				action="${pageContext.request.contextPath}/addContact">
				<div class="row">
					<div class="col-lg-6 p-b-20">
						<div class="m-r--5 m-rl-0-lg validate-input"
							data-validate="Name is required">
							<input
								class="txt-s-115 cl3 plh1 size-a-25 bo-all-1 bocl15 focus1 p-rl-20"
								type="text"
								<c:if test="${userInfo != null}"> value="${userInfo.fullname}"</c:if>
								required="required" name="name" placeholder="Họ Và Tên *">
						</div>
					</div>

					<div class="col-lg-6 p-b-20">
						<div class="m-l--5 m-rl-0-lg validate-input"
							data-validate="Valid email is: ex@abc.xyz">
							<input
								class="txt-s-115 cl3 plh1 size-a-25 bo-all-1 bocl15 focus1 p-rl-20"
								type="text"
								<c:if test="${userInfo != null}"> value="${userInfo.email}"</c:if>
								required="required" name="email" placeholder="Email *">
						</div>
					</div>

					<div class="col-lg-6 p-b-20">
						<div class="m-r--5 m-rl-0-lg">
							<input
								class="txt-s-115 cl3 plh1 size-a-25 bo-all-1 bocl15 focus1 p-rl-20"
								type="text" required="required"
								<c:if test="${userInfo != null}"> value="${userInfo.address}"</c:if>
								name="address" placeholder="Địa Chỉ">
						</div>
					</div>

					<div class="col-lg-6 p-b-20">
						<div class="m-l--5 m-rl-0-lg validate-input"
							data-validate="Phone is required">
							<input
								class="txt-s-115 cl3 plh1 size-a-25 bo-all-1 bocl15 focus1 p-rl-20"
								type="text" required="required"
								<c:if test="${userInfo != null}"> value="${userInfo.phone}"</c:if>
								name="phone" placeholder="Số Điện Thoại *">
						</div>
					</div>

					<div class="col-12 p-b-20">
						<div class="validate-input" data-validate="Message is required">
							<textarea
								class="txt-s-115 cl3 plh1 size-a-48 bo-all-1 bocl15 focus1 p-rl-20 p-tb-10"
								name="message" placeholder="Vấn Đề Của Bạn"></textarea>
						</div>
					</div>
				</div>
				<div class="flex-l p-t-10">
					<button
						class="flex-c-m txt-s-103 cl0 bg10 size-a-2 hov-btn2 trans-04">
						Gửi</button>
				</div>
			</form>
		</div>
	</div>
	</div>
</section>
