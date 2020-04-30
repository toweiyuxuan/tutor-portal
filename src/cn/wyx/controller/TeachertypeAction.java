package cn.wyx.controller;

import java.io.IOException;

import cn.wyx.model.Parent;
import cn.wyx.query.TeachertypeQuery;
import cn.wyx.service.TeachertypeService;
import cn.wyx.utils.Page;

import com.opensymphony.xwork2.ActionContext;

public class TeachertypeAction extends BaseAction 
{	
	private TeachertypeService teachertypeService;
	
	//属性定义,用于接收页面传过来的值
	private String teachertypeIds;
	
	//引入
	private Parent parent;
	
	/*
	 * 老师类型设置
	 */
	public void ajax_ty_setTeachertypes() throws IOException
	{
		teachertypeService.updateTeachertype(parent.getUId(), teachertypeIds);
		response.getWriter().write("success");
	}
		
	//============================================setter and getter=====================================================
	
	public TeachertypeService getTeachertypeService() 
	{
		return teachertypeService;
	}
	public void setTeachertypeService(TeachertypeService teachertypeService) 
	{
		this.teachertypeService = teachertypeService;
	}

	public String getTeachertypeIds()
	{
		return teachertypeIds;
	}

	public void setTeachertypeIds(String teachertypeIds)
	{
		this.teachertypeIds = teachertypeIds;
	}

	public Parent getParent()
	{
		return parent;
	}

	public void setParent(Parent parent)
	{
		this.parent = parent;
	}
	
}
