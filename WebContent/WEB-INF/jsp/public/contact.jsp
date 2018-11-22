<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section class="how-overlay2 bg-img1" style="background-image:  url('${pageContext.request.contextPath }/templates/public/images/post.jpg');">
		<div class="container">                   
			<div class="txt-center p-t-160 p-b-165">
				<h2 class="txt-l-101 cl0 txt-center p-b-14 respon1">
					LIÊN HỆ
				</h2>

				<span class="txt-m-201 cl0 flex-c-m flex-w">
					<a href="${pageContext.request.contextPath }/" class="txt-m-201 cl0 hov-cl10 trans-04 m-r-6">
						Home
					</a>

					<span>
						/ Contact
					</span>
				</span>
			</div>
		</div>
	</section>
	<br />
	<center><h1 style="color: green; font-family: cursive; ">${msg}</h1></center>
	<!-- Form Contact -->
	<section class="container bg0 p-t-150 p-b-90">
		<div class="row">
			<div class="col-sm-10 col-md-6 col-lg-5 m-rl-auto p-b-10">
				<div class="h-full how5 m-r--30 m-r-0-lg m-l-15-xl">
					<div class="bg-img3 h-full respon18" style="background-image: url('${pageContext.request.contextPath }/templates/public/images/other-18.jpg');"></div>
				</div>
			</div>

			<div class="col-sm-10 col-md-6 col-lg-7 m-rl-auto p-b-10">
				<div class="p-t-75 p-l-70 p-rl-0-lg">
					<div class="size-a-1 flex-col-l p-b-70">
						<div class="txt-m-201 cl10 how-pos1-parent m-b-14">
							Liên Hệ Với Chúng Tôi

							<div class="how-pos1">
								<img src="${pageContext.request.contextPath }/templates/public/images/icons/symbol-02.png" alt="IMG">
							</div>
						</div>

						<h3 class="txt-l-101 cl3 respon1">
							LIÊN HỆ
						</h3>
					</div>

					<form enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/addContact">
						<div class="row">
							<div class="col-lg-6 p-b-20">
								<div class="m-r--5 m-rl-0-lg validate-input" data-validate = "Name is required">
									<input class="txt-s-115 cl3 plh1 size-a-25 bo-all-1 bocl15 focus1 p-rl-20" type="text" <c:if test="${userInfo != null}"> value="${userInfo.fullname}"</c:if> required="required" name="name" placeholder="Họ Và Tên *">
								</div>
							</div>

							<div class="col-lg-6 p-b-20">
								<div class="m-l--5 m-rl-0-lg validate-input" data-validate = "Valid email is: ex@abc.xyz">
									<input class="txt-s-115 cl3 plh1 size-a-25 bo-all-1 bocl15 focus1 p-rl-20" type="text" <c:if test="${userInfo != null}"> value="${userInfo.email}"</c:if> required="required" name="email" placeholder="Email *">
								</div>
							</div>

							<div class="col-lg-6 p-b-20">
								<div class="m-r--5 m-rl-0-lg">
									<input class="txt-s-115 cl3 plh1 size-a-25 bo-all-1 bocl15 focus1 p-rl-20" type="text" required="required" <c:if test="${userInfo != null}"> value="${userInfo.address}"</c:if> name="address" placeholder="Địa Chỉ">
								</div>
							</div>

							<div class="col-lg-6 p-b-20">
								<div class="m-l--5 m-rl-0-lg validate-input" data-validate = "Phone is required">
									<input class="txt-s-115 cl3 plh1 size-a-25 bo-all-1 bocl15 focus1 p-rl-20" type="text" required="required" <c:if test="${userInfo != null}"> value="${userInfo.phone}"</c:if> name="phone" placeholder="Số Điện Thoại *">
								</div>
							</div>

							<div class="col-12 p-b-20">
								<div class="validate-input" data-validate = "Message is required">
									<textarea class="txt-s-115 cl3 plh1 size-a-48 bo-all-1 bocl15 focus1 p-rl-20 p-tb-10" name="message" placeholder="Vấn Đề Của Bạn"></textarea>
								</div>	
							</div>
						</div>
						<div class="flex-l p-t-10">
							<button class="flex-c-m txt-s-103 cl0 bg10 size-a-2 hov-btn2 trans-04">
								Gửi
							</button>
						</div>
					</form>
				</div>
			</div>	
		</div>
	</section>
