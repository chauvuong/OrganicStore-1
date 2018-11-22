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
						href="${pageContext.request.contextPath }/admin/product/add">Thêm
							Sản Phẩm</a></li>
				</ol>
			</div>
		</div>
		<c:choose>
			<c:when test="${param['msg'] eq 'add' }">
				<h4>
					<p style="color: red;">Sản Phẩm Đã Tồn Tại</p>
				</h4>
			</c:when>
		</c:choose>
		<h4>
			<p style="color: red;font-family: cursive;" >${msg}</p>
		</h4>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<header class="panel-heading"> Thêm Sản Phẩm </header>
					<div class="panel-body">
						<div class="form">
							<form
								action="${pageContext.request.contextPath }/admin/product/add"
								method="post" class="niceform" enctype="multipart/form-data">
								<div class="form-group">
									<label for="exampleInputEmail1">Tên Sản Phẩm:</label> <input
										type="text" class="form-control" name="name"
										id="exampleInputEmail1" placeholder="Nhập Tên Sản Phẩm">

								</div>
									
								<div class="form-group">
									<label for="exampleInputEmail1">Mô Tả:</label> <input
										type="text" class="form-control" name="preview"
										id="exampleInputEmail1" placeholder="Nhập Mô Tả">

								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Giá ($):</label> <input
										type="text" class="form-control" name="price"
										id="exampleInputEmail1" placeholder="Nhập Giá ($)">

								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Giảm Giá:</label> <input
										type="text" class="form-control" name="discount"
										id="exampleInputEmail1" placeholder="Nhập Giá Giảm">

								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Danh Mục:</label> <select
										required="required" size="1" name="id_cat"
										class="form-control m-bot15">
										<c:forEach items="${alCat }" var="objCat">
											<option value="${objCat.id_cat}">${objCat.name}</option>
										</c:forEach>
									</select>
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Hình Ảnh:</label> <input
										type="file" class="form-control" name="hinhanh"
										id="exampleInputEmail1" id="upload" />

								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Chi Tiết:</label> <input
										type="text" class="form-control" name="details"
										id="exampleInputEmail1" placeholder="Nhập Chi Tiết Sản Phẩm">

								</div>

								<script>
									var editor1 = CKEDITOR.replace('editor1');
									CKFinder.setupCKEditor(editor1,
											'ProjectShop/templates/ckfinder/');
								</script>




								<input type="submit" value="Thêm" class="btn btn-primary" /> <input
									type="reset" value="Nhập Lại" class="btn btn-danger" />
							</form>
						</div>
					</div>
				</section>
			</div>
		</div>
	</section>
</section>