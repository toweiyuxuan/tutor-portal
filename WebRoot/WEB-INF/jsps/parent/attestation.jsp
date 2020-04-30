<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../tcc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
	table
	{ 
		border-collapse:collapse;border:solid 1px #ccc;
	}
	td
	{ 
		border:solid 1px skyblue; font-size:13px; height:30px;font-family:'Microsoft YaHei';
	}	
	.main
	{ 
		margin:0 6%;
	}			
</style>
</head>
<body>
<div align="center" id="iframe">
	<h3 align="left">
	&nbsp;家长身份认证
	</h3>
	
	<div class="helper-dialog-footer helper-noselect">
		<div style="float:right;width: 50px;" class="helper-dialog-yes" id="subImg">提交</div>
		<div style="float:right;width: 50px;" class="helper-dialog-yes" id="back">返回</div>
	</div>
		
	<form id="imgFrom" action="${path}/ajax_pp_upload" method="post" enctype="multipart/form-data">
		<table align="center">
			<tr height="150">
				<td align="center" width="100px">温馨提示</td>
				<td colspan="2" align="left">
					<p style="margin: 10px 10px 10px 10px">
					  为了确保家长身份真实，需要家长提供真实有效的身份证正反面照片，要求图片字迹清晰，不能有遮挡，否则容易造成审核失败！
					  身份证照片仅用作审核家长身份，不做他用，信息完全保密，审核通过自动删除。给您带来的不便，敬请谅解！<br/><br/>
					<font color="skybule">注意：<br/>
						上传的所有图片文件格式只能是 .jpg .png .jpeg,其他文件格式的图片不予上传，同时图片大小总和不超过 4 MB！
					</font>
					</p>
				</td>
			</tr>
			<tr align="center" height="150">
				<td>家长身份证</td>
				<td>
					<a href="javascript:void(0);" title="点击上传图片"><img onclick="addfile(1)" id="id_img1" src="${path}/main/images/idCard1.jpg" width="172" height="108"></a>
				</td>
				<td>
					<a href="javascript:void(0);" title="点击上传图片"><img onclick="addfile(2)" id="id_img2" src="${path}/main/images/idCard2.jpg" width="172" height="108"></a>
				</td> 
			</tr>
			<tr align="center" height="150">
				<td>学生证</td>
				<td>
					<a href="javascript:void(0);" title="点击上传图片"><img onclick="addfile(3)" id="id_img3" src="${path}/main/images/stuCard.jpg" width="172" height="108"></a>
				</td>
				<td></td>
			</tr>
		</table>
		<br/>
		<div align="right">
			<input style="display: none;" name="upload" id="myfile1" type="file" accept=".jpeg,.jpg,.png" mustwrite="true" title="家长身份证正面" required="required">
			<input style="display: none;" name="upload" id="myfile2" type="file" accept=".jpeg,.jpg,.png" mustwrite="true" title="家长身份证反面" required="required">
			<input style="display: none;" name="upload" id="myfile3" type="file" accept=".jpeg,.jpg,.png" mustwrite="true" title="学生证" required="required">
			<input style="display: none;" name="parent.UId" id="id" value="<s:property value="#session.user.UId"/>">
		</div>
	</form>
	<font style="display:none;color:red;float: left;margin-left: 20px;" id="error" size="1"></font>
</div>
</body>
<script>
function addfile(id) 
{
	if(id==1)
	{
		document.getElementById("myfile1").click();
	}
	if(id==2)
	{
		document.getElementById("myfile2").click();
	}
	if(id==3)
	{
		document.getElementById("myfile3").click();
	}
}
$("#myfile1").change(function ()
{	
	$("#error").hide();
    // 先获取用户上传的文件对象
    let fileObj = this.files[0];
    // 生成一个文件读取的内置对象
    let fileReader = new FileReader();
    // 将文件对象传递给内置对象
    fileReader.readAsDataURL(fileObj); //这是一个异步执行的过程，所以需要onload回调函数执行读取数据后的操作
    // 将读取出文件对象替换到img标签
    fileReader.onload = function()
    { 
  		// 等待文件阅读器读取完毕再渲染图片
     	$("#id_img1").attr("src",fileReader.result);   	
    };
});
$("#myfile2").change(function ()
{	
	$("#error").hide();
    // 先获取用户上传的文件对象
    let fileObj = this.files[0];
    // 生成一个文件读取的内置对象
    let fileReader = new FileReader();
    // 将文件对象传递给内置对象
    fileReader.readAsDataURL(fileObj); //这是一个异步执行的过程，所以需要onload回调函数执行读取数据后的操作
    // 将读取出文件对象替换到img标签
    fileReader.onload = function()
    { 
  		// 等待文件阅读器读取完毕再渲染图片
     	$("#id_img2").attr("src",fileReader.result);   	
    };
});
$("#myfile3").change(function ()
{	
	$("#error").hide();
    // 先获取用户上传的文件对象
    let fileObj = this.files[0];
    // 生成一个文件读取的内置对象
    let fileReader = new FileReader();
    // 将文件对象传递给内置对象
    fileReader.readAsDataURL(fileObj); //这是一个异步执行的过程，所以需要onload回调函数执行读取数据后的操作
    // 将读取出文件对象替换到img标签
    fileReader.onload = function()
    { 
  		// 等待文件阅读器读取完毕再渲染图片
     	$("#id_img3").attr("src",fileReader.result);   	
    };
});

$("#subImg").click(function()
{
	var item = $("input[mustwrite='true']", document.forms[0]);
    for( var i=0; i<item.length; i++ )
    {
        if( item[i].value == "" )
        {
            alert(item[i].title + " 为必填项");
            return;
		}
        var img_id=item[i].value;
        var index= img_id.lastIndexOf(".");
    	img_id=img_id.substring(index);//截断"."之前的，得到后缀
    	if(img_id!=".png"&&img_id!=".jpg"&&img_id!=".jpeg")
    	{
    		alert(item[i].title + " 不是指定图片格式,重新选择！");
    		return;
		}
    	var fileSize = item[i].files[0];
    	if(fileSize.size>1048576)
    	{
    		alert(item[i].title + " 大小超过 1M,请重新选择！");
    		return;
        }
	}
	$("#imgFrom").ajaxSubmit
	({
		async:true,
		datatype:"text",
		success:function (result) 
		{
			//alert(result)
			if(result=="ok")
			{
				window.location.href = "${path}/JJ_successtip";
			}
			else
			{
				$("#error").html("上传失败！所有图片大小之和不应超过 4 MB！");
				$("#error").show();
			}
		}
	});	
});

$("#back").click(function()
{
	var id = $("#id").val();	
	window.location.href = "${path}/p_parenthome?parent.UId="+id;
});	
</script>
</html>