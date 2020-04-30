package cn.wyx.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.apache.commons.beanutils.BeanUtils;

import cn.wyx.dao.ParentDao;
import cn.wyx.dao.UsersDao;
import cn.wyx.model.Parent;
import cn.wyx.model.Prelease;
import cn.wyx.model.Signup;
import cn.wyx.model.Subjecttype;
import cn.wyx.model.Teacher;
import cn.wyx.model.Teachertype;
import cn.wyx.model.Users;
import cn.wyx.query.PreleaseQuery;
import cn.wyx.service.PreleaseService;
import cn.wyx.service.SignupService;
import cn.wyx.service.SubjecttypeService;
import cn.wyx.utils.Page;

import com.opensymphony.xwork2.ActionContext;

public class PreleaseAction extends BaseAction 
{	
	//引入
	private Parent parent;
	private ParentDao parentDao;
	
	private Users user;
	private UsersDao usersDao;
	
	private Prelease prelease;
	
	private PreleaseService preleaseService;
	private PreleaseQuery query = new PreleaseQuery();
	
	private SubjecttypeService subjecttypeService;
	
	//全查
	public String prelease_prelease()
	{		
		ActionContext context = ActionContext.getContext();		
		Integer pageNo = query.getPageNo();
		if(pageNo == null )
		{
			query.setPageNo(1);
		}	
		query.setUId(parent.getUId());
		query.setWhereQuery("parent");
		
		Page page = preleaseService.queryObjByCondition(query, exclude);		
		context.put("page", page);		
		return SUCCESS;
	}
	
	//发布页面信息查询
	public String prelease_info()
	{
		ActionContext context = ActionContext.getContext();	
		//查询学科信息				
		List<Subjecttype> list = subjecttypeService.list();
		Integer pageNo = query.getPageNo();
		if (pageNo == null)
		{
			query.setPageNo(1);
		}
		Page page = preleaseService.queryObjByCondition(query, exclude);
		context.put("page", page);	
		context.put("subjectList", list);
		return SUCCESS;
	}
	public String prelease_detail()
	{
		ActionContext context = ActionContext.getContext();	
		//查询对应发布信息
		prelease = preleaseService.getObj(prelease.getRId());	
		context.put("parent", prelease);
		return SUCCESS;
	}

	//增
	public void ajax_pr_release() throws IOException
	{
		String ispass = "ok";
		Integer count=0;
		
		Parent parent1 = parentDao.getObj(parent.getUId());	
		Set<Subjecttype> subjecttypes = parent1.getSubjecttypes();
		Set<Teachertype> teachertypes = parent1.getTeachertypes();
		Prelease prelease = new Prelease();	
		
		//极耗性能（需要改善）
		List<Prelease> list = preleaseService.list();
		if(!list.isEmpty())
		{
			for(Prelease b:list)
			{
				if(b.getUId().intValue() == parent.getUId().intValue())
				{
					long diffMinute = ((new Date().getTime() - b.getRTime().getTime())/(60*1000))/(24*60);		       
					if(diffMinute < 7)
					{
						count++;
					}
					if(diffMinute < 1)
					{
						ispass="fail";
						break;
					}
				}
			}
		}
		
		if(ispass=="ok" && count<3)
		{
			try
			{
				//parent1拷贝到prelease
				BeanUtils.copyProperties(prelease, parent1);
			} catch (Exception e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			prelease.setRTime(new Date());
			
			user = usersDao.getObj(parent.getUId());
			
			prelease.setPTel(user.getUTel());
			
			prelease.setSiCount(0);
			
			if(subjecttypes.toString() == "[]")
			{
				prelease.setPSubjecttype("[不限]");
			}
			else
			{
				prelease.setPSubjecttype(subjecttypes.toString());
			}
			if(teachertypes.toString() == "[]")
			{
				prelease.setPLimitteachertype("[不限]");
			}
			else
			{
				prelease.setPLimitteachertype(teachertypes.toString());
			}
			
			preleaseService.save(prelease);	
			
			response.getWriter().write("success");
		}
		else if(ispass == "ok")
		{
			response.getWriter().write("week");
		}
		else if(ispass == "fail")
		{
			response.getWriter().write("ex");
		}
		else
		{
			response.getWriter().write("why");
		}
	}
	
	//删
	public void prelease_detele() throws IOException
	{
		//删除对应发布信息
		preleaseService.delete(prelease.getRId());		
		response.getWriter().write("success");
	}
	
	
	//============================================setter and getter=====================================================
	public PreleaseQuery getQuery() 
	{
		return query;
	}
	public void setQuery(PreleaseQuery query)
	{
		this.query = query;
	}
	public PreleaseService getPreleaseService() 
	{
		return preleaseService;
	}
	public void setPreleaseService(PreleaseService preleaseService) 
	{
		this.preleaseService = preleaseService;
	}

	public Parent getParent()
	{
		return parent;
	}

	public void setParent(Parent parent)
	{
		this.parent = parent;
	}

	public ParentDao getParentDao()
	{
		return parentDao;
	}

	public void setParentDao(ParentDao parentDao)
	{
		this.parentDao = parentDao;
	}

	public Prelease getPrelease()
	{
		return prelease;
	}

	public void setPrelease(Prelease prelease)
	{
		this.prelease = prelease;
	}
	public SubjecttypeService getSubjecttypeService()
	{
		return subjecttypeService;
	}
	public void setSubjecttypeService(SubjecttypeService subjecttypeService)
	{
		this.subjecttypeService = subjecttypeService;
	}

	public Users getUser()
	{
		return user;
	}

	public void setUser(Users user)
	{
		this.user = user;
	}

	public UsersDao getUsersDao()
	{
		return usersDao;
	}

	public void setUsersDao(UsersDao usersDao)
	{
		this.usersDao = usersDao;
	}
	
}
