<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> Danh Mục
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i><a
						href="${pageContext.request.contextPath }/admin/">Home</a></li>
					<li><i class="fa fa-laptop"></i><a
						href="${pageContext.request.contextPath }/admin/cat">Danh Mục</a></li>
					<li><i class="fa fa-laptop"></i><a
						href="${pageContext.request.contextPath }/admin/cat/edit">Sửa
							Danh Mục</a></li>
				</ol>
			</div>
		</div>
		<h4>
			<p style="color: green;font-family: cursive;">${msg}</p>
		</h4>
		<c:if test="${err ne null}">

			<h4>
				<p style="color: red;font-family: cursive;">Tên Danh Mục Đã Tồn Tại</p>
			</h4>

		</c:if>
	<div class="row">	
		<div class="col-lg-12">
			<section class="panel">
				<header class="panel-heading"> Sửa Danh Mục </header>
				<div class="panel-body">
					<div class="form">
						<form
							action="${pageContext.request.contextPath }/admin/cat/edit/${objCat.id_cat}"
							method="post" class="niceform">
							<div class="form-group">
								<label for="exampleInputEmail1">Tên Danh Mục</label> <input
									type="text" class="form-control" name="name" <c:if test="${objCat != null}"> value="${objCat.name}"</c:if>
									value="<c:if test="${objCat.name ne null}">${objCat.name}</c:if>"
									id="exampleInputEmail1" placeholder="Sửa Tên Danh Mục">

							</div>
							<p><form:errors path="objCat.name" cssStyle="color:red; font-family: cursive;"></form:errors></p>

							<input type="submit" value="Lưu" id="submit" name="submit"
								class="btn btn-primary" /> <input type="reset" value="Nhập Lại"
								id="submit" class="btn btn-danger" />
						</form>
					</div>
				</div>
			</section>
		</div>
		</div>
	</section>
</section>