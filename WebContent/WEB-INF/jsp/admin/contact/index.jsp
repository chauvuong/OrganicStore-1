<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> Liên Hệ
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i><a
						href="${pageContext.request.contextPath}/admin">Home</a></li>
					<li><i class="fa fa-laptop"></i><a
						href="${pageContext.request.contextPath }/admin/member">Liên
							Hệ</a></li>
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
								<th><i class="icon_profile"></i> Họ Tên</th>
								<th><i class="icon_profile"></i> Email</th>
								<th><i class="icon_mobile"></i> Điện Thoại</th>
								<th><i class="icon_profile"></i> Địa Chỉ</th>
								<th><i class="icon_cogs"></i> Chức Năng</th>
							</tr>
							<c:forEach var="objContact" items="${alContact}">
								<tr>

									<td>${objContact.id_contact }</td>
									<td>${objContact.name }</td>
									<td>${objContact.email }</td>
									<td>${objContact.phone }</td>
									<td>${objContact.address }</td>
									<td>
										<div>

											<a class="btn btn-danger"
												href="${pageContext.request.contextPath }/admin/contact/del/${objContact.id_contact }"><i
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