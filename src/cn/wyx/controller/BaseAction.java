package cn.wyx.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport
{	
	HttpServletRequest request;
	HttpServletResponse response;	
	HttpSession session;	
	ServletContext application;	
	
	//排除参数集合
	List<String> exclude = new ArrayList<String>();
	
	//返回 值标识
	String MAIN = "main";
	String WYX = "wyx";
	
	public BaseAction() 
	{
		exclude.add("pageNo");
		exclude.add("startNum");
		exclude.add("whereQuery");
		exclude.add("UId");
		exclude.add("TId");
		exclude.add("RId");
		
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		session = request.getSession();
		application = ServletActionContext.getServletContext();
	}
	
}

