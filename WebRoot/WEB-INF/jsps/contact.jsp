<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="taglibs.jsp" %>
<%@ page import="java.util.*" %>

<%@taglib prefix="s" uri="/struts-tags"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<html>
<head>
<link rel="stylesheet" type="text/css" href="${path}/contact/css/kefu.css">
</head>
<body>

<!--在线客服  -->
<div class="scrollsidebar" id="scrollsidebar">
  <div class="side_content">
    <div class="side_list">
      <div class="side_title"><a title="隐藏" class="close_btn"><span>关闭</span></a></div>
      <div class="side_center">
        <div class="custom_service">
          <p> 
        	欢迎您：
       		<%Enumeration<String> attrs = session.getAttributeNames();if(!attrs.hasMoreElements()) {out.print("游客");} %>
			<s:property value="#session.user.UTel"/>
          </p>
        </div>
        <div class="other">
          <p><img src="${path}/contact/images/qrcode.png" width="120"/></p>
          <p>客户服务热线</p>
          <p>0871-xxxx-xxxx</p>
        </div>
        <div class="msgserver">
          <p><a href="###" >联系我们</a></p>
        </div>
      </div>
      <div class="side_bottom"></div>
    </div>
  </div>
  <div class="show_btn"><span>在线客服</span></div>
</div>
</body>
<script type="text/javascript">
$(document).ready(function () 
{
	//平台、设备和操作系统
	var system = 
	{
	    win: false,
	    mac: false,
	    xll: false
	};
	//检测平台
	var p = navigator.platform;
	system.win = p.indexOf("Win") == 0;
	system.mac = p.indexOf("Mac") == 0;
	system.x11 = (p == "X11") || (p.indexOf("Linux") == 0);
	//跳转语句
	if (system.win || system.mac || system.xll) 
	{
	
	} 
	else 
	{
		$(".scrollsidebar").hide();
	}
});
</script>
<script type="text/javascript" src="${path}/contact/js/kefu.js"></script>
</html>