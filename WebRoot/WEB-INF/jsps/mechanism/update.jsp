<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../tcc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
tr,td{font-size:16px;font-family:'Microsoft YaHei';}
select{
  border:1px solid #c9c9c9;
  background-color:#fff;
  color:#666;
  height:20px;
  width:300px;
  line-height:28px;
  padding:4px 6px;
  font-size:14px;
  border-radius:4px;
  cursor:pointer;
  outline:none;
}
.file {
    position: relative;
    display: inline-block;
    background: white;
    border: 1px solid #ccc;
    border-radius: 4px;
    padding: 4px 12px;
    overflow: hidden;
    color: skyblue;
    text-decoration: none;
    text-indent: 0;
    line-height: 20px;
}
.file input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
}
.file:hover {
    background: white;
    border-color: skyblue;
    color: gray;
    text-decoration: none;
}
</style>
</head>
<body>
<div align="center">
<h3 align="left">
<s:if test="#session.user.UIsfinish==1">
&nbsp;信息完善
</s:if>
<s:if test="#session.user.UIsfinish==2">
&nbsp;信息修改
</s:if>
</h3>
<div class="helper-dialog-footer helper-noselect">
	<div style="float:right;width:50px;" class="helper-dialog-yes" id="update">提交</div>
	<div style="float:right;width:50px;" class="helper-dialog-yes" id="back">返回</div>
</div>
<font style="display:none;color:skyblue;float: left;margin-left: 20px;" id="error" size="1"></font><br>
<form id="updateForm" action="${path}/ajax_m_update" method="post" enctype="multipart/form-data">
	<table style="background-image:url(${path}/main/images/x.jpg);background-size: 100% 100%;">
       	<tr height="40">
           	<td width="150" align="right">机构名称：</td>
           	<td>
           		<s:textfield id="name" 
           			name="mechanism.MName" 
           			type="text" 
           			required="true" 
           			cssStyle="border:solid 1px #ccc;color:gray; width:312px; height:30px;border-radius:4px;background:white; "
           			regr="^.{2,20}$" 
           			tip="请输入20个字符以内的机构名称">
           		</s:textfield>    		
           	</td>
        </tr>
        <tr id="mechanismtypes" height="40">
	    	<td align="right">机构标签：</td>
	    	<td>
	    		<s:iterator value="#mechanismtypeList" var="mechanismtype">
					<input name="wyx" type="checkbox" <s:if test="#mechanismtype.select=='yes'">checked</s:if> value="<s:property value="#mechanismtype.MId"/>"/><s:property value="#mechanismtype.MName"/>
				</s:iterator>
           	</td>
	  	</tr>
        <tr height="40">
	    	<td align="right">所在区域：</td>
	    	<td>
	    		<s:select id="area" list="#{'1':'呈贡区','2':'官渡区','3':'西山区','4':'五华区','5':'盘龙区'}" name="mechanism.MArea" cssStyle="border:solid 1px #ccc;color:gray;"></s:select>					
			</td>
	  	</tr>
	  	<tr height="40">
	    	<td align="right">首页图片：</td>
	    	<td>
	    		<a href="javascript:;" class="file" style="width: 288px;">点击选择首页图片文件
				    <input name="upload" type="file" name="" id="we" accept=".jpeg,.jpg,.png">
				</a>
				<s:if test="mechanism.MHomepage==null">
					<div style="position:absolute;top:110px;left:600px;">
						<img id="id_img" src="${path}/main/images/ert.jpg" width="150" height="150"/>
					</div>
				</s:if>
				<s:if test="mechanism.MHomepage != null">
					<div style="position:absolute;top:110px;left:600px;">
						<img id="id_img" src="${path}/<s:property value="mechanism.MHomepage"/>" width="150" height="150"/>
					</div>
				</s:if>
	    	</td>
	  	</tr>
	  	<tr height="40" valign="top">
	    	<td align="right">联系方式：</td>
	    	<td>
           		<s:textfield
           			id="contact" 
           			name="mechanism.MContact" 
           			type="text" 
           			cols="80" 
           			cssStyle="border:solid 1px #ccc;color:gray; width:630px; height:30px;border-radius:4px;background:white;"
           			regr="^.{2,30}$" 
           			tip="请输入30个字符以内的联系方式">
           		</s:textfield>				      
			</td>
	  	</tr>
	 	<tr height="40">
	    	<td align="right">机构地址：</td>
	    	<td>
           		<s:textfield 
           			id="address" 
           			name="mechanism.MAddress" 
           			type="text" 
           			required="true" 
           			cssStyle="border:solid 1px #ccc;color:gray; width:630px; height:30px;border-radius:4px;background:white; "
           			regr="^.{2,30}$" 
           			tip="请输入30个字符以内的机构地址">
           		</s:textfield>    		
           	</td>
	  	</tr>
	  	<tr height="40" valign="top">
	    	<td align="right">机构特点：</td>
	    	<td>
           		<s:textarea
           			id="tedian" 
           			name="mechanism.MTedian" 
           			type="text" 
           			required="true" 
           			cssStyle="font-size:5pt;border:solid 1px #ccc;color:gray; width:630px; height:60px;border-radius:4px;background:white; "
           			regr="^.{2,100}$" 
           			tip="请输入100个字符以内的机构特点">
           		</s:textarea>    		
           	</td>
	  	</tr>
	  	<tr height="40" valign="top">
	    	<td align="right">机构介绍：</td>
	    	<td>
           		<s:textarea 
           			id="introduce" 
           			name="mechanism.MIntroduce" 
           			type="text" 
           			cols="80" 
           			cssStyle="font-size:5pt;border:solid 1px #ccc;color:gray; width:630px; height:100px;border-radius:4px;background:white;"
           			regr="^.{2,200}$" 
           			tip="请输入200个字符以内的机构介绍">
           		</s:textarea>				      
			</td>
	  	</tr>
	  	
	</table>
	<br>
   	<input id="id" type="hidden" name="mechanism.UId" value="<s:property value="#session.user.UId"/>">
</form>
</div>
</body>
<script type="text/javascript">

$(function()
{
	var id = $("#id").val();
	
	$("#back").click(function()
	{
		window.location.href = "${path}/m_mechanismhome?mechanism.UId="+id;
	});
	
	$("#we").change(function ()
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
	     	$("#id_img").attr("src",fileReader.result);   	
	    };
	});
	
	$("#update").click(function()
	{
		//成功标识
		var isOk = validForm();
		if(isOk)
		{
			$("#updateForm").ajaxSubmit
			({
				async:true,
				datatype:"text",
				success:function (result) 
				{
					//alert(result)
					if(result=="success")
					{
						var setMechanismtypeIds = "";
						//获得列表中被选中的checkbox
						$("#mechanismtypes input:checked").each(function()
						{
							setMechanismtypeIds = setMechanismtypeIds + $(this).val()+",";
						});
						$.ajax
						({
							url:"${path}/ajax_my_setMechanismtypes",
							type:"post",
							data:
							{
								"mechanism.UId":id,
								"mechanismtypeIds":setMechanismtypeIds
							},
							async:false,
							dataType:"text",
							success:function(responseText)
							{
								if(responseText=="success")
								{
									//alert("标签保存成功!");
								}
								else
								{
									alert("标签保存失败！");
								}
							}
						});
						window.location.href = "${path}/JJ_successtip1";
					}
					else
					{
						alert( "修改失败！");
					}
				}
			});	
		}
	});
});
//按钮抬起校验是否输入合法
$("#updateForm").find("[regr]").keyup(function()
{
	//获得每一个必填项的输入信息
	var val = $(this).val();
	//获得每一个必填项的正则表达式
	var regStr = $(this).attr("regr");
	//获得每一个必填项的提示信息
	var tip = $(this).attr("tip");
	//创建正则表达式的对象
	var reg = new RegExp(regStr);
	//获得每一个文本域的name
	var name = $(this).attr("name");
	if(!reg.test(val))
	{
		//设置提示信息
		$("#error").html(tip);
		//展示提示信息
		$("#error").show();
	}
	else
	{
		$("#error").hide();
		return false;
	}
});

//提交的时候校验表单
function validForm()
{	
	//表单的提交标志
	var isSubmit = true;
	$("#updateForm").find("[regr]").each(function()
	{
		//获得每一个必填项的输入信息
		var val = $(this).val();
		//获得每一个必填项的正则表达式
		var regStr = $(this).attr("regr");
		//获得每一个必填项的提示信息
		var tip = $(this).attr("tip");
		//创建正则表达式的对象
		var reg = new RegExp(regStr);
		//获得每一个文本域的name
		var name = $(this).attr("name");
		if(!reg.test(val))
		{
			//设置提示信息
			$("#error").html(tip);
			//展示提示信息
			$("#error").show();
			//设置提交标志是false
			isSubmit = false;
			//跳出校验循环
			return false;
		}
	});
	
	//获取所有复选框
	var inputs = document.getElementsByName("wyx");
	var count="no";
	for (var i = 0; i < inputs.length; i++) 
	{
		if (inputs[i].checked == true) 
		{
			count="yes";
		}
	}
	if(count == "no")
	{
		isSubmit = false;
		alert("请至少选择一项标签！");
	}
	
	//校验微信二维码图片文件格式
	var we = $("#we").val();
	if(we != "")
    {
    	var index= we.lastIndexOf(".");
    	we=we.substring(index);//截断"."之前的，得到后缀
	    if(we!=".png"&&we!=".jpg"&&we!=".jpeg")
	   	{
	    	alert("微信二维码不是指定图片格式（.jgp .png .jpeg）,重新选择！");
	    	isSubmit = false;
	  	}
	}
	return isSubmit;
}
</script>
</html>