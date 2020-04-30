package cn.wyx.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import cn.wyx.dao.MechanismDao;
import cn.wyx.dao.MphotoDao;
import cn.wyx.model.Mechanism;
import cn.wyx.model.Mechanismtype;
import cn.wyx.model.Mphoto;
import cn.wyx.model.Subjecttype;
import cn.wyx.model.Teacher;
import cn.wyx.model.Teachertype;
import cn.wyx.model.Users;
import cn.wyx.query.MechanismQuery;
import cn.wyx.query.MphotoQuery;
import cn.wyx.service.MechanismService;
import cn.wyx.service.MechanismtypeService;
import cn.wyx.service.MphotoService;
import cn.wyx.service.TeachertypeService;
import cn.wyx.service.UsersService;
import cn.wyx.utils.MD5Utils;
import cn.wyx.utils.Page;

import com.opensymphony.xwork2.ActionContext;

public class MechanismAction extends BaseAction 
{
	private Users user;
	private UsersService usersService;
	
	private MechanismtypeService mechanismtypeService; 
	
	private MphotoService mphotoService;
	private MphotoQuery mphotoquery = new MphotoQuery();
	
	private MphotoDao mphotoDao; 
	
	private Mechanism mechanism;
	private MechanismService mechanismService;
	private MechanismDao mechanismDao;
	private MechanismQuery query = new MechanismQuery();
	
	private String originpassword;
	
	//用于接收微信二维码
	private File[] upload;
	//文件名的接收 File属性名FileName:固定写法
	private String[] uploadFileName;
	
	//首页展示的所有发布信息
	public String mechanismpage_mechanism()
	{
		ActionContext context = ActionContext.getContext();		
		Integer pageNo = query.getPageNo();
		if(pageNo == null )
		{
			query.setPageNo(1);
		}
		Page page = mechanismService.queryObjByCondition(query, exclude);		
		context.put("page", page);		
		return WYX;
	}
	
	
	public String m_mechanismhome()
	{
		ActionContext context = ActionContext.getContext();
		
		//查询机构信息
		mechanism = mechanismService.getObj(mechanism.getUId());	
		context.put("mechanism", mechanism);
		
		//查询标签信息
		List<Mechanismtype> mechanismtypes = mechanismtypeService.getStateMechanismtypes(mechanism.getUId());
		context.put("mechanismtypeList", mechanismtypes);
		
		return SUCCESS;	
	}
	
	//修改数据查询
	public String m_update()
	{
		ActionContext context = ActionContext.getContext();
		
		//查询家长个人信息
		mechanism = mechanismService.getObj(mechanism.getUId());	
		context.put("mechanism", mechanism);
		
		//查询标签信息
		List<Mechanismtype> mechanismtypes = mechanismtypeService.getStateMechanismtypes(mechanism.getUId());
		context.put("mechanismtypeList", mechanismtypes);
		
		return SUCCESS;
	}
	
	//修改密码
	public void ajax_m_updatepass() throws IOException
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
	
	//正真的修改操作
	public void ajax_m_update() throws IOException
	{	
		Mechanism mechanism1 = mechanismDao.getObj(mechanism.getUId());
		// 获得servletContext
		ServletContext sc = ServletActionContext.getServletContext();	
		
		if(upload != null)
		{
			// 获得服务的绝对路径
			for (int i = 0; i < upload.length; i++)
			{
				String suffix = uploadFileName[i].substring(uploadFileName[i].lastIndexOf("."));
				
				String fileName = UUID.randomUUID().toString();
				
				String basepath = "/mpwupload/" + fileName + suffix;
				
				mechanism.setMHomepage(basepath);
				
				String realPath = sc.getRealPath("/");
				
				//路径追加
				realPath = realPath + basepath;
				
				// 定义输入输出流
				FileUtils.copyFile(upload[i], new File(realPath));
			}
		}
		else
		{
			mechanism.setMHomepage(mechanism1.getMHomepage());
		}
				
		mechanismService.updateMechanism(mechanism);
		
		//完善以后
		user = usersService.getObj(mechanism.getUId());
		user.setUIsfinish(2);
		usersService.updateUsers(user);
		
		response.setContentType("text/html");
		response.getWriter().write("success");
	}
	
	//主页
	public String m_mechanismpage()
	{
		ActionContext context = ActionContext.getContext();	
		mechanism = mechanismService.getObj(mechanism.getUId());
		context.put("mechanism", mechanism);
		
		//查询标签信息
		List<Mechanismtype> mechanismtypes = mechanismtypeService.getStateMechanismtypes(mechanism.getUId());
		context.put("mechanismtypeList", mechanismtypes);

		//查询机构图片
		Integer pageNo = mphotoquery.getPageNo();
		if(pageNo == null )
		{
			mphotoquery.setPageNo(1);
		}
		mphotoquery.setUId(mechanism.getUId());
		Page mphotosList = mphotoService.queryObjByCondition(mphotoquery, exclude);		
		context.put("mphotosList", mphotosList);
		return SUCCESS;
	}
	
	
	//============================================setter and getter=====================================================
	public MechanismQuery getQuery() 
	{
		return query;
	}
	public void setQuery(MechanismQuery query)
	{
		this.query = query;
	}
	public MechanismService getMechanismService() 
	{
		return mechanismService;
	}
	public void setMechanismService(MechanismService mechanismService) 
	{
		this.mechanismService = mechanismService;
	}

	public Mechanism getMechanism()
	{
		return mechanism;
	}

	public void setMechanism(Mechanism mechanism)
	{
		this.mechanism = mechanism;
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

	public MechanismtypeService getMechanismtypeService()
	{
		return mechanismtypeService;
	}

	public void setMechanismtypeService(MechanismtypeService mechanismtypeService)
	{
		this.mechanismtypeService = mechanismtypeService;
	}

	public MechanismDao getMechanismDao()
	{
		return mechanismDao;
	}

	public void setMechanismDao(MechanismDao mechanismDao)
	{
		this.mechanismDao = mechanismDao;
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


	public MphotoDao getMphotoDao()
	{
		return mphotoDao;
	}


	public void setMphotoDao(MphotoDao mphotoDao)
	{
		this.mphotoDao = mphotoDao;
	}


	public MphotoService getMphotoService()
	{
		return mphotoService;
	}


	public void setMphotoService(MphotoService mphotoService)
	{
		this.mphotoService = mphotoService;
	}


	public MphotoQuery getMphotoquery()
	{
		return mphotoquery;
	}


	public void setMphotoquery(MphotoQuery mphotoquery)
	{
		this.mphotoquery = mphotoquery;
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
