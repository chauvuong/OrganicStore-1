<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<!-- header -->
<tiles:insertAttribute name="header"></tiles:insertAttribute>
<div class="templatemo-flex-row">
	<div class="templatemo-sidebar">
		<tiles:insertAttribute name="leftbar"></tiles:insertAttribute>
	</div>
	<!-- Main content -->
	<div class="templatemo-content col-1 light-gray-bg">
		<tiles:insertAttribute name="body"></tiles:insertAttribute>
	</div>
</div>
<tiles:insertAttribute name="footer"></tiles:insertAttribute>