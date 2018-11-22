<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section class="how-overlay2 bg-img1" style="background-image: url(images/post.jpg);">
		<div class="container">
			<div class="txt-center p-t-160 p-b-165">
				<h2 class="txt-l-101 cl0 txt-center p-b-14 respon1">
					shop
				</h2>

				<span class="txt-m-201 cl0 flex-c-m flex-w">
					<a href="home.htm" class="txt-m-201 cl0 hov-cl10 trans-04 m-r-6">
						Home
					</a>

					<span>
						/ Sản phẩm
					</span>
				</span>
			</div>
		</div>
	</section>
	
	<!-- Content page -->
	<section class="bg0 p-t-85 p-b-45">
		<div class="container">
			<div class="row">
				<div class="col-sm-10 col-md-4 col-lg-3 m-rl-auto p-b-50">
					<div class="leftbar p-t-15">
						<!--  -->
						<div class="size-a-21 pos-relative">
							<input class="s-full bo-all-1 bocl15 p-rl-20" type="text" name="search" placeholder="Search sảm phẩm...">
							<button class="flex-c-m fs-18 size-a-22 ab-t-r hov11">
								<img class="hov11-child trans-04" src="images/icons/icon-search.png" alt="ICON">
							</button>
						</div>

						<!--  -->
						<div class="p-t-45">
							<h4 class="txt-m-101 cl3">
								LỌC THEO GIÁ
							</h4>

							<div class="filter-price p-t-32">
								<div class="wra-filter-bar">
									<div id="filter-bar"></div>
								</div>

								<div class="flex-sb-m flex-w p-t-16">
									<div class="txt-s-115 cl9 p-t-10 p-b-10 m-r-20">
										Giá: <span id="value-lower">8</span> - <span id="value-upper">20</span>
									</div>

									<div>
										<a href="#" class="txt-s-107 cl6 hov-cl10 trans-04">
											Lọc
										</a>
									</div>
								</div>
							</div>
						</div>
						<hr/>
						<!--  -->
						<div>
							<h4 class="txt-m-101 cl3 p-b-20">
								DANH MỤC
							</h4>

							<ul>
							
							
								<li class="p-b-5">
									<a href="#" class="flex-sb-m flex-w txt-s-101 cl6 hov-cl10 trans-04 p-tb-3">
										<span class="m-r-10">
											Rau Củ
										</span>

										<span>
											3
										</span>
									</a>
								</li>

								

								
							</ul>
						</div>
						<hr/>
						<!--  -->
						<div>
							<h4 class="txt-m-101 cl3 p-b-20">
								THƯƠNG HIỆU
							</h4>

							<ul>
								<li class="p-b-5">
									<label>
										<input class="brand"  type="checkbox" value="">
										Đà Lạt
									</label>
								</li>

								<li class="p-b-5">
									<label>
										<input class="brand" type="checkbox" value="">
										Huế mộng mơ
									</label>
								</li>

								<li class="p-b-5">
									<label>
										<input class="brand" type="checkbox" value="">
										Sóc Trăng
									</label>
								</li>

								<li class="p-b-5">
									<label>
										<input class="brand" type="checkbox" value="">
										Đà Nẵng
									</label>
								</li>
							</ul>
						</div>						
						<hr/>
						<!--Rating -->
						<div>
							<h4 class="txt-m-101 cl3 p-b-20">
								ĐÁNH GIÁ
							</h4>
                            <div class="rating-wrap-post" style="cursor: pointer">
                                <i id="1" class="fa fa-star" onclick="set('1')"></i>
                                <i id="2" class="fa fa-star" onclick="set('2')"></i>
                                <i id="3" class="fa fa-star" onclick="set('3')"></i>
                                <i id="4" class="fa fa-star" onclick="set('4')"></i>
                                <i id="5" class="fa fa-star" onclick="set('5')"></i>
                                Trở lên
								<input style="display: none" type="number" style="width:50px;"  value=""  id="star">
								
                            </div>
							<script language="javascript">
								function set(id)
								{	
								   for(var i=1;i<=5;i++)
								   document.getElementById(i).style.color = '#333';
								   for(var i=1;i<=id;i++)
								   document.getElementById(i).style.color = 'yellow';
								   document.getElementById('star').value = id;
								}
							</script>
							</div>						
						<hr/>
						<!--  -->
						<div>
							<h4 class="txt-m-101 cl3 p-b-20">
								THEO TAGS
							</h4>

							<div class="flex-w m-r--10">
								<a href="#" class="dis-block bg12 txt-s-101 cl6 hov-btn1 trans-03 p-tb-5 p-rl-12 m-r-10 m-b-10">
									Trái cây
								</a>

								<a href="#" class="dis-block bg12 txt-s-101 cl6 hov-btn1 trans-03 p-tb-5 p-rl-12 m-r-10 m-b-10">
									Green
								</a>

								<a href="#" class="dis-block bg12 txt-s-101 cl6 hov-btn1 trans-03 p-tb-5 p-rl-12 m-r-10 m-b-10">
									Rau củ
								</a>

								<a href="#" class="dis-block bg12 txt-s-101 cl6 hov-btn1 trans-03 p-tb-5 p-rl-12 m-r-10 m-b-10">
									Organic
								</a>

								<a href="#" class="dis-block bg12 txt-s-101 cl6 hov-btn1 trans-03 p-tb-5 p-rl-12 m-r-10 m-b-10">
									Đồ khô
								</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-sm-10 col-md-8 col-lg-9 m-rl-auto p-b-50">
					<div>
						<div class="flex-w flex-r-m p-b-45 flex-row-rev">
							<div class="flex-w flex-m p-tb-8">
								<div class="rs1-select2 bg0 size-w-52 bo-all-1 bocl15 m-tb-7 m-r-15">
									<select class="js-select2" name="sort">
										<option>Sắp xếp theo độ phổ biến</option>
										<option>Sắp xếp theo giá từ thấp đến cao</option>
										<option>Sắp xếp theo giá từ cao đến thấp</option>
									</select>
									<div class="dropDownSelect2"></div>
								</div>
								
								<div class="flex-w flex-m m-tb-7">
									<button class="dis-block lh-00 pos-relative how-icon1 m-r-15 js-show-list">
										<img class="icon-main trans-04" src="images/icons/icon-menu-list.png" alt="ICON">
										<img class="ab-t-l icon-hov trans-04" src="images/icons/icon-menu-list1.png" alt="ICON">
									</button>

									<button class="dis-block lh-00 pos-relative how-icon1 menu-active js-show-grid">
										<img class="icon-main trans-04" src="images/icons/icon-grid.png" alt="ICON">
										<img class="ab-t-l icon-hov trans-04" src="images/icons/icon-grid1.png" alt="ICON">
									</button>
								</div>
							</div>

							<span class="txt-s-101 cl9 m-r-30 size-w-53">
								Show 1–12 trong 23 sản phẩm
							</span>
						</div>
						
						<!-- Shop grid -->
						<div class="shop-grid">
							<div class="row">
								<!-- - -->
								<div class="col-sm-6 col-lg-4 p-b-30">
									<!-- Block1 -->
									<div class="block1">
										<div class="block1-bg wrap-pic-w bo-all-1 bocl12 hov3 trans-04">
											<img src="images/product-02.jpg" alt="IMG">

											<div class="block1-content flex-col-c-m p-b-46">
												<a href="product-single.html" class="txt-m-103 cl3 txt-center hov-cl10 trans-04 js-name-b1">
													Strawberry
												</a>

												<span class="block1-content-more txt-m-104 cl9 p-t-21 trans-04">
													23vnd
												</span>

												<div class="block1-wrap-icon flex-c-m flex-w trans-05">
													<a href="product-single.html" class="block1-icon flex-c-m wrap-pic-max-w">
														<img src="images/icons/icon-view.png" alt="ICON">
													</a>

													<a href="#" class="block1-icon flex-c-m wrap-pic-max-w js-addcart-b1">
														<img src="images/icons/icon-cart.png" alt="ICON">
													</a>

													<a href="wishlist.html" class="block1-icon flex-c-m wrap-pic-max-w js-addwish-b1">
														<img class="icon-addwish-b1" src="images/icons/icon-heart.png" alt="ICON">
														<img class="icon-addedwish-b1" src="images/icons/icon-heart2.png" alt="ICON">
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- - -->
								<div class="col-sm-6 col-lg-4 p-b-30">
									<!-- Block1 -->
									<div class="block1">
										<div class="block1-bg wrap-pic-w bo-all-1 bocl12 hov3 trans-04">
											<img src="images/product-03.jpg" alt="IMG">

											<div class="block1-content flex-col-c-m p-b-46">
												<a href="product-single.html" class="txt-m-103 cl3 txt-center hov-cl10 trans-04 js-name-b1">
													Cà chua
												</a>

												<span class="block1-content-more txt-m-104 cl9 p-t-21 trans-04">
													19000vnd
												</span>

												<div class="block1-wrap-icon flex-c-m flex-w trans-05">
													<a href="product-single.html" class="block1-icon flex-c-m wrap-pic-max-w">
														<img src="images/icons/icon-view.png" alt="ICON">
													</a>

													<a href="#" class="block1-icon flex-c-m wrap-pic-max-w js-addcart-b1">
														<img src="images/icons/icon-cart.png" alt="ICON">
													</a>

													<a href="wishlist.html" class="block1-icon flex-c-m wrap-pic-max-w js-addwish-b1">
														<img class="icon-addwish-b1" src="images/icons/icon-heart.png" alt="ICON">
														<img class="icon-addedwish-b1" src="images/icons/icon-heart2.png" alt="ICON">
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- - -->
								<div class="col-sm-6 col-lg-4 p-b-30">
									<!-- Block1 -->
									<div class="block1">
										<div class="block1-bg wrap-pic-w bo-all-1 bocl12 hov3 trans-04">
											<img src="images/product-04.jpg" alt="IMG">

											<div class="block1-content flex-col-c-m p-b-46">
												<a href="product-single.html" class="txt-m-103 cl3 txt-center hov-cl10 trans-04 js-name-b1">
													Cà chua
												</a>

												<span class="block1-content-more txt-m-104 cl9 p-t-21 trans-04">
													22000vnd
												</span>

												<div class="block1-wrap-icon flex-c-m flex-w trans-05">
													<a href="product-single.html" class="block1-icon flex-c-m wrap-pic-max-w">
														<img src="images/icons/icon-view.png" alt="ICON">
													</a>

													<a href="#" class="block1-icon flex-c-m wrap-pic-max-w js-addcart-b1">
														<img src="images/icons/icon-cart.png" alt="ICON">
													</a>

													<a href="wishlist.html" class="block1-icon flex-c-m wrap-pic-max-w js-addwish-b1">
														<img class="icon-addwish-b1" src="images/icons/icon-heart.png" alt="ICON">
														<img class="icon-addedwish-b1" src="images/icons/icon-heart2.png" alt="ICON">
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- - -->
								<div class="col-sm-6 col-lg-4 p-b-30">
									<!-- Block1 -->
									<div class="block1">
										<div class="block1-bg wrap-pic-w bo-all-1 bocl12 hov3 trans-04">
											<img src="images/product-05.jpg" alt="IMG">

											<div class="block1-content flex-col-c-m p-b-46">
												<a href="product-single.html" class="txt-m-103 cl3 txt-center hov-cl10 trans-04 js-name-b1">
													Cà chua
												</a>

												<span class="block1-content-more txt-m-104 cl9 p-t-21 trans-04">
													12000vnd
												</span>

												<div class="block1-wrap-icon flex-c-m flex-w trans-05">
													<a href="product-single.html" class="block1-icon flex-c-m wrap-pic-max-w">
														<img src="images/icons/icon-view.png" alt="ICON">
													</a>

													<a href="#" class="block1-icon flex-c-m wrap-pic-max-w js-addcart-b1">
														<img src="images/icons/icon-cart.png" alt="ICON">
													</a>

													<a href="wishlist.html" class="block1-icon flex-c-m wrap-pic-max-w js-addwish-b1">
														<img class="icon-addwish-b1" src="images/icons/icon-heart.png" alt="ICON">
														<img class="icon-addedwish-b1" src="images/icons/icon-heart2.png" alt="ICON">
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- - -->
								<div class="col-sm-6 col-lg-4 p-b-30">
									<!-- Block1 -->
									<div class="block1">
										<div class="block1-bg wrap-pic-w bo-all-1 bocl12 hov3 trans-04">
											<img src="images/product-06.jpg" alt="IMG">

											<div class="block1-content flex-col-c-m p-b-46">
												<a href="product-single.html" class="txt-m-103 cl3 txt-center hov-cl10 trans-04 js-name-b1">
													Cà chua
												</a>

												<span class="block1-content-more txt-m-104 cl9 p-t-21 trans-04">
													9000vnd
												</span>

												<div class="block1-wrap-icon flex-c-m flex-w trans-05">
													<a href="product-single.html" class="block1-icon flex-c-m wrap-pic-max-w">
														<img src="images/icons/icon-view.png" alt="ICON">
													</a>

													<a href="#" class="block1-icon flex-c-m wrap-pic-max-w js-addcart-b1">
														<img src="images/icons/icon-cart.png" alt="ICON">
													</a>

													<a href="wishlist.html" class="block1-icon flex-c-m wrap-pic-max-w js-addwish-b1">
														<img class="icon-addwish-b1" src="images/icons/icon-heart.png" alt="ICON">
														<img class="icon-addedwish-b1" src="images/icons/icon-heart2.png" alt="ICON">
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								
								<!--  -->
								<div class="col-sm-6 col-lg-4 p-b-30">
									<!-- Block1 -->
									<div class="block1">
										<div class="block1-bg wrap-pic-w bo-all-1 bocl12 hov3 trans-04">
											<img src="images/product-07.jpg" alt="IMG">

											<div class="block1-content flex-col-c-m p-b-46">
												<a href="product-single.html" class="txt-m-103 cl3 txt-center hov-cl10 trans-04 js-name-b1">
													Cà chua
												</a>

												<span class="block1-content-more txt-m-104 cl9 p-t-21 trans-04">
													15000vnd
												</span>

												<div class="block1-wrap-icon flex-c-m flex-w trans-05">
													<a href="product-single.html" class="block1-icon flex-c-m wrap-pic-max-w">
														<img src="images/icons/icon-view.png" alt="ICON">
													</a>

													<a href="#" class="block1-icon flex-c-m wrap-pic-max-w js-addcart-b1">
														<img src="images/icons/icon-cart.png" alt="ICON">
													</a>

													<a href="wishlist.html" class="block1-icon flex-c-m wrap-pic-max-w js-addwish-b1">
														<img class="icon-addwish-b1" src="images/icons/icon-heart.png" alt="ICON">
														<img class="icon-addedwish-b1" src="images/icons/icon-heart2.png" alt="ICON">
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- - -->
								<div class="col-sm-6 col-lg-4 p-b-30">
									<!-- Block1 -->
									<div class="block1">
										<div class="block1-bg wrap-pic-w bo-all-1 bocl12 hov3 trans-04">
											<img src="images/product-08.jpg" alt="IMG">

											<div class="block1-content flex-col-c-m p-b-46">
												<a href="product-single.html" class="txt-m-103 cl3 txt-center hov-cl10 trans-04 js-name-b1">
													Cà chua
												</a>

												<span class="block1-content-more txt-m-104 cl9 p-t-21 trans-04">
													38000vnd
												</span>

												<div class="block1-wrap-icon flex-c-m flex-w trans-05">
													<a href="product-single.html" class="block1-icon flex-c-m wrap-pic-max-w">
														<img src="images/icons/icon-view.png" alt="ICON">
													</a>

													<a href="#" class="block1-icon flex-c-m wrap-pic-max-w js-addcart-b1">
														<img src="images/icons/icon-cart.png" alt="ICON">
													</a>

													<a href="wishlist.html" class="block1-icon flex-c-m wrap-pic-max-w js-addwish-b1">
														<img class="icon-addwish-b1" src="images/icons/icon-heart.png" alt="ICON">
														<img class="icon-addedwish-b1" src="images/icons/icon-heart2.png" alt="ICON">
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- - -->
								<div class="col-sm-6 col-lg-4 p-b-30">
									<!-- Block1 -->
									<div class="block1">
										<div class="block1-bg wrap-pic-w bo-all-1 bocl12 hov3 trans-04">
											<img src="images/product-01.jpg" alt="IMG">

											<div class="block1-content flex-col-c-m p-b-46">
												<a href="product-single.html" class="txt-m-103 cl3 txt-center hov-cl10 trans-04 js-name-b1">
													Cà chua
												</a>

												<span class="block1-content-more txt-m-104 cl9 p-t-21 trans-04">
													21000vnd
												</span>

												<div class="block1-wrap-icon flex-c-m flex-w trans-05">
													<a href="product-single.html" class="block1-icon flex-c-m wrap-pic-max-w">
														<img src="images/icons/icon-view.png" alt="ICON">
													</a>

													<a href="#" class="block1-icon flex-c-m wrap-pic-max-w js-addcart-b1">
														<img src="images/icons/icon-cart.png" alt="ICON">
													</a>

													<a href="wishlist.html" class="block1-icon flex-c-m wrap-pic-max-w js-addwish-b1">
														<img class="icon-addwish-b1" src="images/icons/icon-heart.png" alt="ICON">
														<img class="icon-addedwish-b1" src="images/icons/icon-heart2.png" alt="ICON">
													</a>
												</div>
											</div>
										</div>
									</div>	
								</div>

								<!-- - -->
								<div class="col-sm-6 col-lg-4 p-b-30">
									<!-- Block1 -->
									<div class="block1">
										<div class="block1-bg wrap-pic-w bo-all-1 bocl12 hov3 trans-04">
											<img src="images/product-33.jpg" alt="IMG">

											<div class="block1-content flex-col-c-m p-b-46">
												<a href="product-single.html" class="txt-m-103 cl3 txt-center hov-cl10 trans-04 js-name-b1">
													Cà chua
												</a>

												<span class="block1-content-more txt-m-104 cl9 p-t-21 trans-04">
													8000vnd
												</span>

												<div class="block1-wrap-icon flex-c-m flex-w trans-05">
													<a href="product-single.html" class="block1-icon flex-c-m wrap-pic-max-w">
														<img src="images/icons/icon-view.png" alt="ICON">
													</a>

													<a href="#" class="block1-icon flex-c-m wrap-pic-max-w js-addcart-b1">
														<img src="images/icons/icon-cart.png" alt="ICON">
													</a>

													<a href="wishlist.html" class="block1-icon flex-c-m wrap-pic-max-w js-addwish-b1">
														<img class="icon-addwish-b1" src="images/icons/icon-heart.png" alt="ICON">
														<img class="icon-addedwish-b1" src="images/icons/icon-heart2.png" alt="ICON">
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- - -->
								<div class="col-sm-6 col-lg-4 p-b-30">
									<!-- Block1 -->
									<div class="block1">
										<div class="block1-bg wrap-pic-w bo-all-1 bocl12 hov3 trans-04">
											<img src="images/product-34.jpg" alt="IMG">

											<div class="block1-content flex-col-c-m p-b-46">
												<a href="product-single.html" class="txt-m-103 cl3 txt-center hov-cl10 trans-04 js-name-b1">
													Cà chua
												</a>

												<span class="block1-content-more txt-m-104 cl9 p-t-21 trans-04">
													38000vnd
												</span>

												<div class="block1-wrap-icon flex-c-m flex-w trans-05">
													<a href="product-single.html" class="block1-icon flex-c-m wrap-pic-max-w">
														<img src="images/icons/icon-view.png" alt="ICON">
													</a>

													<a href="#" class="block1-icon flex-c-m wrap-pic-max-w js-addcart-b1">
														<img src="images/icons/icon-cart.png" alt="ICON">
													</a>

													<a href="wishlist.html" class="block1-icon flex-c-m wrap-pic-max-w js-addwish-b1">
														<img class="icon-addwish-b1" src="images/icons/icon-heart.png" alt="ICON">
														<img class="icon-addedwish-b1" src="images/icons/icon-heart2.png" alt="ICON">
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								
								<!--  -->
								<div class="col-sm-6 col-lg-4 p-b-30">
									<!-- Block1 -->
									<div class="block1">
										<div class="block1-bg wrap-pic-w bo-all-1 bocl12 hov3 trans-04">
											<img src="images/product-35.jpg" alt="IMG">

											<div class="block1-content flex-col-c-m p-b-46">
												<a href="product-single.html" class="txt-m-103 cl3 txt-center hov-cl10 trans-04 js-name-b1">
													Cà chua
												</a>

												<span class="block1-content-more txt-m-104 cl9 p-t-21 trans-04">
													38000vnd
												</span>

												<div class="block1-wrap-icon flex-c-m flex-w trans-05">
													<a href="product-single.html" class="block1-icon flex-c-m wrap-pic-max-w">
														<img src="images/icons/icon-view.png" alt="ICON">
													</a>

													<a href="#" class="block1-icon flex-c-m wrap-pic-max-w js-addcart-b1">
														<img src="images/icons/icon-cart.png" alt="ICON">
													</a>

													<a href="wishlist.html" class="block1-icon flex-c-m wrap-pic-max-w js-addwish-b1">
														<img class="icon-addwish-b1" src="images/icons/icon-heart.png" alt="ICON">
														<img class="icon-addedwish-b1" src="images/icons/icon-heart2.png" alt="ICON">
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- - -->
								<div class="col-sm-6 col-lg-4 p-b-30">
									<!-- Block1 -->
									<div class="block1">
										<div class="block1-bg wrap-pic-w bo-all-1 bocl12 hov3 trans-04">
											<img src="images/product-36.jpg" alt="IMG">

											<div class="block1-content flex-col-c-m p-b-46">
												<a href="product-single.html" class="txt-m-103 cl3 txt-center hov-cl10 trans-04 js-name-b1">
													Cà chua
												</a>

												<span class="block1-content-more txt-m-104 cl9 p-t-21 trans-04">
													28000vnd
												</span>

												<div class="block1-wrap-icon flex-c-m flex-w trans-05">
													<a href="product-single.html" class="block1-icon flex-c-m wrap-pic-max-w">
														<img src="images/icons/icon-view.png" alt="ICON">
													</a>

													<a href="#" class="block1-icon flex-c-m wrap-pic-max-w js-addcart-b1">
														<img src="images/icons/icon-cart.png" alt="ICON">
													</a>

													<a href="wishlist.html" class="block1-icon flex-c-m wrap-pic-max-w js-addwish-b1">
														<img class="icon-addwish-b1" src="images/icons/icon-heart.png" alt="ICON">
														<img class="icon-addedwish-b1" src="images/icons/icon-heart2.png" alt="ICON">
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Shop list -->
						<div class="shop-list dis-none">
							<div class="row p-b-30">
								<div class=" col-sm-5 col-lg-4">
									<a href="product-single.html" class="wrap-pic-w bo-all-1 bocl12 hov8 trans-04">
										<img src="images/product-37.jpg" alt="PRODUCT">
									</a>
								</div>

								<div class=" col-sm-7 col-lg-8">
									<div class="p-t-5 p-b-20">
										<div class="flex-w flex-sb-m">
											<a href="product-single.html" class="txt-m-120 cl3 hov-cl10 trans-04 m-r-20 js-name1">
												Strawberry
											</a>

											<a href="wishlist.html" class="lh-00 pos-relative how-icon1 m-tb-15 js-addwish1">
												<img class="icon-main trans-04" src="images/icons/icon-heart-color.png" alt="ICON">
												<img class="ab-t-l icon-hov trans-04" src="images/icons/icon-heart-color2.png" alt="ICON">
											</a>
										</div>

										<span class="txt-m-117 cl9">
											21vnd
										</span>

										<p class="txt-s-101 cl6 p-t-18">
											farm hiếu
										</p>

										<div class="flex-w p-t-29">
											<button class="flex-c-m txt-s-103 cl0 bg10 size-a-2 hov-btn2 trans-04 js-addcart1">
												Thêm vào giỏ
											</button>
										</div>	
									</div>
								</div>
							</div>

							<div class="row p-b-30">
								<div class=" col-sm-5 col-lg-4">
									<a href="product-single.html" class="wrap-pic-w bo-all-1 bocl12 hov8 trans-04">
										<img src="images/product-38.jpg" alt="PRODUCT">
									</a>
								</div>

								<div class=" col-sm-7 col-lg-8">
									<div class="p-t-5 p-b-20">
										<div class="flex-w flex-sb-m">
											<a href="product-single.html" class="txt-m-120 cl3 hov-cl10 trans-04 m-r-20 js-name1">
												Cà chua
											</a>

											<a href="wishlist.html" class="lh-00 pos-relative how-icon1 m-tb-15 js-addwish1">
												<img class="icon-main trans-04" src="images/icons/icon-heart-color.png" alt="ICON">
												<img class="ab-t-l icon-hov trans-04" src="images/icons/icon-heart-color2.png" alt="ICON">
											</a>
										</div>

										<span class="txt-m-117 cl9">
											15vnd
										</span>

										<p class="txt-s-101 cl6 p-t-18">
											farm
										</p>

										<div class="flex-w p-t-29">
											<button class="flex-c-m txt-s-103 cl0 bg10 size-a-2 hov-btn2 trans-04 js-addcart1">
												Thêm vào giỏ
											</button>
										</div>	
									</div>
								</div>
							</div>

							<div class="row p-b-30">
								<div class=" col-sm-5 col-lg-4">
									<a href="product-single.html" class="wrap-pic-w bo-all-1 bocl12 hov8 trans-04">
										<img src="images/product-39.jpg" alt="PRODUCT">
									</a>
								</div>

								<div class=" col-sm-7 col-lg-8">
									<div class="p-t-5 p-b-20">
										<div class="flex-w flex-sb-m">
											<a href="product-single.html" class="txt-m-120 cl3 hov-cl10 trans-04 m-r-20 js-name1">
												Cà chua
											</a>

											<a href="wishlist.html" class="lh-00 pos-relative how-icon1 m-tb-15 js-addwish1">
												<img class="icon-main trans-04" src="images/icons/icon-heart-color.png" alt="ICON">
												<img class="ab-t-l icon-hov trans-04" src="images/icons/icon-heart-color2.png" alt="ICON">
											</a>
										</div>

										<span class="txt-m-117 cl9">
											19vnd
										</span>

										<p class="txt-s-101 cl6 p-t-18">
											farm

										<div class="flex-w p-t-29">
											<button class="flex-c-m txt-s-103 cl0 bg10 size-a-2 hov-btn2 trans-04 js-addcart1">
												Thêm vào giỏ
											</button>
										</div>	
									</div>
								</div>
							</div>

							<div class="row p-b-30">
								<div class=" col-sm-5 col-lg-4">
									<a href="product-single.html" class="wrap-pic-w bo-all-1 bocl12 hov8 trans-04">
										<img src="images/product-40.jpg" alt="PRODUCT">
									</a>
								</div>

								<div class=" col-sm-7 col-lg-8">
									<div class="p-t-5 p-b-20">
										<div class="flex-w flex-sb-m">
											<a href="product-single.html" class="txt-m-120 cl3 hov-cl10 trans-04 m-r-20 js-name1">
												Cà chua
											</a>

											<a href="wishlist.html" class="lh-00 pos-relative how-icon1 m-tb-15 js-addwish1">
												<img class="icon-main trans-04" src="images/icons/icon-heart-color.png" alt="ICON">
												<img class="ab-t-l icon-hov trans-04" src="images/icons/icon-heart-color2.png" alt="ICON">
											</a>
										</div>

										<span class="txt-m-117 cl9">
											23vnd
										</span>

										<p class="txt-s-101 cl6 p-t-18">
											farm
										</p>

										<div class="flex-w p-t-29">
											<button class="flex-c-m txt-s-103 cl0 bg10 size-a-2 hov-btn2 trans-04 js-addcart1">
												Thêm vào giỏ
											</button>
										</div>	
									</div>
								</div>
							</div>

							<div class="row p-b-30">
								<div class=" col-sm-5 col-lg-4">
									<a href="product-single.html" class="wrap-pic-w bo-all-1 bocl12 hov8 trans-04">
										<img src="images/product-41.jpg" alt="PRODUCT">
									</a>
								</div>

								<div class=" col-sm-7 col-lg-8">
									<div class="p-t-5 p-b-20">
										<div class="flex-w flex-sb-m">
											<a href="product-single.html" class="txt-m-120 cl3 hov-cl10 trans-04 m-r-20 js-name1">
												Cà chua 
											</a>

											<a href="wishlist.html" class="lh-00 pos-relative how-icon1 m-tb-15 js-addwish1">
												<img class="icon-main trans-04" src="images/icons/icon-heart-color.png" alt="ICON">
												<img class="ab-t-l icon-hov trans-04" src="images/icons/icon-heart-color2.png" alt="ICON">
											</a>
										</div>

										<span class="txt-m-117 cl9">
											12vnd
										</span>

										<p class="txt-s-101 cl6 p-t-18">
											farm
										</p>

										<div class="flex-w p-t-29">
											<button class="flex-c-m txt-s-103 cl0 bg10 size-a-2 hov-btn2 trans-04 js-addcart1">
												Thêm vào giỏ
											</button>
										</div>	
									</div>
								</div>
							</div>

							<div class="row p-b-30">
								<div class=" col-sm-5 col-lg-4">
									<a href="product-single.html" class="wrap-pic-w bo-all-1 bocl12 hov8 trans-04">
										<img src="images/product-42.jpg" alt="PRODUCT">
									</a>
								</div>

								<div class=" col-sm-7 col-lg-8">
									<div class="p-t-5 p-b-20">
										<div class="flex-w flex-sb-m">
											<a href="product-single.html" class="txt-m-120 cl3 hov-cl10 trans-04 m-r-20 js-name1">
												Cà chua
											</a>

											<a href="wishlist.html" class="lh-00 pos-relative how-icon1 m-tb-15 js-addwish1">
												<img class="icon-main trans-04" src="images/icons/icon-heart-color.png" alt="ICON">
												<img class="ab-t-l icon-hov trans-04" src="images/icons/icon-heart-color2.png" alt="ICON">
											</a>
										</div>

										<span class="txt-m-117 cl9">
											9vnd
										</span>

										<p class="txt-s-101 cl6 p-t-18">
											farm
										</p>

										<div class="flex-w p-t-29">
											<button class="flex-c-m txt-s-103 cl0 bg10 size-a-2 hov-btn2 trans-04 js-addcart1">
												Thêm vào giỏ
											</button>
										</div>	
									</div>
								</div>
							</div>

							<div class="row p-b-30">
								<div class=" col-sm-5 col-lg-4">
									<a href="product-single.html" class="wrap-pic-w bo-all-1 bocl12 hov8 trans-04">
										<img src="images/product-43.jpg" alt="PRODUCT">
									</a>
								</div>

								<div class=" col-sm-7 col-lg-8">
									<div class="p-t-5 p-b-20">
										<div class="flex-w flex-sb-m">
											<a href="product-single.html" class="txt-m-120 cl3 hov-cl10 trans-04 m-r-20 js-name1">
												Cà chua
											</a>

											<a href="wishlist.html" class="lh-00 pos-relative how-icon1 m-tb-15 js-addwish1">
												<img class="icon-main trans-04" src="images/icons/icon-heart-color.png" alt="ICON">
												<img class="ab-t-l icon-hov trans-04" src="images/icons/icon-heart-color2.png" alt="ICON">
											</a>
										</div>

										<span class="txt-m-117 cl9">
											15vnd
										</span>

										<p class="txt-s-101 cl6 p-t-18">
											farm
										</p>

										<div class="flex-w p-t-29">
											<button class="flex-c-m txt-s-103 cl0 bg10 size-a-2 hov-btn2 trans-04 js-addcart1">
												Thêm vào giỏ
											</button>
										</div>	
									</div>
								</div>
							</div>

							<div class="row p-b-30">
								<div class=" col-sm-5 col-lg-4">
									<a href="product-single.html" class="wrap-pic-w bo-all-1 bocl12 hov8 trans-04">
										<img src="images/product-44.jpg" alt="PRODUCT">
									</a>
								</div>

								<div class=" col-sm-7 col-lg-8">
									<div class="p-t-5 p-b-20">
										<div class="flex-w flex-sb-m">
											<a href="product-single.html" class="txt-m-120 cl3 hov-cl10 trans-04 m-r-20 js-name1">
												Cà chua
											</a>

											<a href="wishlist.html" class="lh-00 pos-relative how-icon1 m-tb-15 js-addwish1">
												<img class="icon-main trans-04" src="images/icons/icon-heart-color.png" alt="ICON">
												<img class="ab-t-l icon-hov trans-04" src="images/icons/icon-heart-color2.png" alt="ICON">
											</a>
										</div>

										<span class="txt-m-117 cl9">
											38vnd
										</span>

										<p class="txt-s-101 cl6 p-t-18">
											farm
										</p>

										<div class="flex-w p-t-29">
											<button class="flex-c-m txt-s-103 cl0 bg10 size-a-2 hov-btn2 trans-04 js-addcart1">
												Thêm vào giỏ
											</button>
										</div>	
									</div>
								</div>
							</div>

							<div class="row p-b-30">
								<div class=" col-sm-5 col-lg-4">
									<a href="product-single.html" class="wrap-pic-w bo-all-1 bocl12 hov8 trans-04">
										<img src="images/product-45.jpg" alt="PRODUCT">
									</a>
								</div>

								<div class=" col-sm-7 col-lg-8">
									<div class="p-t-5 p-b-20">
										<div class="flex-w flex-sb-m">
											<a href="product-single.html" class="txt-m-120 cl3 hov-cl10 trans-04 m-r-20 js-name1">
												Onion
											</a>

											<a href="wishlist.html" class="lh-00 pos-relative how-icon1 m-tb-15 js-addwish1">
												<img class="icon-main trans-04" src="images/icons/icon-heart-color.png" alt="ICON">
												<img class="ab-t-l icon-hov trans-04" src="images/icons/icon-heart-color2.png" alt="ICON">
											</a>
										</div>

										<span class="txt-m-117 cl9">
											9vnd
										</span>

										<p class="txt-s-101 cl6 p-t-18">
											On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment.
										</p>

										<div class="flex-w p-t-29">
											<button class="flex-c-m txt-s-103 cl0 bg10 size-a-2 hov-btn2 trans-04 js-addcart1">
												Thêm vào giỏ
											</button>
										</div>	
									</div>
								</div>
							</div>

							<div class="row p-b-30">
								<div class=" col-sm-5 col-lg-4">
									<a href="product-single.html" class="wrap-pic-w bo-all-1 bocl12 hov8 trans-04">
										<img src="images/product-46.jpg" alt="PRODUCT">
									</a>
								</div>

								<div class=" col-sm-7 col-lg-8">
									<div class="p-t-5 p-b-20">
										<div class="flex-w flex-sb-m">
											<a href="product-single.html" class="txt-m-120 cl3 hov-cl10 trans-04 m-r-20 js-name1">
												Eggplant
											</a>

											<a href="wishlist.html" class="lh-00 pos-relative how-icon1 m-tb-15 js-addwish1">
												<img class="icon-main trans-04" src="images/icons/icon-heart-color.png" alt="ICON">
												<img class="ab-t-l icon-hov trans-04" src="images/icons/icon-heart-color2.png" alt="ICON">
											</a>
										</div>

										<span class="txt-m-117 cl9">
											18vnd
										</span>

										<p class="txt-s-101 cl6 p-t-18">
											These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing .
										</p>

										<div class="flex-w p-t-29">
											<button class="flex-c-m txt-s-103 cl0 bg10 size-a-2 hov-btn2 trans-04 js-addcart1">
												Thêm vào giỏ
											</button>
										</div>	
									</div>
								</div>
							</div>
						</div>

						<!-- Pagination -->
						<div class="flex-w flex-c-m p-t-47">
							<a href="#" class="flex-c-m txt-s-115 cl6 size-a-23 bo-all-1 bocl15 hov-btn1 trans-04 m-all-3 active-pagi1">
								1
							</a>

							<a href="#" class="flex-c-m txt-s-115 cl6 size-a-23 bo-all-1 bocl15 hov-btn1 trans-04 m-all-3">
								2
							</a>

							<a href="#" class="flex-c-m txt-s-115 cl6 size-a-24 how-btn1 bo-all-1 bocl15 hov-btn1 trans-04 m-all-3 p-b-1">
								Next
								<span class="lnr lnr-chevron-right m-t-3 m-l-7"></span>
								<span class="lnr lnr-chevron-right m-t-3"></span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>