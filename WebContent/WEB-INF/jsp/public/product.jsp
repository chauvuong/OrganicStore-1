<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section class="how-overlay2 bg-img1"
	style="background-image: url('${pageContext.request.contextPath }/templates/public/images/post.jpg');">
	<div class="container">
		<div class="txt-center p-t-160 p-b-165">
			<h2 class="txt-l-101 cl0 txt-center p-b-14 respon1">shop</h2>

			<span class="txt-m-201 cl0 flex-c-m flex-w"> <a
				href="home.htm" class="txt-m-201 cl0 hov-cl10 trans-04 m-r-6">
					Home </a> <span> / Sản phẩm </span>
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
						<input class="s-full bo-all-1 bocl15 p-rl-20" type="text"
							id="search" placeholder="Search sản phẩm..."
							onchange="getsearch()">
						<button class="flex-c-m fs-18 size-a-22 ab-t-r hov11"
							onclick="filter()">
							<img class="hov11-child trans-04"
								src="${pageContext.request.contextPath }/templates/public/images/icons/icon-search.png"
								alt="ICON">
						</button>
					</div>

					<!--  -->
					<hr />
					<!--  -->
					<div>
						<h4 class="txt-m-101 cl3 p-b-20">DANH MỤC</h4>

						<ul>

							<c:forEach var="objCat" items="${listCat}">
								<li class="p-b-5"><a href="javascript:void(0)"
									id="cat${objCat.id_cat}" onclick="getcat(${objCat.id_cat})"
									class="flex-sb-m flex-w txt-s-101 cl6 hov-cl10 trans-04 p-tb-3">
										<span class="m-r-10"> ${objCat.name} </span> <span>
											${productDao.countNewPublicCat(objCat.id_cat)} </span>
								</a></li>
							</c:forEach>
						</ul>
					</div>
					<hr />
					<!--  -->
					<div>
						<h4 class="txt-m-101 cl3 p-b-20">THEO GIÁ</h4>

						<ul>
							<li class="p-b-5"><label> <input class="brand"
									name="price" onclick="getprice()" value="1" type="checkbox"
									value=""> Dưới $5
							</label></li>

							<li class="p-b-5"><label> <input class="brand"
									name="price" onclick="getprice()" value="2" type="checkbox"
									value=""> Từ $5 đến $10

							</label></li>

							<li class="p-b-5"><label> <input class="brand"
									name="price" onclick="getprice()" value="3" type="checkbox"
									value=""> Từ $10 đến $20
							</label></li>

							<li class="p-b-5"><label> <input class="brand"
									name="price" onclick="getprice()" value="4" type="checkbox"
									value=""> Trên $20
							</label></li>
						</ul>
					</div>
					<hr />
					<!--Rating -->
					<div>
						<h4 class="txt-m-101 cl3 p-b-20">ĐÁNH GIÁ</h4>
						<div class="rating-wrap-post" style="cursor: pointer">
							<i id="1" class="fa fa-star" onclick="getrating('1')"></i> <i
								id="2" class="fa fa-star" onclick="getrating('2')"></i> <i
								id="3" class="fa fa-star" onclick="getrating('3')"></i> <i
								id="4" class="fa fa-star" onclick="getrating('4')"></i> <i
								id="5" class="fa fa-star" onclick="getrating('5')"></i> Trở lên
							<input style="display: none" type="number" style="width:50px;"
								value="" id="star">

						</div>
						<script language="javascript">

						</script>
					</div>
					<hr />
					<!--  -->
				</div>
			</div>

			<div class="col-sm-10 col-md-8 col-lg-9 m-rl-auto p-b-50">
				<div>
					<div class="flex-w flex-r-m p-b-45 flex-row-rev">
						<div class="flex-w flex-m p-tb-8">
							<div
								class="rs1-select2 bg0 size-w-52 bo-all-1 bocl15 m-tb-7 m-r-15">
								<select class="js-select2" name="sort" onchange="getsort()">
									<option value="1">Sắp xếp theo độ phổ biến</option>
									<option value="2">Sắp xếp theo giá từ thấp đến cao</option>
									<option value="3">Sắp xếp theo giá từ cao đến thấp</option>
								</select>
								<div class="dropDownSelect2"></div>
							</div>

							<div class="flex-w flex-m m-tb-7">


								<button
									class="dis-block lh-00 pos-relative how-icon1 menu-active js-show-grid">
									<img class="icon-main trans-04"
										src="${pageContext.request.contextPath }/templates/public/images/icons/icon-grid.png"
										alt="ICON"> <img class="ab-t-l icon-hov trans-04"
										src="${pageContext.request.contextPath }/templates/public/images/icons/icon-grid1.png"
										alt="ICON">
								</button>
							</div>
						</div>

						<span class="txt-s-101 cl9 m-r-30 size-w-53"> </span>
					</div>

					<!-- Shop grid -->
					<div class="shop-grid">
						<div class="row">
							<!-- - -->
							<c:forEach var="objProduct" items="${alProduct }">
								<c:set var="urlDetail"
									value="${pageContext.request.contextPath}/san-pham/${slugUtil.createSlug(objProduct.name) }-${objProduct.id_product }.html"></c:set>
								<div class="col-sm-6 col-lg-4 p-b-30">
									<!-- Block1 -->
									<div class="block1">
										<div
											class="block1-bg wrap-pic-w bo-all-1 bocl12 hov3 trans-04">
											<img
												src="${pageContext.request.contextPath }/files/${objProduct.picture}"
												alt="IMG">

											<div class="block1-content flex-col-c-m p-b-46">
												<a href="product-single.html"
													class="txt-m-103 cl3 txt-center hov-cl10 trans-04 js-name-b1">
													${objProduct.name} </a> <span
													class="block1-content-more txt-m-104 cl9 p-t-21 trans-04">
													$${objProduct.price}</span>

												<div class="block1-wrap-icon flex-c-m flex-w trans-05">
													<a href="${urlDetail }"
														class="block1-icon flex-c-m wrap-pic-max-w"> <img
														src="${pageContext.request.contextPath }/templates/public/images/icons/icon-view.png"
														alt="ICON">
													</a> <a href="javascript:void(0)"
														class="block1-icon flex-c-m wrap-pic-max-w js-addcart-b1">
														<img href="javascript:void(0)"
														onclick="sanpham(${objProduct.id_product})"
														src="${pageContext.request.contextPath }/templates/public/images/icons/icon-cart.png"
														alt="ICON">
													</a> <a href="javasrcipt:void(0)"
														class="block1-icon flex-c-m wrap-pic-max-w js-addwish-b1">
														<img class="icon-addwish-b1"
														onclick="addWish(${objProduct.id_product})"
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

					<!-- Pagination -->
					<!-- 	<div class="flex-w flex-c-m p-t-47">
						<a href="#"
							class="flex-c-m txt-s-115 cl6 size-a-23 bo-all-1 bocl15 hov-btn1 trans-04 m-all-3 active-pagi1">
							1 </a> <a href="#"
							class="flex-c-m txt-s-115 cl6 size-a-23 bo-all-1 bocl15 hov-btn1 trans-04 m-all-3">
							2 </a> <a href="#"
							class="flex-c-m txt-s-115 cl6 size-a-24 how-btn1 bo-all-1 bocl15 hov-btn1 trans-04 m-all-3 p-b-1">
							Next <span class="lnr lnr-chevron-right m-t-3 m-l-7"></span> <span
							class="lnr lnr-chevron-right m-t-3"></span>
						</a>
					</div> -->
				</div>
			</div>
		</div>
	</div>
</section>

<script>
var search="";
var cat="";
var price="";
var rating="";
var sort="";
var tempCat = <%=request.getAttribute("tempCat")%>;
document.addEventListener("DOMContentLoaded", function() {
	if(tempCat!=0)
	  getcat(tempCat);
});
function getsearch() {
	search= "s-"+$("#search").val()+"@";
}
function getcat(id){
	for (var i = 1; i < 5; i++) {
		document.getElementById("cat"+i).removeAttribute("style");
	}
	document.getElementById("cat"+id).setAttribute("style","color:red");
	cat="c-"+id+"@";
	filter();
}
function getprice(){
	var fav="";
	$.each($("input[name='price']:checked"), function(){            
	    fav+=$(this).val();
	});
	price="p-"+fav+"@";
	console.log(price);
	filter();
}
function getrating(id) {
	for (var i = 1; i <= 5; i++)
		document.getElementById(i).style.color = '#333';
	for (var i = 1; i <= id; i++)
		document.getElementById(i).style.color = 'yellow';
	document.getElementById('star').value = id;
	rating="r-"+id+"@";
	filter();
}
function getsort(){
	sort= "so-"+$('select[name=sort]').val()+"@";
	filter();
}
function filter() {
	var filter="";
		if(search!="")
			filter+=search;
		if(cat!="")
			filter+=cat;
		if(price!="")
			filter+=price;
		if(rating!="")
			filter+=rating;
		if(sort!="")
			filter+=sort;
		$.ajax({
			url : "${pageContext.request.contextPath}/filter",
			type : 'POST',
			cache : false,
			data : {
				filter :filter,
			},
			success : function(data) {
				$(".shop-grid").html(data);
			},
			error : function() {
				alert('FilterThất Bại!!!')
			}
		});
}
</script>