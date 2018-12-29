<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp"%>
<section class="how-overlay2 bg-img1"
	style="background-image: url(${pageContext.request.contextPath }/templates/public/images/post.jpg);">
	<div class="container">
		<div class="txt-center p-t-160 p-b-165">
			<h2 class="txt-l-101 cl0 txt-center p-b-14 respon1">Giỏ hàng</h2>

			<span class="txt-m-201 cl0 flex-c-m flex-w"> <a
				href="${pageContext.request.contextPath }/"
				class="txt-m-201 cl0 hov-cl10 trans-04 m-r-6"> Home </a> <span>
					/ Cart </span>
			</span>
		</div>
	</div>
</section>

<!-- content page -->
<div class="bg0 p-tb-100">


	<div class="container">
		<c:choose>
			<c:when test="${empty listCart}">
				<div
					class="bo-all-1 bocl15 flex-w flex-sb-m p-rl-30 p-tb-10 p-rl-15-ssm">
					<div class="flex-t p-tb-10 m-r-30">
						<img class="m-t-6 m-r-10"
							src="${pageContext.request.contextPath }/templates/public/images/icons/icon-list.png"
							alt="IMG"> <span class="size-w-53 txt-s-101 cl6">
							Chưa Có Sản Phẩm Nào Được Order. </span>
					</div>

					<a href="${pageContext.request.contextPath }/"
						class="flex-c-m txt-s-105 cl0 bg10 size-a-42 hov-btn2 trans-04 p-rl-10 m-tb-8">
						Mua Ngay </a>
				</div>
			</c:when>

			<c:otherwise>

				<div class="wrap-table-shopping-cart">
					<table class="table-shopping-cart">
						<tr class="table_head bg12">
							<th class="column-1 p-l-30">Sản Phẩm</th>
							<th class="column-2">Giá</th>
							<th class="column-3">Số Lượng</th>
							<th class="column-4">Tiền</th>
						</tr>

						<c:forEach items="${listCart}" var="objCart">
							<c:set var="urlDetail"
								value="${pageContext.request.contextPath}/san-pham-${slugUtil.createSlug(objProduct.name) }-${objProduct.id_product }.html"></c:set>
							<c:set var="name" value="${objCart.name}"></c:set>
							<c:set var="id" value="${objCart.id_product}"></c:set>
							<c:set var="gia" value="${objCart.price}"></c:set>
							<c:set var="slug" value="${slugUtil.makeSlug(name)}"></c:set>
							<c:set var="soluong" value="${objCart.quatity}"></c:set>
							<c:set var="thanhtien" value="${soluong*gia}"></c:set>
							<c:set var="tongtien" value="${tongtien+thanhtien}"></c:set>


							<tr class="table_row" id="tien">
								<td class="id" style="display: none;">${id}</td>
								<td class="column-1">
									<div class="flex-w flex-m">
										<div class="wrap-pic-w size-w-50 bo-all-1 bocl12 m-r-30">
											<a href="${urlDetail }"><img width="118px"
												height="99.31px"
												src="${pageContext.request.contextPath }/files/${objCart.picture}"
												alt="${objCart.name}"></a>
										</div>

										<span> ${name } </span>
									</div>
								</td>
								<td class="column-2" id="gia">$${gia}</td>
								<td class="column-3" id="soluong">
									<%-- <div class="wrap-num-product flex-w flex-m bg12 p-rl-10">
									<div class="btn-num-product-down flex-c-m fs-29"></div>
							
									<input class="txt-m-102 cl6 txt-center num-product" onchange="soLuong(this.value,${id},${gia})" value="${soluong}" title="Qty" min="1"
										type="number" name="cart[10522][qty]">

									<div class="btn-num-product-up flex-c-m fs-16"></div>
									
								
								</div> --%> <input type="number" min="1" max="10"
									style="color: #A4A4A4;" name="cart[10522][qty]"
									onchange="soLuong(this.value,${id},${gia})" value="${soluong}"
									size="1" title="Qty" type="number" class="input-text qty"
									size="1" class="w30">
								</td>
								<td class="column-4">
									<div class="flex-w flex-sb-m">
										<span id="thanhtien${id}"> $${thanhtien} </span>

										<div class="fs-15 hov-cl10 pointer">
											<a  href="${pageContext.request.contextPath}/huy/${id}"><span
												class="lnr lnr-cross"></span></a>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>




					</table>
				</div>

				<div class="flex-w flex-sb-m p-t-20">
					<!-- <div class="flex-w flex-m m-r-50 m-tb-10">
						<input id="discount"
							class="size-a-31 bo-all-1 bocl15 txt-s-123 cl6 plh1 p-rl-20 focus1 m-r-30 m-tb-10"
							type="text" name="discount" placeholder="Mã giảm giá">

						<div
							class="flex-c-m txt-s-105 cl0 bg10 size-a-32 hov-btn2 trans-04 pointer p-rl-10 m-tb-10">
							Áp dụng</div>
					</div> -->



					<div class="flex-w flex-m m-r-50 m-tb-10">

						<a href="javaScript:window.history.back();"><div
								class="flex-c-m txt-s-105 cl0 bg10 size-a-32 hov-btn2 trans-04 pointer p-rl-10 m-tb-10">
								Tiếp Tục Mua Hàng</div></a>
					</div>

					<div class="flex-col-l p-t-68">
						<div class="flex-w flex-m bo-b-1 bocl15 w-full p-tb-18">
							<span class="size-w-58 txt-m-109 cl3"> Tổng Tiền: </span> <span
								class="size-w-59 txt-m-104 cl6" id="tongtien"> $${tongtien }
							</span>
						</div>

						<!-- <div class="flex-w flex-m bo-b-1 bocl15 w-full p-tb-18">
						<span class="size-w-58 txt-m-109 cl3">
							Thành Tiền
						</span>

						<span class="size-w-59 txt-m-104 cl10">
							48000vnd
						</span>
					</div> -->


						<button
							class="flex-c-m txt-s-105 cl0 bg10 size-a-34 hov-btn2 trans-04 p-rl-10 m-t-43">
							<a class="txt-s-101 cl9 hov-cl10 trans-04" style="color: white"
								href="${pageContext.request.contextPath }/thanh-toan">Thanh
								toán</a>

						</button>


					</div>


				</div>
			</c:otherwise>

		</c:choose>


	</div>
</div>


<script>
	function soLuong(soluong , id, gia) {
		
			var money = soluong * gia;
		
			
			
			$.ajax({
				url : '${pageContext.request.contextPath}/editsoluong',
				type : 'POST',
				cache : false, //True khi muon luu lai cac requet .
				data : {
					id : id,
					soluong : soluong,

				//Dữ liệu gửi đi
				},

				success : function(data) {
					var tt = '#thanhtien' + id;
					$(tt).text(money);
					$('#tongtien').html(data);

				},
				error : function() {
					alert('Có lỗi xảy ra');
				}
			});
			return false;
	}
</script>


