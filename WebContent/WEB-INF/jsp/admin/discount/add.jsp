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
						href="${pageContext.request.contextPath }/admin/discount/add">Thêm
							Mã Giảm Giá</a></li>
				</ol>
			</div>
		</div>
		<c:choose>
			<c:when test="${param['msg'] eq 'add' }">
				<h4>
					<p style="color: red; font-family: cursive;">Mã Đã Tồn Tại</p>
				</h4>
			</c:when>
		</c:choose>
		<h4>
			<p style="color: red; font-family: cursive;">${msg}</p>
		</h4>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<header class="panel-heading"> Thêm Mã </header>
					<div class="panel-body">
						<div class="form">
							<form
								action="${pageContext.request.contextPath }/admin/discount/add"
								method="post" class="niceform">
								<div class="form-group">
									<label for="exampleInputEmail1">Mã</label> <input type="text"
										class="form-control" name="name"
										<c:if test="${discount != null}"> value="${discount.name}"</c:if>
										id="exampleInputEmail1" placeholder="Nhập Mã" />
								</div>

								<p>
									<form:errors path="discount.name"
										cssStyle="color:red; font-family: cursive;"></form:errors>
								</p>

								<div class="form-group">
									<label for="exampleInputEmail1">Sale</label> <input type="text"
										class="form-control" name="sale"
										<c:if test="${discount != null}"> value="${discount.sale}"</c:if>
										id="exampleInputEmail1" placeholder="Nhập Mã" />
								</div>


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