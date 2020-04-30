<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function() 
{
	//获得总页数和当前页码
	var totalPage = parseInt($("#totalPage").val());
	var pageNo = parseInt($("#cpageNo").val());
	if(pageNo == 1 && totalPage == 1)
	{
		$("#fir").hide();
		$("#pre").hide();
		$("#next").hide();
		$("#last").hide();
		$("#text1").hide();
		$("#text2").hide();
		$("#selectPage").hide();
		$("#jump").hide();
	}
	else if(pageNo == 1 && totalPage > pageNo)
	{
		$("#fir").hide();
		$("#pre").hide();
		$("#next").show();
		$("#last").show();
	}
	else if(pageNo > 1 && totalPage > pageNo)
	{
		$("#fir").show();
		$("#pre").show();
		$("#next").show();
		$("#last").show();
	}
	else if(pageNo > 1 && totalPage == pageNo)
	{
		$("#fir").show();
		$("#pre").show();
		$("#next").hide();
		$("#last").hide();
	}	
	
	$("#next").click(function()
	{
		$("#pageNo").val(pageNo + 1);
		$("form:first").submit();
	})
	
	$("#pre").click(function()
	{
		$("#pageNo").val(pageNo - 1);
		$("form:first").submit();
	})
	
	$("#fir").click(function()
	{
		$("#pageNo").val(1);
		$("form:first").submit();
	})
	$("#last").click(function()
	{
		$("#pageNo").val(totalPage);
		$("form:first").submit();
	})
	
	
	$("#jump").click(function()
	{
		var selectPageNo = $("#selectPage").val();
		
		var reg = /^\d{0,}$/;
		if(!reg.test(selectPageNo))
		{
			alert("请输入1到"+totalPage+"数字");
		}
		else
		{
			var selectPageNoNum = parseInt(selectPageNo);
			if(selectPageNoNum < 1 || selectPageNoNum > totalPage){
				alert("请输入1到"+totalPage+"数字");
			}
			else
			{
				$("#pageNo").val(selectPageNo);
				$("form:first").submit();
			}
		}	
	});
});
</script>
</head>
<body>
<table style="width: 100%;border:solid 1px #f6f5ec;">
	<tr align="center">
		<td width="25%" style="border: 0px;">
			<!-- 
				用两个隐藏去来计算是否展示哪些按钮
			--> 
			<input type="hidden" id="totalPage"value="<s:property value="#page.totalPage"/>"> 
			<input type="hidden" id="cpageNo" value="<s:property value="#page.pageNo"/>">
			<input type="hidden" id="pageNo" name="query.pageNo" value="<s:property value="#page.pageNo"/>">
			
			共 
			<s:property value="#page.totalCount"/>
			条记录
		</td>
		
		<td align="center" style="border: 0px; width:8%;">
			<a href="javascript:void(0);" id="fir" style="color: blue;">首页</a>
		</td>
			
		<td align="center" style="border: 0px; width:8%;">
			<a href="javascript:void(0);" id="pre" style="color: blue;">上一页</a>
		</td>
			
		<td align="center" style="border: 0px; width:8%;">
			<a href="javascript:void(0);" id="next" style="color: blue;">下一页</a>
		</td>
			
		<td align="center" style="border: 0px; width:8%;">
			<a href="javascript:void(0);" id="last" style="color: blue;">尾页</a>
		</td>
			
		<td align="center" style="border: 0px; width:12%;">
			<a id="text1" style="color: gray;">转到第</a>
			<input type="text" id="selectPage" value="<s:property value="#page.pageNo"/>" style="width: 25px;color: gray;">
			<a id="text2" style="color: gray;">页</a>
		</td>
			
		<td align="center" style="border: 0px; width:8%;">
			<a href="javascript:void(0);" id="jump" style="color: blue;">跳转</a>
		</td>			
		
		<td width="25%" style="border: 0px;">
			当前第
			<span><s:property value="#page.pageNo"/></span>
			/ 
			<s:property value="#page.totalPage"/>
			页
		</td>
	</tr>
</table>
</body>
</html>