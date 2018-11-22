<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> Bình Luận
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i><a
						href="${pageContext.request.contextPath}/admin">Home</a></li>
					<li><i class="fa fa-laptop"></i><a
						href="${pageContext.request.contextPath }/admin/comment">Bình Luận</a></li>
				</ol>
			</div>
		</div>
		<h4>
			<p style="color: green; font-family: cursive;">${msg}</p>
		</h4>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<table class="table table-striped table-advance table-hover">
						<tbody>
							<tr>
								<th><i class="icon_pin_alt"></i> ID</th>
								<th><i class="icon_profile"></i> Tên Sản Phẩm</th>
								<th><i class="icon_profile"></i> Họ Tên</th>
								<th><i class="icon_profile"></i> Email</th>
								<th><i class="icon_mobile"></i> Nội Dung</th>
								<th><i class="icon_profile"></i> Đánh Giá</th>
								<th><i class="icon_profile"></i> Ngày</th>
								<th><i class="icon_cogs"></i> Chức Năng</th>
							</tr>
							<c:forEach var="objComment" items="${listComment}">
								<tr>
									<td>${objComment.id_comment }</td>
									<td>${objComment.nname }</td>
									<td>${objComment.name }</td>
									<td>${objComment.email }</td>
									<td>${objComment.content }</td>
									<td>${objComment.rating }*</td>
									<td>${objComment.date_create }</td>
									<td>
										<div>

											<a class="btn btn-danger"
												href="${pageContext.request.contextPath }/admin/comment/del/${objComment.id_comment }"><i
												class="icon_close_alt2"></i></a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="text-center">
						<ul class="pagination">
					

						</ul>
					</div>
				</section>
			</div>
		</div>
	</section>
</section>