<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div class="bg0 p-t-95 p-b-50">
	<div class="container">
		<form action="${pageContext.request.contextPath}/payment"
					method="post">
		<div class="row">
			<div class="col-md-7 col-lg-8 p-b-50">
				<div>
					<h4 class="txt-m-124 cl3 p-b-28">Chi Tiết Đơn Hàng</h4>

					<div class="row p-b-50">
						<div class="col-sm-6 p-b-23">
							<div>
								<div class="txt-s-101 cl6 p-b-10">
									Họ Và Tên:  <span style="font-size: 20px;color: #7CA73E">${setInfo.name_customer }</span>
								</div>
								

								
							</div>
						</div>

						<div class="col-12 p-b-23">
							<div>
								<div class="txt-s-101 cl6 p-b-10">
									Đại Chỉ : <span style="font-size: 20px;color: #7CA73E" >${setInfo.place }</span>
								</div>
							</div>
						</div>


						<div class="col-sm-6 p-b-23">
							<div>
								<div class="txt-s-101 cl6 p-b-10">
									Số Điện Thoại : <span style="font-size: 20px; color: #7CA73E">${setInfo.phone }</span>
								</div>

							
							</div>
						</div>
						
					
						 <div class="col-sm-6 p-b-23">
							<div>
								<div class="txt-s-101 cl6 p-b-10">
									Email : <span style="font-size: 20px; color: #7CA73E">${setInfo.email }</span>
								</div>
							</div>
						</div>

					


					</div>

					<h4 class="txt-m-124 cl3 p-b-19"></h4>

					<div>
						<div class="txt-s-101 cl6 p-b-10">Ghi Chú Order</div>

						<textarea
							class="plh2 txt-s-120 cl3 size-a-38 bo-all-1 bocl15 p-rl-20 p-tb-10 focus1"
							name="note" placeholder="Ghi Chú Order Của Bạn " style="font-size: 20px; color: #7CA73E">${setInfo.note }</textarea>
					</div>
				</div>
			</div>

			<div class="col-md-5 col-lg-4 p-b-50">
				<div class="how-bor4 p-t-35 p-b-40 p-rl-30 m-t-5">
					<h4 class="txt-m-124 cl3 p-b-11">Sản Shẩm Order</h4>

					<div
						class="flex-w flex-sb-m txt-m-103 cl6 bo-b-1 bocl15 p-b-21 p-t-18">
						<span> Sản Phẩm </span> <span> Tiền </span>
					</div>
					<c:forEach items="${listCart}" var="objCart">
						<c:set var="name" value="${objCart.name}"></c:set>
						<c:set var="id" value="${objCart.id_product}"></c:set>
						<c:set var="gia" value="${objCart.price}"></c:set>
						<c:set var="slug" value="${slugUtil.makeSlug(name)}"></c:set>
						<c:set var="soluong" value="${objCart.quatity}"></c:set>
						<c:set var="thanhtien" value="${soluong*gia}"></c:set>
						<c:set var="tongtien" value="${tongtien+thanhtien}"></c:set>
						<!--  -->
						<div
							class="flex-w flex-sb-m txt-s-101 cl6 bo-b-1 bocl15 p-b-21 p-t-18">
							<span> ${name } <img class="m-rl-3"
								src="${pageContext.request.contextPath }/templates/public/images/icons/icon-multiply.png"
								alt="icon"> ${soluong}
							</span> <span> $${thanhtien} </span>
						</div>
					</c:forEach>



					<div class="flex-w flex-m txt-m-103 p-tb-23">
						<span class="size-w-61 cl6"> Tổng Cộng: </span> <span
							class="size-w-62 cl10"> $${tongtien } </span>
					</div>

					<div class="bo-all-1 bocl15 p-b-25 m-b-30">


					
							<div class="flex-w flex-m bo-b-1 bocl15 p-rl-20 p-tb-16">
						
							 <label
									class="txt-m-103 cl6" style="color: #7CA73E" for="radio2">Thanh Toán:  ${setInfo.pay } </label>
							</div>
					</div>
					<button type="submit"
						class="flex-c-m txt-s-105 cl0 bg10 size-a-21 hov-btn2 trans-04 p-rl-10">
						Thanh Toán</button>
						<br />
					<a href="javaScript:window.history.back();"><button
						class="flex-c-m txt-s-105 cl0 bg10 size-a-21 hov-btn2 trans-04 p-rl-10">
						Quay Lại</button></a>	
					
				</div>
			</div>
		</div>
</form>
	</div>
</div>
