<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Organic Store</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/templates/public/images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/templates/public/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/templates/public/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/templates/public/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/templates/public/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/templates/public/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/templates/public/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/templates/public/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/templates/public/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/templates/public/vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/templates/public/vendor/lightbox2/css/lightbox.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/templates/public/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/templates/public/vendor/revolution/css/layers.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/templates/public/vendor/revolution/css/navigation.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/templates/public/vendor/revolution/css/settings.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/templates/public/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/templates/public/css/main.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/templates/public/vendor/quicklylogin/login.css">
<!--===============================================================================================-->
</head>
<body class="animsition">

	<!-- Header -->
	<header class="header-v1">
		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<div class="wrap-menu-desktop">
				<nav class="limiter-menu-desktop">
					<div class="left-header">
						<!-- Menu desktop -->
						<div class="menu-desktop">
							<ul class="main-menu">
								

								<li>
									<a href="javascript:void(0)">SẢN PHẨM</a>
									<ul class="sub-menu">
										<c:forEach var="objCat" items="${listCat }">
											<c:set value="${pageContext.request.contextPath}/${slugUtil.createSlug(objCat.name)}/${objCat.id_cat}"
											var="slugName"></c:set>
										<li><a href="${slugName }">${objCat.name}</a></li>
										</c:forEach>
									</ul>
								</li>

								<!-- <li>
									<a href="blog-grid-01.html">THÔNG TIN TRÁI CÂY</a>
									
								</li> -->
	
								<li>
									<a href="${pageContext.request.contextPath }/contact">LIÊN HỆ</a>
									
								</li>
								
								
							</ul>
						
						</div>
					</div>
						
					<div class="center-header">
						<!-- Logo desktop -->		
						<div class="logo">
							<a href="${pageContext.request.contextPath }/"><img src="${pageContext.request.contextPath }/templates/public/images/icons/logochau.png" alt="IMG-LOGO"></a>
						</div>
					</div>
						
					<div class="right-header">
						<!-- Icon header -->
						<div class="wrap-icon-header flex-w flex-r-m h-full wrap-menu-click p-t-8">
							<!--Search -->
							<div class="h-full flex-m">
								<div class="icon-header-item flex-c-m trans-04 js-show-modal-search" id="d-s">
									<img src="${pageContext.request.contextPath }/templates/public/images/icons/icon-search.png" alt="SEARCH">
								</div>
							</div>
						
							<c:choose>
							<c:when test="${userInfo != null}">
							
							<div   id="icon-user" class="wrap-cart-header h-full flex-m m-l-10 menu-click">
								<div class="icon-header-item flex-c-m trans-04">
									<img src="${pageContext.request.contextPath }/templates/public/images/icons/icon-user.png" alt="user">
								</div>	
								<div class="cart-header menu-click-child trans-04">
									<marquee width="100%">Chào ${userInfo.fullname }</marquee>
									<%-- <a href="${pageContext.request.contextPath }/" class="txt-s-101 cl9 hov-cl10 trans-04">Chào ${userInfo.fullname }</a><br/> --%>
									<a href="${pageContext.request.contextPath }/myaccount" class="txt-s-101 cl9 hov-cl10 trans-04">Thông Tin Cá Nhân</a><br/>
									<a href="${pageContext.request.contextPath }/logout-member" class="txt-s-101 cl9 hov-cl10 trans-04">Đăng xuất</a>
								</div>
							</div>
							
							
							
							</c:when>

							<c:otherwise>
									<div class="wrap-cart-header h-full flex-m m-l-10 menu-click">
								<div id="icon-login" class="icon-header-item flex-c-m trans-04" >
									<img src="${pageContext.request.contextPath }/templates/public/images/icons/icon-login.png" alt="login">
								</div>
								<div id="form-login" class="cart-header menu-click-child trans-04">
									
										<form method="post" action="${pageContext.request.contextPath}/login-member">
											<div class="p-b-24">
												
												<input class="txt-s-120 cl3 size-a-21 bo-all-1 bocl15 p-rl-15 focus1" type="text" required="required" name="email" id="email" value=""
												placeholder="Email">
											</div>

											<div class="p-b-24">
												
												<input class="txt-s-120 cl3 size-a-21 bo-all-1 bocl15 p-rl-15 focus1" required="required" type="password" id="password" name="password"
												placeholder="Mật khẩu" value="">
											</div>

											<div class="flex-w flex-m p-t-15 p-b-10">
												<input type="submit" class="flex-c-m txt-s-105 cl0 bg10 size-a-39 hov-btn2 trans-04 p-rl-10 m-r-18">

												<div class="flex-w flex-m p-tb-8">
													<input id="check-creatacc" class="size-a-35 m-r-10" type="checkbox" name="creatacc">
													<label for="check-creatacc" class="txt-s-101 cl9">
														Ghi nhớ
													</label>
												</div>
											</div>
											</form>
											<a href="account-lost-pass.html" class="txt-s-101 cl9 hov-cl10 trans-04">
												Quên mật khẩu?
											</a>
										
										<a href="${pageContext.request.contextPath }/register" class="txt-s-101 cl9 hov-cl10 trans-04">
											Đăng ký
										</a>
										<div class="social">
											<div class="social-inner">
											  <a class="fa fa-2x fa-google btn btn-danger" href="#"></a>
											  <a class="fa fa-2x fa-twitter btn btn-info" href="#"></a>
											  <a class="fa fa-2x fa-facebook btn btn-primary" href="#"></a>
											</div>
										</div>
								</div>
							</div>
							
							
							</c:otherwise>
							</c:choose>
						
							<div class="wrap-cart-header h-full flex-m m-l-10 menu-click">
							
								<div class="icon-header-item flex-c-m trans-04 icon-header-noti" data-notify="2">
									<img src="${pageContext.request.contextPath }/templates/public/images/icons/icon-cart-2.png" alt="CART">
								</div>
								
					
								<div class="cart-header menu-click-child trans-04" id="content_shop_cart">
									<div class="bo-b-1 bocl15">
										<div class="size-h-2 js-pscroll m-r--15 p-r-15">
										<c:choose>
										<c:when test="${listCart  != null}">
											<c:forEach items="${listCart}" var="objCart">
												<c:set var="name" value="${objCart.name}"></c:set>
												<c:set var="id" value="${objCart.id_product}"></c:set>
												<c:set var="slug" value="${slugUtil.createSlug(name)}"></c:set>	
											
											<div class="flex-w flex-str m-b-25">
												<div class="size-w-15 flex-w flex-t">
													<a href="${pageContext.request.contextPath}/${slug}-${id}.html" class="wrap-pic-w bo-all-1 bocl12 size-w-16 hov3 trans-04 m-r-14">
														<img width="77px" height="64.33px" src="${pageContext.request.contextPath }/files/${objCart.picture}" alt="PRODUCT">
													</a>

													<div class="size-w-17 flex-col-l">
														<a href="${pageContext.request.contextPath}/${slug}-${id}.html" class="txt-s-108 cl3 hov-cl10 trans-04">
															${objCart.name}
														</a>

														<span class="txt-s-101 cl9">
															$${objCart.price}
														</span>

														<span class="txt-s-109 cl12">
															x${objCart.quatity}
														</span>
													</div>
												</div>

												<div class="size-w-14 flex-b">
													<button class="lh-10">
														<a href="${pageContext.request.contextPath}/huy/${id}" onclick="return confirm('Bạn Có Muốn Xóa Sản Phẩm Ra Khỏi Giỏ Hàng Không ?')">
														<img src="${pageContext.request.contextPath }/templates/public/images/icons/icon-close.png" alt="CLOSE" >
														</a>
													</button>
												</div>
											</div>
											<c:set var="thanhtien" value="${objCart.quatity*objCart.price}"></c:set>
												<c:set var="tongtien" value="${tongtien+thanhtien}"></c:set>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<center>
												<img src="${pageContext.request.contextPath }/templates/public/images/empty_cartpublic1.png" />
											</center>
										</c:otherwise>
									</c:choose>
											
											
										</div>
									</div>
										
									<c:choose>
									<c:when test="${listCart != null}">
									<div class="flex-w flex-sb-m p-t-22 p-b-12">
										<span class="txt-m-103 cl3 p-r-20">
											Tổng Tiền :
										</span>

										<span class="txt-m-111 cl6">
											$${tongtien}
										</span>
									</div>
										
									<!-- <div class="flex-w flex-sb-m p-b-31">
										<span class="txt-m-103 cl3 p-r-20">
											Thành tiền
										</span>

										<span class="txt-m-111 cl10">
											48vnd
										</span>
									</div> -->
									
									<a href="${pageContext.request.contextPath }/cart" class="flex-c-m size-a-8 bg10 txt-s-105 cl13 hov-btn2 trans-04">
										Xem Giỏ Hàng
									</a>
									<br />
									<a href="${pageContext.request.contextPath }/checkout" class="flex-c-m size-a-8 bg10 txt-s-105 cl13 hov-btn2 trans-04">
										Thanh Toán
									</a>	 
									</c:when>
									</c:choose>
								</div>
								
								
							</div>
						</div>
					
					</div>
				</nav>
				<!--Edit Search-->
				<div style="display: none" class="container-search-header" id="desktop-search" >
					<form class="wrap-search-header flex-w">
						<button class="flex-c-m trans-04">
							<span class="lnr lnr-magnifier"></span>
						</button>
						<input class="plh1" type="text" name="search" placeholder="Search tất cả">
					</form>
				</div>
				<!--Edit Search-->
			</div>	
		</div>

	</header>
<script type="text/javascript">
 function sanpham(id){
		$.ajax({
			url:"${pageContext.request.contextPath}/cart",
			type: 'POST',
			cache: false,
			data: {
				aid_sp:id,			
			},
			success: function(data){
				$("#content_shop_cart").html(data);
			},
			error: function (){
				alert('Thêm Giỏ Hàng Thất Bại!!!')
			}
		});	
		
	}

</script>	