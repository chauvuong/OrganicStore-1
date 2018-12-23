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
						href="${pageContext.request.contextPath }/admin/discount">Mã
							Giảm Giá</a></li>
					<li><i class="fa fa-laptop"></i><a
						href="${pageContext.request.contextPath }/admin/discount/edit">Sửa
							Mã Giảm Giá</a></li>
				</ol>
			</div>
		</div>
		<h4>
			<p style="color: green; font-family: cursive;">${msg}</p>
		</h4>
		<c:if test="${err ne null}">

			<h4>
				<p style="color: red; font-family: cursive;">Mã Đã Tồn Tại</p>
			</h4>

		</c:if>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<header class="panel-heading"> Sửa Mã Giảm Giá </header>
					<div class="panel-body">
						<div class="form">
							<form
								action="${pageContext.request.contextPath }/admin/discount/edit/${objDiscount.id_discount}"
								method="post" class="niceform">
								<div class="form-group">
									<label for="exampleInputEmail1">Mã</label> <input type="text"
										class="form-control" name="name"
										<c:if test="${objDiscount != null}"> value="${objDiscount.name}"</c:if>
										value="<c:if test="${objDiscount.name ne null}">${objDiscount.name}</c:if>"
										id="exampleInputEmail1" placeholder="Sửa Mã">

								</div>
								<p>
									<form:errors path="objDiscount.name"
										cssStyle="color:red; font-family: cursive;"></form:errors>
								</p>
								<div class="form-group">
									<label for="exampleInputEmail1">Sale</label> <input type="text"
										class="form-control" name="sale"
										<c:if test="${objDiscount != null}"> value="${objDiscount.sale}"</c:if>
										value="<c:if test="${objDiscount.sale ne null}">${objDiscount.sale}</c:if>"
										id="exampleInputEmail1" placeholder="Sửa Sale">

								</div>
							

								<input type="submit" value="Lưu" id="submit" name="submit"
									class="btn btn-primary" /> <input type="reset"
									value="Nhập Lại" id="submit" class="btn btn-danger" />
							</form>
						</div>
					</div>
				</section>
			</div>
		</div>
	</section>
</section>