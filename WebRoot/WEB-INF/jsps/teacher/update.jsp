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
&nbsp;信息修改
</h3>
<div class="helper-dialog-footer helper-noselect">
	<div style="float:right;width: 50px;" class="helper-dialog-yes" id="update">提交</div>
	<div style="float:right;width: 50px;" class="helper-dialog-yes" id="back">返回</div>
</div>
<font style="display:none;color:skyblue;float: left;margin-left: 20px;" id="error" size="1"></font><br>
<form id="updateForm" action="${path}/ajax_t_update" method="post" enctype="multipart/form-data">
	<table style="background-image:url(${path}/main/images/x.jpg);background-size: 100% 100%;">
       	<tr height="40">
           	<td width="150" align="right">姓名：</td>
           	<td>
           		<s:textfield 
           			id="name" 
           			name="teacher.TName" 
           			type="text" 
           			required="true" 
           			cssStyle="border:solid 1px #ccc;color:gray; width:312px; height:30px;border-radius:4px;background:white; " 
           			AUTOCOMPLETE="off"
           			regr="^[\u4e00-\u9fa5]{2,5}$" 
           			tip="请输入由2-5个汉字组成的姓名【允许输入汉字】">
           		</s:textfield>    
           	</td>
        </tr>
	 	<tr height="40">
	    	<td align="right">性别：</td>
	    	<td>
	    		<s:select id="gender" list="#{'1':'男','2':'女' }" name="teacher.TGender" cssStyle="border:solid 1px #ccc;color:gray;"></s:select>
			</td>
	  	</tr>
	  	<tr height="40">
	    	<td align="right">年龄：</td>
	    	<td>
	    		<s:textfield 
	    			id="age" 
	    			name="teacher.TAge" 
	    			type="text" 
	    			required="true" 
	    			cssStyle="border:solid 1px #ccc;color:gray; width:312px; height:30px;border-radius:4px;background:white; " 
	    			AUTOCOMPLETE="off"
	    			regr="^(?:[1-9]?\d|100)$" 
           			tip="请输入0-99的数字【允许输入数字】">
	    		</s:textfield>
	    	</td>
	  	</tr>
	  	
	  	<tr height="40">
	    	<td align="right">身份类型：</td>
	    	<td>
	    		<s:select id="teachertype" style="cursor:pointer;height:20px;color:gray;" 
					list="#teacherList" 
					name="teacher.teachertype.ttId"
					headerKey=""  
					listKey="ttId" 
					listValue="ttName">
				</s:select>
	    	</td>
	  	</tr>
	  	<tr height="40">
	    	<td align="right">学校：</td>
	    	<td>
	    		<s:textfield 
	    			id="school" 
	    			name="teacher.TSchool" 
	    			type="text" 
	    			required="true" 
	    			cssStyle="border:solid 1px #ccc;color:gray; width:312px; height:30px;border-radius:4px;background:white; " 
	    			AUTOCOMPLETE="off"
	    			regr="^.{2,20}$" 
           			tip="请输入20个字符以内的学校名称">
	    		</s:textfield>
	    	</td>
	  	</tr>
	  	<tr id="subjecttypes" height="40">
	    	<td align="right">专业：</td>
	    	<td>
	    		<s:textfield 
	    			id="major" 
	    			name="teacher.TMajor" 
	    			type="text" 
	    			required="true" 
	    			cssStyle="border:solid 1px #ccc;color:gray; width:312px; height:30px;border-radius:4px;background:white; " 
	    			AUTOCOMPLETE="off"
	    			regr="^.{2,20}$" 
           			tip="请输入20个字符以内的专业名称">
	    		</s:textfield>
	    	</td>
	  	</tr>
	  	<tr height="40">
	    	<td align="right">目前所在地址：</td>
	    	<td>
	    		<s:textfield 
	    			id="address" 
	    			name="teacher.TAddress" 
	    			type="text" 
	    			required="true" 
	    			cssStyle="border:solid 1px #ccc;color:gray; width:312px; height:30px;border-radius:4px;background:white; " 
	    			AUTOCOMPLETE="off"
	    			regr="^.{2,20}$" 
           			tip="请输入20个字符以内的目前所在地址">
	    		</s:textfield>
			</td>
	  	</tr>
	  	<tr height="40">
	    	<td align="right">微信二维码：</td>
	    	<td>
	    		<a href="javascript:;" class="file" style="width: 288px;">点击选择微信二维码图片文件
				    <input name="upload" type="file" name="" id="we" accept=".jpeg,.jpg,.png">
				</a>
				<s:if test="teacher.TWechat==null">
					<div style="position:absolute;top:120px;left:550px;">
						<img id="id_img" src="${path}/main/images/we.jpg" width="160" />
					</div>
				</s:if>
				<s:if test="teacher.TWechat != null">
					<div style="position:absolute;top:120px;left:550px;">
						<img id="id_img" src="${path}/<s:property value="teacher.TWechat"/>" width="160" />
					</div>
				</s:if>
	    	</td>
	  	</tr>
	  	<tr height="40">
	    	<td align="right" valign="top">自我介绍：</td>
			<td>
				<s:textarea 
					id="introduce" 
					name="teacher.TIntroduce" 
					type="text" 
					cols="80" 
					cssStyle="font-size:5pt;border:solid 1px #ccc;color:gray; width:630px; height:60px;border-radius:4px;background:white;"
					regr="^.{2,120}$" 
           			tip="请输入120个字符以内的自我介绍">
				</s:textarea>				      
			</td>
	  	</tr>
       	<tr height="40">
         	<td align="right" valign="top">经验分享：</td>
         	<td>
         		<s:textarea 
         			id="experience" 
         			name="teacher.TExperience" 
         			type="text" 
         			cols="80" 
         			cssStyle="font-size:5pt;border:solid 1px #ccc;color:gray; width:630px; height:80px;border-radius:4px;background:white;"
         			regr="^.{2,150}$" 
           			tip="请输入150个字符以内的经验分享">
         		</s:textarea>				      
			</td>
       	</tr>
	</table>
	<br>
	<div align="left">
	<font color="skyblue" size="2">
	&emsp;&nbsp;温馨提示：<br><br>
	&emsp;&nbsp;&emsp;&nbsp;目前所在地址只需填至小区或楼栋或者校区即可，无需填至门牌号!
	</font>
	</div>
   	<input id="id" type="hidden" name="teacher.UId" value="<s:property value="#session.user.UId"/>">
</form>
</div>
</body>
<script type="text/javascript">
$(function()
{
	var id = $("#id").val();
	
	$("#back").click(function()
	{
		window.location.href = "${path}/t_teacherhome?teacher.UId="+id;
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
		
//以下都是保存按钮点击以后所做的事
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