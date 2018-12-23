<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> Mã Giảm Giá
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i><a
						href="${pageContext.request.contextPath }/admin/">Home</a></li>
					<li><i class="fa fa-laptop"></i><a
						href="${pageContext.request.contextPath }/admin/discount">Mã
							Giảm Giá</a></li>
				</ol>
			</div>
		</div>

		<h4>
			<p style="color: green; font-family: cursive;">${msg}</p>
		</h4>
		<div class="row">

			<div class="col-lg-12">
				<section class="panel">


					<a href="${pageContext.request.contextPath }/admin/discount/add"
						class="btn btn-success"><strong
						class="glyphicon glyphicon-plus"></strong><span class="bt_green_r"></span></a>
					<table class="table table-striped table-advance table-hover">
						<tbody>
							<tr>
								<th><i class="icon_pin_alt"></i> ID</th>
								<th><i class="icon_profile"></i> Mã</th>
								<th><i class="icon_profile"></i> Sale</th>
								<th><i class="icon_cogs"></i> Chức Năng</th>
							</tr>

							<c:forEach var="objDiscount" items="${alDiscount}">
								<tr>
									<td>${objDiscount.id_discount }</td>
									<td>${objDiscount.name }</td>
									<td>${objDiscount.sale }%</td>
									<td>
										<div class="btn-group">
											<a class="btn btn-primary"
												href="${pageContext.request.contextPath }/admin/discount/edit/${objDiscount.id_discount }"><i
												class="glyphicon glyphicon-pencil"></i></a> <a
												class="btn btn-danger"
												href="${pageContext.request.contextPath }/admin/discount/del/${objDiscount.id_discount }"><i
												class="icon_close_alt2"></i></a>
										</div>
									</td>
								</tr>
							</c:forEach>


						</tbody>

					</table>



				</section>

			</div>
		</div>
	</section>
</section>