<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> Thành Viên
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i><a
						href="${pageContext.request.contextPath}/admin">Home</a></li>
					<li><i class="fa fa-laptop"></i><a
						href="${pageContext.request.contextPath }/admin/member">Thành
							Viên</a></li>
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
								<th><i class="icon_cogs"></i> Trạng Thái</th>
								<th><i class="icon_cogs"></i> Chức Năng</th>
							</tr>
							<c:forEach var="objMember" items="${alMember}">
								<tr>

									<td>${objMember.id_member }</td>
									<td>${objMember.fullname }</td>
									<td>${objMember.email }</td>
									<td>${objMember.phone }</td>
									<td>${objMember.address }</td>
									<td><c:set
											value="${pageContext.request.contextPath}/templates/admin/images/deactive.gif"
											var="URLlock">
										</c:set> <c:set
											value="${pageContext.request.contextPath}/templates/admin/images/active.gif"
											var="URLtick"></c:set> <c:choose>
											<c:when test="${objMember.enable == 1 }">
												<div style="text-align: center"
													id="html${objMember.id_member }">
													<a href="javascript:void(0)"
														onclick="return changes${objMember.id_member}()"><img
														id="img${objMember.id_member}" width="15px" height="15px"
														src="${URLtick }" alt="tick" /></a>
												</div>
											</c:when>
											<c:otherwise>
												<div style="text-align: center"
													id="html${objMember.id_member }">
													<a href="javascript:void(0)"
														onclick="return changes${objMember.id_member}()"><img
														id="img${objMember.id_member}" width="15px" height="15px"
														src="${URLlock }" alt="lock" /></a>
												</div>
											</c:otherwise>

										</c:choose></td>
									<td>
										<div>

											<a class="btn btn-danger"
												href="${pageContext.request.contextPath }/admin/member/del/${objMember.id_member }"><i
												class="icon_close_alt2"></i></a>
										</div>
									</td>
								</tr>

								<script>
					function changes${objMember.id_member}(){
					var img = $('#img${objMember.id_member}').attr('src')
					var id = ${objMember.id_member};
					$.ajax({
						url: '${pageContext.request.contextPath }/admin/member/ajax',
						type: 'POST',
						cache: false, 
						data: {
							//Dữ liệu gửi đi
							aimg:img,
							aid: id,
						},
						success: function(data){
							$('#html${objMember.id_member}').html(data);
				
						},
						error: function (){
							// Xử lý nếu có lỗi
							alert("Có lỗi trong quá trình xử lý");
						}
					});
					}
			</script>
							</c:forEach>
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
											href="${pageContext.request.contextPath }/admin/member?page=${back}"
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
													href="${pageContext.request.contextPath }/admin/member?page=${i}">${i }</a></li>

											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${pages != total }">
										<li><a
											href="${pageContext.request.contextPath }/admin/member?page=${next}"
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