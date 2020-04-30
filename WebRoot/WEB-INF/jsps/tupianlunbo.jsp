<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@taglib prefix="s" uri="/struts-tags"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link rel="stylesheet" href="${path}/tupianlunbo/css/edslider.css">
<link rel="stylesheet" href="${path}/tupianlunbo/css/styles.css">
<link rel="stylesheet" href="${path}/tupianlunbo/css/animate-custom.css">
<script type="text/javascript" src="${path}/tupianlunbo/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${path}/tupianlunbo/js/jquery.edslider.js"></script>
</head>
<body>
<div class="container">
	<ul class="mySlideshow">
		<li class="first">
			<a href="#" target="_blank" class="animated fadeInLeft"></a>
		</li>
		<li class="second"></li>
		<li class="third"></li>
		<li class="fourth"></li>
		<li class="fifth"></li>
	</ul>
</div>

<script src="${path}/tupianlunbo/js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="${path}/tupianlunbo/js/jquery.edslider.js"></script>
<script>
$(document).ready(function()
{
	$('.mySlideshow').edslider
	({
		width : '100%',
		height: 500
	});
});
</script>
</body>
</html>