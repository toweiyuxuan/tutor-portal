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
<form id="updateForm">
	<table style="background-image:url(${path}/main/images/x.jpg);background-size: 100% 100%;">
       	<tr height="40">
           	<td width="150" align="right">家长昵称：</td>
           	<td>
           		<s:textfield 
           			id="name" 
           			name="parent.PName" 
           			type="text" 
           			required="true" 
           			cssStyle="border:solid 1px #ccc;color:gray; width:312px; height:30px;border-radius:4px;background:white;"
           			AUTOCOMPLETE="off"
           			regr="^[\u4e00-\u9fa5]{2,5}$" 
           			tip="请输入由2-5个汉字组成的昵称【允许输入汉字】">
           		</s:textfield>    		
           	</td>
         	</tr>
	 	<tr height="40">
	    	<td align="right">学生性别：</td>
	    	<td>
	    		<s:select id="gender" list="#{'1':'男','2':'女' }" name="parent.PGender" cssStyle="border:solid 1px #ccc;color:gray;"></s:select>
			</td>
	  	</tr>
	  	<tr height="40">
	    	<td align="right">学生性格特点：</td>
	    	<td>
	    		<s:select id="character" list="#{'1':'外向型','2':'内向型','3':'理智型','4':'情绪型','5':'意志型','6':'中间型'}" name="parent.PCharacter" cssStyle="border:solid 1px #ccc;color:gray;"></s:select>					
			</td>
	  	</tr>
	  	<tr height="40">
	    	<td align="right">学生年级：</td>
	    	<td>
	    		<s:select id="grade" list="#{'1':'一年级','2':'二年级','3':'三年级','4':'四年级','5':'五年级','6':'六年级','7':'七年级','8':'八年级','9':'九年级','10':'高一','11':'高二','12':'高三'}" name="parent.PGrade" cssStyle="border:solid 1px #ccc;color:gray;"></s:select>					
			</td>
	  	</tr>
	  	<tr id="subjecttypes" height="40">
	    	<td align="right">辅导学科：</td>
	    	<td>
	    		<s:iterator value="#subjectList" var="subject">
					<input type="checkbox" <s:if test="#subject.select=='yes'">checked</s:if> value="<s:property value="#subject.SId"/>"/><s:property value="#subject.SName"/>
				</s:iterator>
				<span><font size="1" color="skyblue">未选择代表不限制</font></span>
	    	</td>
	  	</tr>
	  	<tr height="40">
	    	<td align="right">家教区域：</td>
	    	<td>
	    		<s:select id="area" list="#{'1':'呈贡区','2':'官渡区','3':'西山区','4':'五华区','5':'盘龙区'}" name="parent.PArea" cssStyle="border:solid 1px #ccc;color:gray;"></s:select>					
			</td>
	  	</tr>
	  	<tr height="40">
	    	<td align="right">具体地址：</td>
	    	<td>
				<s:textfield 
					id="address" 
					name="parent.PAddress" 
					type="text" size="50" 
					cssStyle="border:solid 1px #ccc;color:gray; width:312px; height:30px;border-radius:4px;background:white;"
					AUTOCOMPLETE="off"
	    			regr="^.{2,20}$" 
           			tip="请输入20个字符以内的具体地址">
				</s:textfield>				      
			</td>
	  	</tr>
	  	<tr height="40">
	    	<td align="right">报酬范围：</td>
			<td>
				<s:select id="money" list="#{'1':'<40','2':'40-50','3':'50-60','4':'60-70','5':'>70'}" name="parent.PMoney" cssStyle="border:solid 1px #ccc;color:gray;"></s:select>	
			</td>
	  	</tr>
       	<tr height="40">
         	<td align="right">老师性别限制：</td>
         	<td>
         		<s:select id="limitgender" list="#{'0':'不限制','1':'限男生','2':'限女生'}" name="parent.PLimitgender" cssStyle="border:solid 1px #ccc;color:gray;"></s:select>
			</td>
       	</tr>
	  	<tr id="teachertypes" height="40">
	    	<td align="right">老师身份限制：</td>
	    	<td>
	    		<s:iterator value="#teacherList" var="teacher">
					<input name="chk" type="checkbox" <s:if test="#teacher.select=='yes'">checked</s:if> value="<s:property value="#teacher.ttId"/>"/><s:property value="#teacher.ttName"/>
				</s:iterator>
				<span><font size="1" color="skyblue">未选择代表不限制</font></span>
	    	</td>
	  	</tr>
	  	<tr height="66">
	    	<td align="right">其他说明：</td>
	    	<td>
				<s:textarea 
					id="other" 
					name="parent.POther" 
					type="text" 
					cols="80" 
					cssStyle="font-size:5pt;border:solid 1px #ccc;color:gray; width:630px; height:60px;border-radius:4px;background:white;"
					regr="^.{2,120}$" 
           			tip="请输入120个字符以内的其他说明">
				</s:textarea>				      
			</td>
	  	</tr>
	</table>
	<br>
	<div align="left">
	<font color="skyblue" size="2">
	&emsp;&nbsp;温馨提示：<br><br>
	&emsp;&nbsp;&emsp;&nbsp;家教具体地址只需填至小区或楼栋即可，无需填至门牌号!
	</font>
	</div>
   	<input id="id" type="hidden" name="parent.UId" value="<s:property value="#session.user.UId"/>">
</form>
</div>
</body>
<script type="text/javascript">

$(function()
{
	var id = $("#id").val();	
	$("#back").click(function()
	{
		window.location.href = "${path}/p_parenthome?parent.UId="+id;
	});
	
	//以下都是保存按钮点击以后所做的事
	$("#update").click(function() 
	{	
		//成功标识
		var isOk = validForm();
		if(isOk)
		{
			var id = $("#id").val();
			var name = $("#name").val();
			var gender = $("#gender").val();
			var character = $("#character").val();
			var grade = $("#grade").val();
			var area = $("#area").val();
			var address = $("#address").val();
			var moeny = $("#money").val();
			var limitgender = $("#limitgender").val();
			var other = $("#other").val();
			$.ajax
			({
				type:"post",
				url:"${path}/ajax_p_update",
				async:false,
				data:
				{
					"parent.UId":id,
					"parent.PName":name,
					"parent.PGender":gender,
					"parent.PCharacter":character,
					"parent.PGrade":grade,
					"parent.PArea":area,
					"parent.PAddress":address,
					"parent.PMoney":moeny,
					"parent.PLimitgender":limitgender,
					"parent.POther":other
				},
				success:function(responseText)
				{
					//alert(responseText)
					//弹窗
					if(responseText=="success")
					{
						window.location.href = "${path}/JJ_successtip1";
					}
					else
					{
						alert("修改失败！");
					}
				} 
			});		
		
			var setSubjecttypeIds = "";
			//获得列表中被选中的checkbox
			$("#subjecttypes input:checked").each(function()
			{
				setSubjecttypeIds = setSubjecttypeIds + $(this).val()+",";
			});
			$.ajax
			({
				url:"${path}/ajax_sy_setSubjecttypes",
				type:"post",
				data:
				{
					"parent.UId":id,
					"subjecttypeIds":setSubjecttypeIds
				},
				async:false,
				dataType:"text",
				success:function(responseText)
				{
					if(responseText=="success")
					{
						//alert("科目保存成功!");
					}
					else
					{
						alert("科目保存失败！");
					}
				}
			});
			
			var setTeachertypeIds = "";
			//获得列表中被选中的checkbox
			$("#teachertypes input:checked").each(function()
			{
				setTeachertypeIds = setTeachertypeIds + $(this).val()+",";
			});
			
			$.ajax
			({
				url:"${path}/ajax_ty_setTeachertypes",
				type:"post",
				data:
				{
					"parent.UId":id,
					"teachertypeIds":setTeachertypeIds
				},
				async:false,
				dataType:"text",
				success:function(responseText)
				{
					if(responseText=="success")
					{
						//alert("老师类别保存成功！");
					}
					else
					{
						alert("老师类别保存失败！");
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
	return isSubmit;
}
</script>
</html>