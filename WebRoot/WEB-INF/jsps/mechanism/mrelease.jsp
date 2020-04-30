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
&nbsp;招聘信息发布
</h3>
<div class="helper-dialog-footer helper-noselect">
	<div style="float:right;width: 50px;" class="helper-dialog-yes" id="fabu">发布</div>
	<div style="float:right;width: 50px;" class="helper-dialog-yes" id="back">返回</div>
</div>
<form id="updateForm">
	<table style="background-image:url(${path}/main/images/x.jpg);background-size: 100% 100%;" height="500px">
       	<tr id="teachertypes" height="40">
           	<td width="150" align="right">招聘老师类型：</td>
           	<td>
           		<s:iterator value="#teacherList" var="teacher">
					<input name="wyx" onclick="teacher(this)" type="checkbox" value="<s:property value="#teacher.ttId"/>"/>
					<s:property value="#teacher.ttName"/>
				</s:iterator>&nbsp;&nbsp;
				<span><font size="1" color="skyblue">未选择代表不限制</font></span>
           	</td>
        </tr>
	 	<tr height="40">
	    	<td align="right">招聘老师性别：</td>
	    	<td>
           		<s:select id="limitgender" list="#{'0':'不限制','1':'限男生','2':'限女生'}" name="parent.MLimitgender" cssStyle="border:solid 1px #ccc;color:gray;"></s:select>
			</td>
	  	</tr>
	  	<tr></tr>
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
	
	$("#fabu").click(function()
	{
		var gender = $("#limitgender").val();
		var setSubjecttypeIds = "";
		//获得列表中被选中的checkbox
		$("#teachertypes input:checked").each(function()
		{
			setSubjecttypeIds = setSubjecttypeIds + $(this).val()+",";
		});
	
		$.ajax
		({
			url:"${path}/ajax_mr_release",
			type:"post",
			data:
			{
				"mechanism.UId":id,
				"limitgender":gender,
				"teachertypeIds":setSubjecttypeIds			
			},
			async:false,
			dataType:"text",
			success:function(responseText)
			{
				if(responseText=="success")
				{
					alert("发布成功");
					window.location.href = "${path}/m_mechanismhome?mechanism.UId="+id;
				}
				else if(responseText=="no")
				{
					alert("发布失败，机构信息未完善！");
					window.location.href = "${path}/m_update?mechanism.UId="+id;
				}
				else if(responseText=="ex" || responseText=="week")
				{
					alert("发布失败，每天只能发布一条，每周只能发布两条！");
					window.location.href = "${path}/m_mechanismhome?mechanism.UId="+id;
				}
				else
				{
					alert("发布失败，原因未知！");
				}
			}
		});
	});
});
</script>
</html>