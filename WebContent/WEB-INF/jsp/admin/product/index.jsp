<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> Sản Phẩm
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i><a
						href="${pageContext.request.contextPath}/admin">Home</a></li>
					<li><i class="fa fa-laptop"></i><a
						href="${pageContext.request.contextPath }/admin/product">Sản
							Phẩm</a></li>
				</ol>
			</div>
		</div>
		<h4>
			<p style="color: green; font-family: cursive;">${msg}</p>
		</h4>

		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<ul style="margin-left: 400px; padding-top: 20px">
						<li>
							<form
								action="${pageContext.request.contextPath }/admin/product/search"
								method="post" class="navbar-form">
								<input class="form-control" name="name" placeholder="Search"
									type="text"> <input class="btn btn-primary"
									type="submit" name="search" value="Tìm kiếm" />
							</form>
						</li>
					</ul>

					<a href="${pageContext.request.contextPath }/admin/product/add"
						class="btn btn-success"><strong
						class="glyphicon glyphicon-plus"></strong><span class="bt_green_r"></span></a>
					<a href="javascript:void(0)" class="btn btn-danger"
						data-toggle="modal"
						onclick="confirm('Bạn có muốn xóa những liên hệ này không ?') ? $('#form-product').submit() : false;"
						class="bt_red"><strong>Xóa Nhiều Sản Phẩm</strong><span
						class="bt_red_r"></span></a>
					<table class="table table-striped table-advance table-hover">
						<tbody>
							<tr>
								<th><i class="icon_pin_alt"></i></th>
								<th><i class="icon_pin_alt"></i> ID</th>
								<th><i class="icon_profile"></i> Tên Sản Phẩm</th>
								<th><i class="icon_profile"></i> Hình Ảnh</th>
								<th><i class="icon_profile"></i> Mô Tả</th>
								<th><i class="icon_mobile"></i> Ngày Nhập</th>
								<th><i class="icon_cogs"></i> Giá</th>
								<th><i class="icon_cogs"></i> Giảm Giá</th>
								<th><i class="icon_cogs"></i> Trạng Thái</th>
								<th><i class="icon_cogs"></i> Chức Năng</th>
							</tr>

							<form id="form-product"
								action="${pageContext.request.contextPath }/admin/product/dels"
								method="post">
								<c:forEach var="objProduct" items="${alProduct}">
									<tr>
										<td><input type="checkbox" name="selected"
											value="${objProduct.id_product }" /></td>
										<td>${objProduct.id_product }</td>
										<td>${objProduct.name }</td>
										<c:set var="val" value="${objProduct.picture}" />
										<c:choose>
											<c:when test="${val ne ''}">
												<td class="center text-center"><img
													style='width: 60px;'
													src="${pageContext.request.contextPath}/files/${objProduct.picture}" />
												</td>
											</c:when>
											<c:otherwise>
												<td class="center text-center"><img
													style='width: 60px;'
													src="${pageContext.request.contextPath}/templates/admin/images/NO-IMAGE.png" />
												</td>

											</c:otherwise>

										</c:choose>
										<td>${objProduct.preview}</td>
										<td>${objProduct.date_create }</td>
										<td>$${objProduct.price }</td>
										<td>${objProduct.discount }%</td>
										<td><c:set
												value="${pageContext.request.contextPath}/templates/admin/images/deactive.gif"
												var="URLlock">
											</c:set> <c:set
												value="${pageContext.request.contextPath}/templates/admin/images/active.gif"
												var="URLtick"></c:set> <c:choose>
												<c:when test="${objProduct.active == 1 }">
													<div style="text-align: center"
														id="html${objProduct.id_product }">
														<a href="javascript:void(0)"
															onclick="return changes${objProduct.id_product}()"><img
															id="img${objProduct.id_product}" width="15px"
															height="15px" src="${URLtick }" alt="tick" /></a>
													</div>
												</c:when>
												<c:otherwise>
													<div style="text-align: center"
														id="html${objProduct.id_product }">
														<a href="javascript:void(0)"
															onclick="return changes${objProduct.id_product}()"><img
															id="img${objProduct.id_product}" width="15px"
															height="15px" src="${URLlock }" alt="lock" /></a>
													</div>
												</c:otherwise>

											</c:choose></td>



										<td>
											<div class="btn-group">
												<a class="btn btn-primary"
													href="${pageContext.request.contextPath }/admin/product/edit/${objProduct.id_product }"><i
													class="glyphicon glyphicon-pencil"></i></a> <a
													class="btn btn-danger"
													href="${pageContext.request.contextPath }/admin/product/del/${objProduct.id_product }"><i
													class="icon_close_alt2"></i></a>
											</div>
										</td>



									</tr>

									<script>
										function changes${objProduct.id_product}(){
										var img = $('#img${objProduct.id_product}').attr('src')
										var id = ${objProduct.id_product};
										$.ajax({
											url: '${pageContext.request.contextPath }/admin/product/ajax',
											type: 'POST',
											cache: false, 
											data: {
												//Dữ liệu gửi đi
												aimg:img,
												aid: id,
											},
											success: function(data){
												$('#html${objProduct.id_product}').html(data);
									
											},
											error: function (){
												// Xử lý nếu có lỗi
												alert("Có lỗi trong quá trình xử lý");
											}
										});
									}
									</script>

								</c:forEach>
							</form>
						</tbody>
					</table>
					<div class="text-center">
						<ul class="pagination">
							<c:choose>
								<c:when test="${sumPage == 1 || sumPage == 0}">
									<p>Trang 1 / 1</p>
								</c:when>
								<c:otherwise>
									<c:set var="back" value="0"></c:set>
									<c:set var="next" value="0"></c:set>
									<c:set var="num" value="1"></c:set>
									<c:set var="loop" value="${sum }"></c:set>
									<c:set var="total" value="${sumPage }"></c:set>
									<c:set var="pages" value="${current_page }"></c:set>
									<c:choose>
										<c:when test="${pages == 1 }">
											<c:set var="back" value="1"></c:set>
										</c:when>
										<c:otherwise>
											<c:set var="back" value="${pages - 1 }"></c:set>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${pages == total }">
											<c:set var="next" value="${total }"></c:set>
										</c:when>
										<c:otherwise>
											<c:set var="next" value="${pages + 1 }"></c:set>
										</c:otherwise>
									</c:choose>
									<c:if test="${total <= sum }">
										<c:set var="loop" value="${total }"></c:set>
									</c:if>
									<c:if test="${pages > sum - 2}">
										<c:set var="loop" value="${pages + 2 }"></c:set>
										<c:set var="num" value="${pages - 2 }"></c:set>
										<c:if test="${loop >= total }">
											<c:set var="loop" value="${total }"></c:set>
											<c:set var="num" value="${total - sum + 1 }"></c:set>
										</c:if>
									</c:if>
									<p>Trang ${pages } / ${total }</p>
									<c:if test="${pages != 1 }">
										<li><a
											href="${pageContext.request.contextPath }/admin/product?page=${back}"
											aria-label="Previous">«</a></li>
									</c:if>
									<c:forEach var="i" begin="${num }" end="${loop}">
										<c:choose>
											<c:when test="${pages == i }">
												<li><a style="background: #FFCCFF"
													style="border-radius">${i}</a></li>
											</c:when>
											<c:otherwise>
												<li><a
													href="${pageContext.request.contextPath }/admin/product?page=${i}">${i }</a></li>

											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${pages != total }">
										<li><a
											href="${pageContext.request.contextPath }/admin/product?page=${next}"
											aria-label="Next">»</a></li>
									</c:if>
								</c:otherwise>
							</c:choose>

						</ul>
					</div>
				</section>

			</div>
		</div>
	</section>
</section>