package cn.wyx.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import cn.wyx.dao.TeacherDao;
import cn.wyx.model.Teacher;
import cn.wyx.model.Teachertype;
import cn.wyx.model.Users;
import cn.wyx.query.TeacherQuery;
import cn.wyx.service.TeacherService;
import cn.wyx.service.TeachertypeService;
import cn.wyx.service.UsersService;
import cn.wyx.utils.MD5Utils;
import cn.wyx.utils.Page;

import com.opensymphony.xwork2.ActionContext;

public class TeacherAction extends BaseAction 
{
	
	private Users user;
	private UsersService usersService;
	
	private Teacher teacher;
	private TeacherDao teacherDao;
	private TeacherService teacherService;	
	
	private TeachertypeService teachertypeService;
	
	private String originpassword;
	
	//用于接收微信二维码
	private File[] upload;
	//文件名的接收 File属性名FileName:固定写法
	private String[] uploadFileName;
	
	
	
	//查
	public String t_teacherhome()
	{
		ActionContext context = ActionContext.getContext();	
		//查询老师个人信息
		teacher = teacherService.getObj(teacher.getUId());	
		context.put("Teacher", teacher);
		//查询学科信息
		List<Teachertype> list = teachertypeService.list();
		context.put("teacherList", list);		
		return SUCCESS;
	}
		
	//改
	public String t_update()
	{
		ActionContext context = ActionContext.getContext();	
		
		//查询老师个人信息
		teacher = teacherService.getObj(teacher.getUId());	
		context.put("Teacher", teacher);	
	
		//查询老师类型信息
		List<Teachertype> list = teachertypeService.list();
		context.put("teacherList", list);
		
		return SUCCESS;
	}
	public void ajax_t_update() throws IOException
	{		
		Teacher teacher1 = teacherDao.getObj(teacher.getUId());
		
		// 获得servletContext
		ServletContext sc = ServletActionContext.getServletContext();	
		
		if(upload != null)
		{
			// 获得服务的绝对路径
			for (int i = 0; i < upload.length; i++)
			{
				String suffix = uploadFileName[i].substring(uploadFileName[i].lastIndexOf("."));
				
				String fileName = UUID.randomUUID().toString();
				
				String basepath = "/tpwupload/" + fileName + suffix;
				
				teacher.setTWechat(basepath);
				
				String realPath = sc.getRealPath("/");
				
				//路径追加
				realPath = realPath + basepath;
				
				// 定义输入输出流
				FileUtils.copyFile(upload[i], new File(realPath));
			}
		}
		else
		{
			teacher.setTWechat(teacher1.getTWechat());
		}
				
		teacherService.updateTeacher(teacher);
		
		//完善以后
		user = usersService.getObj(teacher.getUId());
		user.setUIsfinish(2);
		usersService.updateUsers(user);
		
		response.setContentType("text/html");
		response.getWriter().write("success");
	}
	
	//修改密码
	public void ajax_t_updatepass() throws IOException
	{
		Users user1 = usersService.getObj(user.getUId());
		if(!MD5Utils.md5(originpassword).equals(user1.getUPassword()))
		{
			response.getWriter().write("fail");
		}
		if(MD5Utils.md5(originpassword).equals(user1.getUPassword()))
		{
			user1.setUPassword(MD5Utils.md5(user.getUPassword()));
			usersService.updateUsers(user1);
			response.getWriter().write("success");
		}
	}
	
	
	//============================================setter and getter=====================================================
	
	public TeacherService getTeacherService() 
	{
		return teacherService;
	}
	public void setTeacherService(TeacherService teacherService) 
	{
		this.teacherService = teacherService;
	}

	public Teacher getTeacher()
	{
		return teacher;
	}

	public void setTeacher(Teacher teacher)
	{
		this.teacher = teacher;
	}

	public TeacherDao getTeacherDao()
	{
		return teacherDao;
	}

	public void setTeacherDao(TeacherDao teacherDao)
	{
		this.teacherDao = teacherDao;
	}

	public TeachertypeService getTeachertypeService()
	{
		return teachertypeService;
	}

	public void setTeachertypeService(TeachertypeService teachertypeService)
	{
		this.teachertypeService = teachertypeService;
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

	public String getOriginpassword()
	{
		return originpassword;
	}

	public void setOriginpassword(String originpassword)
	{
		this.originpassword = originpassword;
	}
	
}
