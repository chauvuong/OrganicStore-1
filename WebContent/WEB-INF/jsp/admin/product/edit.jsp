<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> Hình Thức Thanh Toán
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i><a
						href="${pageContext.request.contextPath }/admin/">Home</a></li>
					<li><i class="fa fa-laptop"></i><a
						href="${pageContext.request.contextPath }/admin/product">Sản
							Phẩm</a></li>
					<li><i class="fa fa-laptop"></i><a
						href="${pageContext.request.contextPath }/admin/product/edit">Sửa
							Sản Phẩm</a></li>
				</ol>
			</div>
		</div>
		<h4>
			<p style="color: green; font-family: cursive;">${msg}</p>
		</h4>
		<c:if test="${err ne null}">

			<h4>
				<p style="color: red; font-family: cursive;">Sản Phẩm Đã Tồn Tại</p>
			</h4>

		</c:if>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<header class="panel-heading"> Sửa Sản Phẩm </header>
					<div class="panel-body">
						<div class="form">
							<form
								action="${pageContext.request.contextPath }/admin/product/edit/${objProduct.id_product}"
								method="post" class="niceform" enctype="multipart/form-data">
								<div class="form-group">
									<label for="exampleInputEmail1">Tên Sản Phẩm:</label> <input
										type="text" class="form-control" name="name"
										value="<c:if test="${objProduct.name ne null}">${objProduct.name}</c:if>"
										id="exampleInputEmail1" placeholder="Nhập Tên Sản Phẩm">

								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Mô Tả:</label> <input
										type="text" class="form-control"
										value="<c:if test="${objProduct.preview ne null}">${objProduct.preview}</c:if>"
										name="preview" id="exampleInputEmail1"
										placeholder="Nhập Mô Tả">

								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Giá ($):</label> <input
										type="text" class="form-control" name="price"
										value="<c:if test="${objProduct.price ne null}">${objProduct.price}</c:if>"
										id="exampleInputEmail1" placeholder="Nhập Giá ($)">

								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Giảm Giá:</label> <input
										type="text" class="form-control" name="discount"
										value="<c:if test="${objProduct.discount ne null}">${objProduct.discount}</c:if>"
										id="exampleInputEmail1" placeholder="Nhập Giá Giảm">

								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Danh Mục:</label> <select
										required="required" size="1" name="id_cat"
										class="form-control m-bot15">
										<c:forEach items="${alCat }" var="objCat">
											<c:choose>
												<c:when test="${objProduct.id_cat  eq objCat.id_cat}">
													<c:set var="acti" value="selected = 'selected' "></c:set>
												</c:when>
												<c:otherwise>
													<c:set var="acti" value=""></c:set>
												</c:otherwise>
											</c:choose>
											<option ${acti} value="${objCat.id_cat}">${objCat.name}</option>
										</c:forEach>
									</select>
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Hình Ảnh:</label> <input
										type="file" class="form-control" name="hinhanh"
										id="exampleInputEmail1" id="upload" />
									<c:if test="${objProduct.picture ne ''}">
										<img style="width: 130px; height: 100px;"
											src="${pageContext.request.contextPath}/files/${objProduct.picture}" />
									</c:if>

								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Chi Tiết:</label>
									<textarea type="text" class="form-control" id="editor1"
										name="details" id="exampleInputEmail1"
										placeholder="Nhập Chi Tiết Sản Phẩm">${objProduct.details}</textarea>

								</div>

								<script>
									var editor1 = CKEDITOR.replace('editor1');
									CKFinder.setupCKEditor(editor1,
											'ProjectShop/templates/ckfinder/');
								</script>




								<input type="submit" value="Lưu" class="btn btn-primary" /> <input
									type="reset" value="Nhập Lại" class="btn btn-danger" />
							</form>
						</div>
					</div>
				</section>
			</div>
		</div>
	</section>
</section>