<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../tcc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>鼠标悬停图片上显示文字 在线演示 www.divcss5.com</title> 
<style> 
img{border:0}/* css 注释说明：设置图片边框为0 */ 
body{behavior:url("csshover.htc");text-align:center;}/* css注释说明：兼容ie6 支持标签使用hover */ 
.divcss5{ position:relative;width:266px; height:180px;margin:0 auto;float: left;} 
.divcss5 a,.divcss5 span{display:none; text-decoration:none}
.divcss5:hover{cursor:pointer} 
.divcss5:hover a.now{cursor:pointer; position:absolute; top:0; width:100%; height:100%;
 z-index:100; left:0; display:block;}
.divcss5:hover span{ display:block;position:absolute; bottom:0; left:0;color:#FFF;width:266px; 
z-index:10;height:36px; line-height:36px; background:gray;filter:alpha(opacity=60);-moz-opacity:0.5;opacity: 0.5;}
/* 设置显示文字定位位置，背景半透明 */ 
</style> 
</head>	
<body>
<div align="center">
	<h3 align="left">
	&nbsp;机构相册
	</h3>
	<div class="helper-dialog-footer helper-noselect">
		<input id="id" type="hidden" name="mechanism.UId" value="<s:property value="#session.user.UId"/>">
		<div style="float:right;width: 50px;" class="helper-dialog-yes"  id="shangchuan">上传</div>
	</div>
	<s:iterator value="#page.list" var="mphoto">
		<div class="divcss5">
		    <img src="${path}/<s:property value="#mphoto.mpAddress"/>" width="262" height="180">
		    <span>删除</span>
		    <a href="javascript:void(0);" class="now" onclick="shanchu(<s:property value="#mphoto.mpId"/>)">&nbsp;</a>
		</div> 
	</s:iterator>
	<s:if test="#page.list.isEmpty()">
		<div style="background-color:#FFFFF0;border:10px solid #F7F7F7;border-style:double;">
			<br><br><br><br>
			<font color="skyblue"><h1>这里什么都没有，赶快去上传吧！</h1></font><br><br><br>
			<font color="gray">最多允许上传 9 张图片，图片格式只允许为 .jpg .jpeg .png！</font><br><br><br><br><br><br>
		</div>
	</s:if>
</div>

</body>
<script type="text/javascript">
$(function()
{
	$("#shangchuan").click(function() 
	{
		window.location.href = "${path}/mphoto_photoupload";
	});
});
function shanchu(id)
{
	Helper.ui.dialog
	({
		title: "提示信息",
		content: "该操作不可恢复，确定要删除吗？",
		mask: false,
		yesCallback: function () 
		{
			$.ajax
			({
			    url: "${path}/mp_detele?mphoto.mpId="+id,
			    type: "post",
			    success: function (result) 
			    {
			    	//alert(result)
			    	if(result=="success")
					{
						//弹窗
						//alert("删除成功！");
						location.reload();
					}
			 	}
			});
		},
		noCallback: function () 
		{
			//取消删除
		}
	}); 
}
</script>
</html>