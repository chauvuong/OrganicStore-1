<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Creative - Bootstrap 3 Responsive Admin Template">
<meta name="author" content="GeeksLabs">
<meta name="keyword"
	content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
<link rel="shortcut icon" href="img/favicon.png">

<title>ADMIN-SHOP</title>

<!-- Bootstrap CSS -->
<link
	href="${pageContext.request.contextPath }/templates/admin/css/bootstrap.min.css"
	rel="stylesheet">
<!-- bootstrap theme -->
<link
	href="${pageContext.request.contextPath }/templates/admin/css/bootstrap-theme.css"
	rel="stylesheet">
<!--external css-->
<!-- font icon -->
<link
	href="${pageContext.request.contextPath }/templates/admin/css/elegant-icons-style.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/templates/admin/css/font-awesome.min.css"
	rel="stylesheet" />
<!-- full calendar css-->
<link
	href="${pageContext.request.contextPath }/templates/admin/assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/templates/admin/assets/fullcalendar/fullcalendar/fullcalendar.css"
	rel="stylesheet" />
<!-- easy pie chart-->
<link
	href="${pageContext.request.contextPath }/templates/admin/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css"
	rel="stylesheet" type="text/css" media="screen" />
<!-- owl carousel -->
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
<link
	href="${pageContext.request.contextPath }/templates/admin/css/jquery-jvectormap-1.2.2.css"
	rel="stylesheet">
<!-- Custom styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/templates/admin/css/fullcalendar.css">
<link
	href="${pageContext.request.contextPath }/templates/admin/css/widgets.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/templates/admin/css/style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/templates/admin/css/style-responsive.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/templates/admin/css/xcharts.min.css"
	rel=" stylesheet">
<link
	href="${pageContext.request.contextPath }/templates/admin/css/jquery-ui-1.10.4.min.css"
	rel="stylesheet">

</head>

<body>
	<!-- container section start -->
	<section id="container" class="">


		<header class="header dark-bg">
			<div class="toggle-nav">
				<div class="icon-reorder tooltips"
					data-original-title="Toggle Navigation" data-placement="bottom">
					<i class="icon_menu"></i>
				</div>
			</div>

			<!--logo start-->
			<a href="${pageContext.request.contextPath }/admin" class="logo">ADMIN
				<span class="lite"></span>
			</a>
			<!--logo end-->

			<div class="nav search-row" id="top_menu">
				<!--  search form start -->
				<ul class="nav top-menu">
					<li>
						<form class="navbar-form">
							<input class="form-control" placeholder="Search" type="text">
						</form>
					</li>
				</ul>
				<!--  search form end -->
			</div>

			<div class="top-nav notification-row">
				<!-- notificatoin dropdown start-->
				<ul class="nav pull-right top-menu">

					<li id="mail_notificatoin_bar" class="dropdown"><a
						data-toggle="dropdown" class="dropdown-toggle" href="#"> <i
							class="icon-envelope-l"></i> <span class="badge bg-important">${sumComment }</span>
					</a>
						<ul class="dropdown-menu extended inbox">
							<div class="notify-arrow notify-arrow-blue"></div>
							<li>
								<p class="blue">You have ${sumComment } new messages</p>
							</li>
							<c:forEach items="${listCommentNews}" var="listComment">
							<li><a href="${pageContext.request.contextPath }/admin/comment/"> <span class="photo"><img
										alt="avatar" src="${pageContext.request.contextPath }/templates/public/images/tenor.gif"></span> <span
									class="subject"> <span class="from">${listComment.name }</span> <span
										class="time">${listComment.rating }<i class="fa fa-star" aria-hidden="true"></i></span>
								</span> <span class=""> ${listComment.content } </span>
							</a></li>
							</c:forEach>


							<li><a href="${pageContext.request.contextPath }/admin/comment/">See all messages</a></li>
						</ul></li>

					<li id="alert_notificatoin_bar" class="dropdown"><a
						data-toggle="dropdown" class="dropdown-toggle" href="#"> <i
							class="icon-bell-l"></i> <span class="badge bg-important">${NoActive}</span>
					</a>
						<ul class="dropdown-menu extended notification">
							<div class="notify-arrow notify-arrow-blue"></div>
							<li>
								<p class="blue">You have ${NoActive} new orders</p>
							</li>
							<c:forEach items="${listOrderNoActive}" var="listOrder">
								<li><a
									href="${pageContext.request.contextPath }/admin/order/"> <span
										class="label label-warning"><i class="icon_profile"></i></span>
										${listOrder.name_customer }. <span
										class="small italic pull-right">
											${listOrder.date_create }</span>
								</a></li>
							</c:forEach>
							<li><a
								href="${pageContext.request.contextPath }/admin/order/">See
									all notifications</a></li>
						</ul></li>

					<!-- task notificatoin start -->

					<!-- user login dropdown start-->
					<li class="dropdown"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <span class="profile-ava">
								<img alt=""
								src="${pageContext.request.contextPath }/templates/admin/img/avatar1_small.jpg">
						</span> <span class="username">${fullname }</span> <b class="caret"></b>
					</a>
						<ul class="dropdown-menu extended logout">
							<div class="log-arrow-up"></div>
							<li class="eborder-top"><a href="javascript:void(0)"><i
									class="icon_profile"></i> My Profile</a></li>
							<li><a href="${pageContext.request.contextPath }/logout"><i
									class="icon_key_alt"></i> Log Out</a></li>
							<%-- <li><a href="#"><i class="icon_mail_alt"></i> My Inbox</a></li>
							<li><a href="#"><i class="icon_clock_alt"></i> Timeline</a>
							</li>
							<li><a href="#"><i class="icon_chat_alt"></i> Chats</a></li>
							
							<li><a href="documentation.html"><i class="icon_key_alt"></i>
									Documentation</a></li>
							<li><a href="documentation.html"><i class="icon_key_alt"></i>
									Documentation</a></li> --%>
						</ul></li>
					<!-- user login dropdown end -->
				</ul>
				<!-- notificatoin dropdown end-->
			</div>
		</header>