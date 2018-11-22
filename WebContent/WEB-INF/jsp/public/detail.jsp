<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section class="how-overlay2 bg-img1"
	style="background-image: url('${pageContext.request.contextPath }/templates/public/images/post.jpg');">
	<div class="container">
		<div class="txt-center p-t-160 p-b-165">
			<h2 class="txt-l-101 cl0 txt-center p-b-14 respon1">shop</h2>

			<span class="txt-m-201 cl0 flex-c-m flex-w"> <a
				href="${pageContext.request.contextPath }/"
				class="txt-m-201 cl0 hov-cl10 trans-04 m-r-6"> Home </a> <a
				href="shop-sidebar-grid.html"
				class="txt-m-201 cl0 hov-cl10 trans-04 m-r-6"> / Sản Phẩm </a> <a
				href="#" class="txt-m-201 cl0 hov-cl10 trans-04 m-r-6"></a> <span>
					/${objNews.name } </span>
			</span>
		</div>
	</div>
</section>

<!-- Product detail -->
<section class="sec-product-detail bg0 p-t-105 p-b-70">
	<div class="container">
		<div class="row">
			<div class="col-md-7 col-lg-6">
				<div class="m-r--30 m-r-0-lg">
					<!-- Slide 100 -->
					<div id="slide100-01">
						<div class="wrap-main-pic-100 bo-all-1 bocl12 pos-relative">
							<div class="main-frame">
								<div class="wrap-main-pic">
									<div class="main-pic">
										<img src="images/pro-detail-01.jpg" alt="IMG-SLIDE">
									</div>
								</div>
							</div>

							<div class="wrap-arrow-slide-100 s-full ab-t-l trans-04">
								<span class="my-arrow back prev-slide-100"><i
									class="fa fa-angle-left m-r-1" aria-hidden="true"></i></span> <span
									class="my-arrow next next-slide-100"><i
									class="fa fa-angle-right m-l-1" aria-hidden="true"></i></span>
							</div>
						</div>

						<div class="wrap-thumb-100 flex-w flex-sb p-t-30">
							<div class="thumb-100">
								<div class="sub-frame sub-1">
									<div class="wrap-main-pic">
										<div class="main-pic">
											<img src="images/pro-detail-thumb-02.jpg" alt="IMG-SLIDE">
										</div>
									</div>

									<div class="btn-sub-frame btn-1 bo-all-1 bocl12 hov8 trans-04"></div>
								</div>
							</div>

							<div class="thumb-100">
								<div class="sub-frame sub-2">
									<div class="wrap-main-pic">
										<div class="main-pic">
											<img src="images/pro-detail-thumb-03.jpg" alt="IMG-SLIDE">
										</div>
									</div>

									<div class="btn-sub-frame btn-2 bo-all-1 bocl12 hov8 trans-04"></div>
								</div>
							</div>

							<div class="thumb-100">
								<div class="sub-frame sub-3">
									<div class="wrap-main-pic">
										<div class="main-pic">
											<img src="images/pro-detail-thumb-04.jpg" alt="IMG-SLIDE">
										</div>
									</div>

									<div class="btn-sub-frame btn-3 bo-all-1 bocl12 hov8 trans-04"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-5 col-lg-6">
				<div class="p-l-70 p-t-35 p-l-0-lg">
					<h4 class="js-name1 txt-l-104 cl3 p-b-16">Cà chua</h4>

					<span class="txt-m-117 cl9"> 19000vnd </span>

					<div class="flex-w flex-m p-t-30 p-b-27">
						<c:choose>
						<c:when test="${numberComment !=0 }">
						<span class="fs-16 cl11 lh-15 txt-center m-r-15"> <i
							class="fa fa-star m-rl-1"></i> <i class="fa fa-star m-rl-1"></i>
							<i class="fa fa-star m-rl-1"></i> <i class="fa fa-star m-rl-1"></i>
							<i class="fa fa-star m-rl-1"></i>
						</span> <span class="txt-s-115 cl6 p-b-3"> (${numberComment } Review) </span>
						</c:when>
						<c:otherwise>
						<h5 class="txt-m-102 cl3 p-b-36">Hãy Là Người Đầu Tiên Đánh Giá Sản Phẩm !</h5>
						</c:otherwise>
						</c:choose>
							
						
					</div>

					<p class="txt-s-101 cl6"></p>

					<div class="flex-w flex-m p-t-55 p-b-30">
						<div
							class="wrap-num-product flex-w flex-m bg12 p-rl-10 m-r-30 m-b-30">
							<div class="btn-num-product-down flex-c-m fs-29"></div>

							<input class="txt-m-102 cl6 txt-center num-product" type="number"
								name="num-product" value="1">

							<div class="btn-num-product-up flex-c-m fs-16"></div>
						</div>

						<button
							class="flex-c-m txt-s-103 cl0 bg10 size-a-2 hov-btn2 trans-04 m-b-30 js-addcart1">
							Thêm vào giỏ</button>
					</div>


					<div class="txt-s-107 p-b-6">
						<span class="cl6"> Danh mục: </span> <span class="cl9">
							Trái cây nhập </span>
					</div>

					<div class="txt-s-107 p-b-6">
						<span class="cl6"> Tags: </span> <a href="#"
							class="txt-s-107 cl9 hov-cl10 trans-04"> Healthy, Khỏe mạnh </a>

						<a href="#" class="txt-s-107 cl9 hov-cl10 trans-04"> Organic </a>
					</div>

					<div class="txt-s-107 p-b-6">
						<span class="cl6"> Giá tiền: </span> <span class="cl9"> 15
							000vnd </span>
					</div>

					<div class="txt-s-107 p-b-6">
						<span class="cl6"> Trọng lượng: </span> <span class="cl9">
							0.5 kg </span>
					</div>
				</div>
			</div>
		</div>

		<!-- Tab01 -->
		<div class="tab02 p-t-80">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="tab" href="#description" role="tab">Mô tả</a></li>

				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#info" role="tab">chi tiết</a></li>

				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#reviews" role="tab">Reviews (${numberComment })</a></li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
				<!-- - -->
				<div class="tab-pane fade show active" id="description"
					role="tabpanel">
					<div class="p-t-30">
						<p class="txt-s-112 cl9">Sản phẩm sạch</p>
					</div>
				</div>

				<!-- - -->
				<div class="tab-pane fade" id="info" role="tabpanel">
					<ul class="p-t-21">
						<li class="txt-s-101 flex-w how-bor2 p-tb-14"><span
							class="cl6 size-w-54"> Thương hiệu </span> <span
							class="cl9 size-w-55"> Hiếu farm </span></li>

						<li class="txt-s-101 flex-w how-bor2 p-tb-14"><span
							class="cl6 size-w-54"> Nguồn gốc </span> <span
							class="cl9 size-w-55"> Nhập khẩu Mỹ </span></li>

						<li class="txt-s-101 flex-w how-bor2 p-tb-14"><span
							class="cl6 size-w-54"> Loại </span> <span class="cl9 size-w-55">
								Oraganic </span></li>
					</ul>
				</div>

				<!-- - -->
				<div class="tab-pane fade" id="reviews" role="tabpanel">
					<div class="p-t-36">
					
						
						
						<div class="commentlist">
						<c:choose>
							<c:when test="${listComment  != null}">
								<c:forEach items="${listComment}" var="objComment">
									<div class="flex-w flex-sb-t bo-b-1 bocl15 p-b-37">
										<div class="wrap-pic-w size-w-56">
											<img src="${pageContext.request.contextPath }/templates/public/images/avatar-00.gif" alt="AVATAR">
										</div>

										<div class="size-w-57 p-t-2">
											<div class="flex-w flex-sb-m p-b-8">
												<div class="flex-w flex-b m-r-20 p-tb-5">
													<span class="txt-m-103 cl6 m-r-20">${objComment.name }
													</span> <span class="txt-s-120 cl9"> (
														${objComment.date_create} ) </span>
												</div>
												<span class="fs-16 cl11 lh-15 txt-center m-r-15 p-tb-5">
													<c:forEach begin="1" end="${objComment.rating}">
														<i class="fa fa-star m-rl-1"} ></i> 
													</c:forEach>
													<c:forEach begin="1" end="${5- objComment.rating }">
														<i class="fa fa-star-o m-rl-1"} ></i>
													</c:forEach>
												</span>
											</div>
											<p class="txt-s-101 cl6">${objComment.content }</p>
										</div>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<h5 class="txt-m-102 cl3 p-b-36">Hãy Là Người Bình Luận Đầu Tiên</h5>
							</c:otherwise>
						</c:choose>
						
				</div>


						<!-- Add review -->
						<form onsubmit="return checkComment(event)" class="w-full p-t-42">
							<h5 class="txt-m-102 cl3 p-b-20">Bình luận</h5>

							<div class="flex-w flex-m p-b-3">
								<span class="txt-s-101 cl6 p-b-5 m-r-10"> Rating </span> <span
									class="wrap-rating fs-16 cl11 pointer"> 
										<i class="item-rating pointer fa fa-star m-rl-1"><input value="1" class="dis-none" type="number"  id="rating" name="rating"></i>
										<i class="item-rating pointer fa fa-star m-rl-1"><input value="2" class="dis-none" type="number"  id="rating" name="rating"></i>
										<i class="item-rating pointer fa fa-star m-rl-1"><input value="3" class="dis-none" type="number" id="rating" name="rating"></i>
										<i class="item-rating pointer fa fa-star m-rl-1"><input value="4"class="dis-none" type="number"  id="rating" name="rating"></i>
										<i class="item-rating pointer fa fa-star m-rl-1"><input value="5" class="dis-none" type="number" id="rating" name="rating"></i>
								</span>
							</div>

							<span class="txt-s-101 cl6"> Review Của Bạn * </span>

							<div class="row p-t-12">
								<div class="col-sm-6 p-b-30">
									<input
										class="txt-s-101 cl3 plh1 size-a-25 bo-all-1 bocl11 focus1 p-rl-20"
										type="text" id="name" required="required" <c:if test="${userInfo != null}"> value="${userInfo.fullname}"</c:if> name="name" placeholder="Tên *">
								</div>

								<div class="col-sm-6 p-b-30">
									<input
										class="txt-s-101 cl3 plh1 size-a-25 bo-all-1 bocl11 focus1 p-rl-20"
										type="text" name="mail" required="required" <c:if test="${userInfo != null}"> value="${userInfo.email}"</c:if> id="mail" placeholder="Email *">
								</div>

								<div class="col-12 p-b-30">
									<textarea
										class="txt-s-101 cl3 plh1 size-a-26 bo-all-1 bocl11 focus1 p-rl-20 p-tb-10"
										name="content" id="content" required="required" placeholder="Review của bạn *"></textarea>
								</div>
							</div>

							<div class="flex-r">
								<input id="submit" type="submit" name="submit" value="submit"
									class="flex-c-m txt-s-103 cl0 bg10 size-a-27 hov-btn2 trans-04">

							</div>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
function checkComment(event){
		 event.preventDefault(); 
	 	var rating = $("#rating").val();
		var name = $("#name").val();
		var mail = $("#mail").val();
		var content = $("#content").val();
		var did = ${objNews.id_product}; 
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/comment/add",
							type : 'post',
							cache : false,
							data : {
								//Dữ liệu gửi đi
								aname : name, //tên:giá trị
								aemail : mail,
								acontent : content,
								arating  : rating,
								adid : did,
							},
							success : function(data) {
								// Xử lý thành công
								$(".commentlist").html(data);	
								$("#name").val("");
								$("#mail").val("");
								$("#content").val("");
								$("#rating").val("");
							},
							error : function() {
								// Xử lý nếu có lỗi

								alert("Có lỗi xử lí");
							}
						}); 
		
}
</script>
<!-- Related product -->
<section class="sec-related bg0 p-b-85">
	<div class="container">
		<!-- slide9 -->
		<div class="wrap-slick9">
			<div class="flex-w flex-sb-m p-b-33 p-rl-15">
				<h3 class="txt-l-112 cl3 m-r-20 respon1 p-tb-15">Sản Phẩm Liên
					Quan</h3>

				<div class="wrap-arrow-slick9 flex-w m-t-6"></div>
			</div>

			<div class="slick9">
				<!-- - -->

				<c:forEach var="objNews" items="${listNewsTLQ }">
					<c:set var="urlDetail"
						value="${pageContext.request.contextPath}/${slugUtil.createSlug(objNews.name) }/${objNews.id_product}.html"></c:set>
					<div class="item-slick9 p-all-15">
						<!-- Block1 -->
						<div class="block1">
							<div class="block1-bg wrap-pic-w bo-all-1 bocl12 hov3 trans-04">
								<a href="${urlDetail }"><img
									style="width: 268px; height: 353.22px;"
									src="${pageContext.request.contextPath }/files/${objNews.picture}"
									alt="${objNews.name }"></a>

								<div class="block1-content flex-col-c-m p-b-46">
									<a href="${urlDetail }"
										class="txt-m-103 cl3 txt-center hov-cl10 trans-04 js-name-b1">
										${objNews.name } </a> <span
										class="block1-content-more txt-m-104 cl9 p-t-21 trans-04">
										${objNews.price } </span>

									<div class="block1-wrap-icon flex-c-m flex-w trans-05">
										<a href="product-single.html"
											class="block1-icon flex-c-m wrap-pic-max-w"> <img
											src="${pageContext.request.contextPath }/templates/public/images/icons/icon-view.png"
											alt="ICON">
										</a> <a href="javascript:void(0)"
											onclick="sanpham(${objNews.id_product})"
											class="block1-icon flex-c-m wrap-pic-max-w js-addcart-b1">
											<img
											src="${pageContext.request.contextPath }/templates/public/images/icons/icon-cart.png"
											alt="ICON">
										</a> <a href="wishlist.html"
											class="block1-icon flex-c-m wrap-pic-max-w js-addwish-b1">
											<img class="icon-addwish-b1"
											src="${pageContext.request.contextPath }/templates/public/images/icons/icon-heart.png"
											alt="ICON"> <img class="icon-addedwish-b1"
											src="${pageContext.request.contextPath }/templates/public/images/icons/icon-heart2.png"
											alt="ICON">
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
</section>
