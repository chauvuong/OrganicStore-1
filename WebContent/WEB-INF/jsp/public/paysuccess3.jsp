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

		<div id="paypal-button"></div>

	</h4>
</center>
<center><h4 style="color: green; font-family: cursive;">Sau Khi Thanh Toán, Chúng tôi Sẽ Giao Hàng Cho Bạn Trong Thời
		Gian Sớm Nhất !
</h4></center>

<!-- 

https://www.sandbox.paypal.com/us/signin
nguoi ban 
access_token$sandbox$v6pfc4s8rj9x62sz$a8c22562c1739d6b0c151dd8e472c7ba
Adda3ob6Xml_xU1dqUhVA1yyE13Lp3EzoaBIQrhtEtY1UENbCTm6XfPsBOe2FmPeKRMdB-TBXIWCRBYT
organic-store@gmail.com
pass: Truonglong1997

người mua 
nguoimuahangorganicstore@gmail.com



-->

<script src="https://www.paypalobjects.com/api/checkout.js"></script>
<script>
  paypal.Button.render({
    // Configure environment
    env: 'sandbox',
    client: {
      sandbox: 'Adda3ob6Xml_xU1dqUhVA1yyE13Lp3EzoaBIQrhtEtY1UENbCTm6XfPsBOe2FmPeKRMdB-TBXIWCRBYT',
      production: 'demo_production_client_id'
    },
    // Customize button (optional)
    locale: 'en_US',
    style: {
      size: 'small',
      color: 'gold',
      shape: 'pill',
    },

    // Enable Pay Now checkout flow (optional)
    commit: true,

    // Set up a payment
    payment: function(data, actions) {
      return actions.payment.create({
        transactions: [{
          amount: {
            total: '${tongtien}',
            currency: 'USD'
          }
        }]
      });
    },
    // Execute the payment
    onAuthorize: function(data, actions) {
      return actions.payment.execute().then(function() {
        // Show a confirmation message to the buyer
        window.alert('Thanh Toán Thành Công! Cảm Ơn Bạn Chúng Tôi Sẽ Giao Hàng Sớm Cho Bạn');
      });
    }
  }, '#paypal-button');

</script>
