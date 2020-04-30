package cn.wyx.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import cn.wyx.dao.PphotoDao;
import cn.wyx.model.Parent;
import cn.wyx.model.Pphoto;
import cn.wyx.model.Users;
import cn.wyx.query.PphotoQuery;
import cn.wyx.service.PphotoService;
import cn.wyx.service.UsersService;
import cn.wyx.utils.Page;

import com.opensymphony.xwork2.ActionContext;

public class PphotoAction extends BaseAction 
{
	private Users user;
	private UsersService usersService;
	//引入
	private PphotoDao pphotoDao;
	private PphotoService pphotoService;
	
	//注入，接收页面传值（并不是非要定义对象实体）
	private Parent parent;
	
	//定义属性值，接收页面传值
	private File[] upload;
	
	//文件名的接收 File属性名FileName:固定写法
	private String[] uploadFileName;
	
	//图片上传
	public void ajax_pp_upload() throws Exception
	{
		String result = "fail";
		// 获得servletContext
		ServletContext sc = ServletActionContext.getServletContext();	
		
		Pphoto pphoto = pphotoDao.getObj(parent.getUId());
		
		// 获得服务的绝对路径
		for (int i = 0; i < upload.length; i++)
		{
			String suffix = uploadFileName[i].substring(uploadFileName[i].lastIndexOf("."));
			
			String fileName = UUID.randomUUID().toString();
			
			String basepath = "/ppupload/" + fileName + suffix;
			
			if(i==0)
			{
				pphoto.setPpZaddress(basepath);
			}
			if(i==1)
			{
				pphoto.setPpFaddress(basepath);
			}
			if(i==2)
			{
				pphoto.setPpSaddress(basepath);
				
				pphotoService.save(pphoto);
				
				//提交之后
				user = usersService.getObj(parent.getUId());
				user.setUAttestation(2);
				usersService.updateUsers(user);
				
				result="ok";
			}
			
			String realPath = sc.getRealPath("/");
			
			//路径追加
			realPath = realPath + basepath;
			
			// 定义输入输出流
			FileUtils.copyFile(upload[i], new File(realPath));
		}
		response.setContentType("text/html");
		response.getWriter().write(result);
	}
		
	
	
	
	//============================================setter and getter=====================================================
	
	public PphotoService getPphotoService() 
	{
		return pphotoService;
	}
	public void setPphotoService(PphotoService pphotoService) 
	{
		this.pphotoService = pphotoService;
	}
	public PphotoDao getPphotoDao()
	{
		return pphotoDao;
	}
	public void setPphotoDao(PphotoDao pphotoDao)
	{
		this.pphotoDao = pphotoDao;
	}
	public Parent getParent()
	{
		return parent;
	}
	public void setParent(Parent parent)
	{
		this.parent = parent;
	}
	public File[] getUpload()
	{
		return upload;
	}
	public void setUpload(File[] upload)
	{
		this.upload = upload;
	}
	public String[] getUploadFileName()
	{
		return uploadFileName;
	}
	public void setUploadFileName(String[] uploadFileName)
	{
		this.uploadFileName = uploadFileName;
	}
	public Users getUser()
	{
		return user;
	}
	public void setUser(Users user)
	{
		this.user = user;
	}
	public UsersService getUsersService()
	{
		return usersService;
	}
	public void setUsersService(UsersService usersService)
	{
		this.usersService = usersService;
	}
	
}
