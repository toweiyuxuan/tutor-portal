<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../taglibs.jsp" %>
<%@ include file="../tcc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<div class="personal_box" style="background-color:white;">
		<div class="touxiang">
			<h2>图片上传</h2>
		</div>
		<div class="info_box" align="center">
			<form id="imgFrom" action="${path}/ajax_tp_upload" method="post" enctype="multipart/form-data">
				<table>
					<tr height="280px">
						<td>
							<a href="javascript:void(0);" title="点击上传图片">
								<img onclick="addfile(1)" id="id_img1" src="${path}/main/images/ww.jpg" width="200">
							</a>
						</td>
						<td>
							<a href="javascript:void(0);" title="点击上传图片">
								<img onclick="addfile(2)" id="id_img2" src="${path}/main/images/ww.jpg" width="200">
							</a>
						</td>
						<td>
							<a href="javascript:void(0);" title="点击上传图片">
								<img onclick="addfile(3)" id="id_img3" src="${path}/main/images/ww.jpg" width="200">
							</a>
						</td>
					</tr>
				</table>
				<input style="display: none;" name="upload" id="myfile1" type="file" accept=".jpeg,.jpg,.png" mustwrite="true" title="第一张图片" required="required">
				<input style="display: none;" name="upload" id="myfile2" type="file" accept=".jpeg,.jpg,.png" mustwrite="true" title="第二张图片" required="required">
				<input style="display: none;" name="upload" id="myfile3" type="file" accept=".jpeg,.jpg,.png" mustwrite="true" title="第三张图片" required="required">
				<input id="id" style="display: none;" name="tphoto.UId" value="<s:property value="#session.user.UId"/>">
				<button id="back" type="button" class="btn">返回</button>
				<button id="subImg" type="button" class="btn">提交</button>
			</form>
			<font style="display:none;color:red;float: left;margin-left: 20px;" id="error" size="1"></font>
		</div>
	</div>
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
	if(item[0].value == "" && item[1].value == "" && item[2].value == "")
	{
		alert("你一张照片都没选，不能提交的！");
        return;
	}
	else
	{
	    for( var i=0; i<item.length; i++ )
	    {
	         if( item[i].value == "" )
	        {
	           continue;
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
	    
	    var loginForm = document.getElementById("imgFrom");
		loginForm.submit();
	}
});


$("#back").click(function()
{
	var id = $("#id").val();
	window.location.href = "${path}/tp_photo?teacher.UId="+id;
});	
</script>
</html>