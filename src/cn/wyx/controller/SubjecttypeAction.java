package cn.wyx.controller;

import java.io.IOException;

import cn.wyx.model.Parent;
import cn.wyx.query.SubjecttypeQuery;
import cn.wyx.service.SubjecttypeService;
import cn.wyx.utils.Page;

import com.opensymphony.xwork2.ActionContext;

public class SubjecttypeAction extends BaseAction 
{	
	private SubjecttypeService subjecttypeService;
	
	//属性定义,用于接收页面传过来的值
	private String subjecttypeIds;
	
	//引入
	private Parent parent;
	
	/*
	 * 学科信息设置
	 */
	public void ajax_sy_setSubjecttypes() throws IOException
	{
		subjecttypeService.updateSubjecttype(parent.getUId(), subjecttypeIds);
		response.getWriter().write("success");
	}
	
	//============================================setter and getter=====================================================
	public SubjecttypeService getSubjecttypeService() 
	{
		return subjecttypeService;
	}
	public void setSubjecttypeService(SubjecttypeService subjecttypeService) 
	{
		this.subjecttypeService = subjecttypeService;
	}

	public String getSubjecttypeIds()
	{
		return subjecttypeIds;
	}

	public void setSubjecttypeIds(String subjecttypeIds)
	{
		this.subjecttypeIds = subjecttypeIds;
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
