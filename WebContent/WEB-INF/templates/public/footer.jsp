<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<!-- Load Facebook SDK for JavaScript -->

<script>
	function addWish(id) {
		$.ajax({
			url : "${pageContext.request.contextPath}/addWish",
			type : 'POST',
			cache : false,
			data : {
				id : id,
			},
			error : function() {
				alert('Thêm vào danh sách thất bại!!!')
			}
		});
	}
	function sanpham(id) {
		$.ajax({
			url : "${pageContext.request.contextPath}/cart",
			type : 'POST',
			cache : false,
			data : {
				aid_sp : id,
			},
			success : function(data) {
				$("#content_shop_cart").html(data);
				$.ajax({
					url : "${pageContext.request.contextPath}/upsize",
					type : 'POST',
					cache : false,
					success : function(data) {
						$(".cartnum").html(data);
					},
				});
			},
			error : function() {
				alert('Thêm Giỏ Hàng Thất Bại!!!')
			}
		});
	}
</script>
<footer class="bg12">
	<div class="container">
		<div class="wrap-footer flex-w p-t-60 p-b-62">
			<div class="footer-col1">
				<div class="footer-col-title">
					<a href="javascript:void(0)"> <img
						src="${pageContext.request.contextPath }/templates/public/images/icons/logochau.png"
						alt="LOGO">
					</a>
				</div>



				<ul>
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
					
					
					<div class="fb-page" data-href="https://www.facebook.com/Organic-Store-269100330436961/?modal=admin_todo_tour" data-tabs="timeline" data-width="320" data-height="70" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="false"><blockquote cite="https://www.facebook.com/Organic-Store-269100330436961/?modal=admin_todo_tour" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/Organic-Store-269100330436961/?modal=admin_todo_tour">Organic Store</a></blockquote></div>
				</ul>
			</div>

			<div class="footer-col2">
				<div class="footer-col-title flex-m">
					<span class="txt-m-109 cl3"> Cửa Hàng </span>
				</div>

				<ul>
					<li class="p-b-16"><span class="size-w-11"> <img
							src="${pageContext.request.contextPath }/templates/public/images/icons/icon-pin.png"
							alt="ICON-MAIL">
					</span> <a href="javascript:void(0)"
						class="txt-s-101 cl6 hov-cl10 trans-04 p-tb-5"> Số 54 Nguyễn
							Lương Bằng, Đà Nẵng </a></li>

					<li class="p-b-16"><span class="size-w-11"> <img
							src="${pageContext.request.contextPath }/templates/public/images/icons/icon-pin.png"
							alt="ICON-MAIL">
					</span> <a href="javascript:void(0)"
						class="txt-s-101 cl6 hov-cl10 trans-04 p-tb-5"> 79 Trương
							Định, Quận 1 , HCM </a></li>

					<li class="p-b-16"><span class="size-w-11"> <img
							src="${pageContext.request.contextPath }/templates/public/images/icons/icon-pin.png"
							alt="ICON-MAIL">
					</span> <a href="javascript:void(0)"
						class="txt-s-101 cl6 hov-cl10 trans-04 p-tb-5"> 125 Nguyễn Thị
							Minh Khai, Hà Nội </a></li>

					<li class="p-b-16"><span class="size-w-11"> <img
							src="${pageContext.request.contextPath }/templates/public/images/icons/icon-pin.png"
							alt="ICON-MAIL">
					</span> <a href="javascript:void(0)"
						class="txt-s-101 cl6 hov-cl10 trans-04 p-tb-5"> 202 Lê Duẩn,
							Buôn Ma Thuột </li>


				</ul>
			</div>



			<div class="footer-col2">
				<div class="footer-col-title flex-m">
					<span class="txt-m-109 cl3"> LIÊN HỆ </span>
				</div>

				<ul>
					<li class="p-b-16"><a href="javascript:void(0)"
						class="txt-s-101 cl6 hov-cl10 trans-04 p-tb-5"> Trung Tâm Hỗ
							Trợ </a></li>

					<li class="p-b-16"><a href="javascript:void(0)"
						class="txt-s-101 cl6 hov-cl10 trans-04 p-tb-5"> Hướng Dẫn Đặt
							Hàng </a></li>

					<li class="p-b-16"><a href="javascript:void(0)"
						class="txt-s-101 cl6 hov-cl10 trans-04 p-tb-5"> Giao Hàng &
							Nhận Hàng </a></li>

					<li class="p-b-16"><a href="javascript:void(0)"
						class="txt-s-101 cl6 hov-cl10 trans-04 p-tb-5"> Điều Kiện Sử
							Dụng Voucher </li>


				</ul>
			</div>

			<div class="footer-col3">
				<div class="footer-col-title flex-m">
					<span class="txt-m-109 cl3"> </span>
				</div>


			</div>

			<div class="footer-col4">
				<div class="footer-col-title flex-m">
					<span class="txt-m-109 cl3"> Kết Nối Với Organic Store </span>
				</div>

				<div class="flex-w flex-sb p-t-6">


					<div class="size-w-13 m-b-10">
						<a href="https://zalo.me/" class="dis-block size-a-7 bg-img1 hov4"
							style="background-image: url('${pageContext.request.contextPath }/templates/public/images/zalo.jpg');"></a>
					</div>

					<div class="size-w-13 m-b-10">
						<a href="https://www.facebook.com/ITLONGTRUONG?ref=bookmarks"
							class="dis-block size-a-7 bg-img1 hov4"
							style="background-image: url('${pageContext.request.contextPath }/templates/public/images/facebook.jpg');"></a>
					</div>

					<div class="size-w-13 m-b-10">
						<a
							href="https://www.instagram.com/truonglong_it/?fbclid=IwAR0-OKbCBTWhnleOulglh-gCC6oFzM0zSK-u93FKpMsLgZl4TL99_fDzFwM"
							class="dis-block size-a-7 bg-img1 hov4"
							style="background-image: url('${pageContext.request.contextPath }/templates/public/images/Instagram.png');"></a>
					</div>


				</div>
			</div>
		</div>

		<div class="flex-w flex-sb-m bo-t-1 bocl14 p-tb-14">
			<span class="txt-s-101 cl9 p-tb-10 p-r-29"> Organic Store ©
				2018 Organic Products. </span>

			<div class="flex-w flex-m">
				<a href="javascript:void(0)" class="m-r-29 m-tb-10"> <img
					src="${pageContext.request.contextPath }/templates/public/images/icons/icon-pay-01.png"
					alt="ICON-PAY">
				</a> <a href="javascript:void(0)" class="m-r-29 m-tb-10"> <img
					src="${pageContext.request.contextPath }/templates/public/images/icons/icon-pay-02.png"
					alt="ICON-PAY">
				</a> <a href="javascript:void(0)" class="m-r-29 m-tb-10"> <img
					src="${pageContext.request.contextPath }/templates/public/images/icons/icon-pay-03.png"
					alt="ICON-PAY">
				</a> <a href="javascript:void(0)" class="m-r-29 m-tb-10"> <img
					src="${pageContext.request.contextPath }/templates/public/images/icons/icon-pay-04.png"
					alt="ICON-PAY">
				</a> <a href="javascript:void(0)"> <img
					src="${pageContext.request.contextPath }/templates/public/images/icons/icon-pay-05.png"
					alt="ICON-PAY">
				</a>
			</div>
		</div>
	</div>
</footer>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v3.2&appId=672612083133244&autoLogAppEvents=1';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>


<!-- Back to top -->
<div class="btn-back-to-top bg0-hov" id="myBtn">
	<span class="symbol-btn-back-to-top"> <span
		class="lnr lnr-chevron-up"></span>
	</span>
</div>

<!--===============================================================================================-->
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/bootstrap/js/popper.js"></script>
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/revolution/js/jquery.themepunch.tools.min.js"></script>
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/revolution/js/jquery.themepunch.revolution.min.js"></script>
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/revolution/js/extensions/revolution.extension.video.min.js"></script>
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/revolution/js/extensions/revolution.extension.actions.min.js"></script>
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/revolution/js/extensions/revolution.extension.migration.min.js"></script>
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
<script
	src="${pageContext.request.contextPath }/templates/public/js/revo-custom.js"></script>
<!--===============================================================================================-->
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/daterangepicker/moment.min.js"></script>
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/slick/slick.min.js"></script>
<script
	src="${pageContext.request.contextPath }/templates/public/js/slick-custom.js"></script>
<!--===============================================================================================-->
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/parallax100/parallax100.js"></script>
<!--===============================================================================================-->
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/lightbox2/js/lightbox.min.js"></script>
<!--===============================================================================================-->
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/sweetalert/sweetalert.min.js"></script>
<!--===============================================================================================-->
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/countdowntime/moment.min.js"></script>
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/countdowntime/moment-timezone.min.js"></script>
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/countdowntime/moment-timezone-with-data.min.js"></script>
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/countdowntime/jquery.countdown.min.js"></script>
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<!--===============================================================================================-->
<script
	src="${pageContext.request.contextPath }/templates/public/vendor/noui/nouislider.min.js"></script>
<script
	src="${pageContext.request.contextPath }/templates/public/js/main.js"></script>


</body>
</html>
