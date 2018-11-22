<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section id="main-content">
	<section class="wrapper">

		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> Quản Trị
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i><a
						href="${pageContext.request.contextPath}/admin">Home</a></li>
					<li><i class="fa fa-laptop"></i><a
						href="${pageContext.request.contextPath }/admin/user">Quản Trị</a></li>
				</ol>
			</div>
		</div>
<h4>
	<p style="color: green;font-family: cursive;">${msg}</p>
</h4>	
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">

					<a href="${pageContext.request.contextPath }/admin/user/add"
						class="btn btn-success"><strong
						class="glyphicon glyphicon-plus"></strong><span
						class="bt_green_r"></span></a>
					<table class="table table-striped table-advance table-hover">
						<tbody>
							<tr>
								<th><i class="icon_pin_alt"></i> ID</th>
								<th><i class="icon_profile"></i> Tên Đăng Nhập</th>
								<th><i class="icon_profile"></i> Họ Tên</th>
								<th><i class="icon_profile"></i> Cấp Bậc</th>
								<th><i class="icon_mobile"></i> Điện Thoại</th>
								<!-- <th><i class="icon_cogs"></i> Trạng Thái</th> -->
								<th><i class="icon_cogs"></i> Chức Năng</th>
							</tr>

							<c:forEach var="objUser" items="${alUser}">
								<tr>
									<td>${objUser.id_user }</td>
									<td>${objUser.username }</td>
									<td>${objUser.fullname }</td>
									<td>${objUser.rname }</td>
									<td>${objUser.phone }</td>
								<%-- 	<td><c:set
											value="${pageContext.request.contextPath}/templates/admin/images/deactive.gif"
											var="URLlock">
										</c:set> <c:set
											value="${pageContext.request.contextPath}/templates/admin/images/active.gif"
											var="URLtick"></c:set> <c:choose>
											<c:when test="${objUser.enable == 1 }">
												<div style="text-align: center" id="html${objUser.id_user }">
													<a href="javascript:void(0)"
														onclick="return changes${objUser.id_user}()"><img
														id="img${objUser.id_user}" width="15px" height="15px"
														src="${URLtick }" alt="tick" /></a>
												</div>
											</c:when>
											<c:otherwise>
												<div style="text-align: center" id="html${objUser.id_user }">
													<a href="javascript:void(0)"
														onclick="return changes${objUser.id_user}()"><img
														id="img${objUser.id_user}" width="15px" height="15px"
														src="${URLlock }" alt="lock" /></a>
												</div>
											</c:otherwise>

										</c:choose></td> --%>



									<td>
										<div class="btn-group">
											<a class="btn btn-primary"
												href="${pageContext.request.contextPath }/admin/user/edit/${objUser.id_user }"><i
												class="glyphicon glyphicon-pencil"></i></a> <a
												class="btn btn-danger"
												href="${pageContext.request.contextPath }/admin/user/del/${objUser.id_user }"><i
												class="icon_close_alt2"></i></a>
										</div>
									</td>
								</tr>

							<!-- 	<script>
					function changes${objUser.id_user}(){
					var img = $('#img${objUser.id_user}').attr('src')
					var id = ${objUser.id_user};
					$.ajax({
						url: '${pageContext.request.contextPath }/admin/user/ajax',
						type: 'POST',
						cache: false, 
						data: {
							//Dữ liệu gửi đi
							aimg:img,
							aid: id,
						},
						success: function(data){
							$('#html${objUser.id_user}').html(data);
				
						},
						error: function (){
							// Xử lý nếu có lỗi
							alert("Có lỗi trong quá trình xử lý");
						}
					});
				}
			</script> -->

							</c:forEach>


						</tbody>

					</table>



				</section>

			</div>
		</div>
	</section>
</section>