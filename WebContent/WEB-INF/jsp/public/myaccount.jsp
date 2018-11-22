<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section class="how-overlay2 bg-img1" style="background-image: url('${pageContext.request.contextPath }/templates/public/images/post.jpg');">
		<div class="container">
			<div class="txt-center p-t-160 p-b-165">
				<h2 class="txt-l-101 cl0 txt-center p-b-14 respon1">
					Tài Khoản
				</h2>

				<span class="txt-m-201 cl0 flex-c-m flex-w">
					<a href="${pageContext.request.contextPath }/" class="txt-m-201 cl0 hov-cl10 trans-04 m-r-6">
						Home
					</a>

					<span>
						/ My Account
					</span>
				</span>
			</div>
		</div>
	</section>

	<!-- content page -->
	<div class="bg0 p-t-95 p-b-70">
		<div class="container">
			<!-- Tab03 -->
			<div class="tab03">
				<div class="row">
					<div class="col-md-3 col-lg-2 p-b-30">
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item p-b-16">
								<img src="${pageContext.request.contextPath }/templates/public/images/tenor.gif" alt="PRODUCT">
							</li>
							<li class="nav-item p-b-16">
								<a class="nav-link active" data-toggle="tab" href="#accountdetail" role="tab">Thông Tin Tài Khoản</a>
							</li>

							<li class="nav-item p-b-16">
								<a class="nav-link" data-toggle="tab" href="#dashboard" role="tab">Thống Kê</a>
							</li>

							<li class="nav-item p-b-16">
								<a class="nav-link" data-toggle="tab" href="#orders" role="tab">Đơn Đặt Hàng</a>
							</li>

							<li class="nav-item p-b-16">
								<a class="nav-link" data-toggle="tab" href="#addresses" role="tab">Địa Chỉ</a>
							</li>

							<li class="nav-item p-b-16">
								<a class="nav-link" data-toggle="tab" href="#changepassword" role="tab">Đổi Mật Khẩu</a>
							</li>

							<li class="nav-item p-b-16">
								<a class="nav-link" href="${pageContext.request.contextPath }/logout-member">Đăng Xuất</a>
							</li>
						</ul>
					</div>
						
					<div class="col-md-9 col-lg-10 p-b-30">
						<!-- Tab panes -->
						<div class="tab-content p-l-70 p-l-0-lg">
							<!--!Detail- -->
							<div class="tab-pane fade show active" id="accountdetail" role="tabpanel">
								
								<form action="" method="POST" role="form">
									<legend>Thông Tin</legend>
									<div class="form-group">
										<label for="">Họ Và Tên</label>
										<input id="n" disabled type="text" class="form-control" <c:if test="${userInfo != null}"> value="${userInfo.fullname}"</c:if> value="">
									</div>
									<div class="form-group">
										<label for="">Số Điện Thoại</label>
										<input id="p" disabled type="text" class="form-control" <c:if test="${userInfo != null}"> value="${userInfo.phone}"</c:if> value="">
									</div>
									<div class="form-group">
										<label for="">Địa Chỉ</label>
										<input id="a" disabled type="text" class="form-control" <c:if test="${userInfo != null}"> value="${userInfo.address}"</c:if> value="">
									</div>
									<div class="form-group">
										<label for="">Email</label>
										<input id="e" disabled type="text" class="form-control" <c:if test="${userInfo != null}"> value="${userInfo.email}"</c:if> value="">
									</div>
									<button id="bcn" onclick="edit()" type="button" class="btn btn-warning">Cập Nhật</button>
									<button id="bs" onclick="dedit()" style="display:none" type="button" class="btn btn-success">Lưu</button>
									<button id="bc" onclick="dedit()" style="display:none" type="button" class="btn btn-danger">Hủy</button>
								</form>
							</div>
							<script>
							function edit(){
								document.getElementById('n').removeAttribute('disabled');
								document.getElementById('p').removeAttribute('disabled');
								document.getElementById('a').removeAttribute('disabled');
								document.getElementById('e').removeAttribute('disabled');
								document.getElementById('bcn').setAttribute('style','display:none');
								document.getElementById('bs').removeAttribute('style');
								document.getElementById('bc').removeAttribute('style');
							}
							function dedit(){
								document.getElementById('n').setAttribute('disabled','');
								document.getElementById('p').setAttribute('disabled','');
								document.getElementById('a').setAttribute('disabled','');
								document.getElementById('e').setAttribute('disabled','');
								document.getElementById('bs').setAttribute('style','display:none');
								document.getElementById('bc').setAttribute('style','display:none');
								document.getElementById('bcn').removeAttribute('style');
							}
							</script>
							<!-- - -->
							<div class="tab-pane fade" id="dashboard" role="tabpanel">
								<p>
									Thống kê
								</p>
							</div>
							<!-- - -->
							<div class="tab-pane fade" id="orders" role="tabpanel">
								<div class="bo-all-1 bocl15 flex-w flex-sb-m p-rl-30 p-tb-10 p-rl-15-ssm">
									<div class="flex-t p-tb-8 m-r-30">
										<img class="m-t-6 m-r-10" src="${pageContext.request.contextPath }/templates/public/images/icons/icon-list.png" alt="IMG">
										<span class="size-w-53 txt-s-101 cl6">
											Chưa có sản phẩm nào được order.
										</span>
									</div>

									<a href="shop-sidebar-grid.html" class="flex-c-m txt-s-105 cl0 bg10 size-a-42 hov-btn2 trans-04 p-rl-10 m-tb-8">
										Mua ngay
									</a>
								</div>
							</div>

							<!-- - -->
							<div class="tab-pane fade" id="addresses" role="tabpanel">
								<p class="txt-s-101 cl6">
									Các địa chỉ bên dưới sẽ được dùng để thanh toán mặc định
								</p>

								<div class="flex-w flex-sb p-t-37">
									<div class="size-w-63 flex-t w-full-sm p-b-35">
										<div class="size-w-53 p-r-30">
											<h5 class="txt-m-109 cl3 p-b-7">
												Địa chỉ thanh toán
											</h5>

											<p class="txt-s-101 cl6">
												Chưa được thiết lập
											</p>
										</div>

										<a href="#" class="txt-s-115 cl10 hov12 hov-cl10 p-t-6">
											Edit
										</a>
									</div>

									<div class="size-w-63 flex-t w-full-sm p-b-35">
										<div class="size-w-53 p-r-30">
											<h5 class="txt-m-109 cl3 p-b-7">
												Địa chỉ giao hàng
											</h5>

											<p class="txt-s-101 cl6">
												Chưa được thiết lập
											</p>
										</div>

										<a href="#" class="txt-s-115 cl10 hov12 hov-cl10 p-t-6">
											Edit
										</a>
									</div>
								</div>
							</div>

							<!-- - -->
							<div class="tab-pane fade" id="changepassword" role="tabpanel">
								<form>
									<div class="row">
										<h5 class="txt-m-109 cl3 p-rl-15 p-t-10 p-b-17">
											Thay đổi password
										</h5>

										<div class="col-12 p-b-23">
											<div>
												<div class="txt-s-101 cl6 p-b-10">
													Passwork hiện tại
												</div>

												<input class="txt-s-120 cl3 size-a-21 bo-all-1 bocl15 p-rl-20 focus1" type="text" name="current-pw">
											</div>
										</div>

										<div class="col-12 p-b-23">
											<div>
												<div class="txt-s-101 cl6 p-b-10">
													Passwork mới
												</div>

												<input class="txt-s-120 cl3 size-a-21 bo-all-1 bocl15 p-rl-20 focus1" type="text" name="new-pw">
											</div>
										</div>

										<div class="col-12 p-b-23">
											<div>
												<div class="txt-s-101 cl6 p-b-10">
													Nhập lại password
												</div>

												<input class="txt-s-120 cl3 size-a-21 bo-all-1 bocl15 p-rl-20 focus1" type="text" name="cf-new-pw">
											</div>
										</div>

										<div class="flex-w p-rl-15 p-t-17">
											<button class="flex-c-m txt-s-105 cl0 bg10 size-a-43 hov-btn2 trans-04 p-rl-10">
												Lưu
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>