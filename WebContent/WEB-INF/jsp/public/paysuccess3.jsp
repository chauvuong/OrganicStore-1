<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section class="how-overlay2 bg-img1"
	style="background-image: url('${pageContext.request.contextPath }/templates/public/images/post.jpg');">
	<div class="container">
		<div class="txt-center p-t-160 p-b-165">
			<h2 class="txt-l-101 cl0 txt-center p-b-14 respon1">Đặt Hàng
				Thành Công</h2>

			<span class="txt-m-201 cl0 flex-c-m flex-w"> <a
				href="${pageContext.request.contextPath }/"
				class="txt-m-201 cl0 hov-cl10 trans-04 m-r-6"> Home </a> <span>
					/ Đặt Hàng Thành Công </span>
			</span>
		</div>
	</div>
</section>
<br />
<center>
	<h1 style="color: green; font-family: cursive;">Nhấn Vào Hình Để
		Thanh Toán.</h1>
</center>

<center>
	<h4>

		<div id="paypal-button-container"></div>

	</h4>
</center>
<center><h4 style="color: green; font-family: cursive;">Sau Khi Thanh Toán, Chúng tôi Sẽ Giao Hàng Cho Bạn Trong Thời
		Gian Sớm Nhất !
</h4></center>

<!-- organicstore@gmail.com mk 12345678
	organicstoredemo@gmail.com
-->

<script src="https://www.paypalobjects.com/api/checkout.js"></script>
<script>
	paypal.Button
			.render(
					{

						env : 'sandbox', // sandbox | production

						// PayPal Client IDs - replace with your own
						// Create a PayPal app: https://developer.paypal.com/developer/applications/create
						client : {
							sandbox : 'access_token$sandbox$wsj7zxm7jt9y8g7s$6c0f8968a691274248cffc0348a9226b',
							production : '<insert production client id>'
						},

						// Show the buyer a 'Pay Now' button in the checkout flow
						commit : true,

						// payment() is called when the button is clicked
						payment : function(data, actions) {
							// Make a call to the REST api to create the payment
							return actions.payment.create({
								payment : {
									transactions : [ {
										amount : {
											total : '${tongtien}',
											currency : 'USD'
										}
									} ]
								}
							});
						},
						onAuthorize : function(data, actions) {

							return actions.payment.execute().then(function() {
								window.alert('Thanh Toán Thành Công!');
							});
						}

					}, '#paypal-button-container');
</script>
