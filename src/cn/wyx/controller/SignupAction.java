package cn.wyx.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import cn.wyx.dao.PreleaseDao;
import cn.wyx.dao.SignupDao;
import cn.wyx.dao.TeacherDao;
import cn.wyx.dao.UsersDao;
import cn.wyx.model.Prelease;
import cn.wyx.model.Signup;
import cn.wyx.model.Subjecttype;
import cn.wyx.model.Teacher;
import cn.wyx.model.Users;
import cn.wyx.query.PreleaseQuery;
import cn.wyx.query.SignupQuery;
import cn.wyx.query.TphotoQuery;
import cn.wyx.service.PreleaseService;
import cn.wyx.service.SignupService;
import cn.wyx.service.TphotoService;
import cn.wyx.utils.Page;

import com.opensymphony.xwork2.ActionContext;

public class SignupAction extends BaseAction 
{
	private Users user;
	private UsersDao usersDao;
	
	private Teacher teacher;
	private TeacherDao teacherDao;
	
	private Prelease prelease;
	private PreleaseDao preleaseDao;
	private PreleaseService preleaseService;

	private Signup signup;
	private SignupDao signupDao;
	private SignupService signupService;
	private SignupQuery query = new SignupQuery();
	
	
	private TphotoQuery queryphoto = new TphotoQuery();
	private TphotoService tphotoService;
	
	//private PreleaseQuery preleaseQuery = new PreleaseQuery();
	
	//增
	public void ajax_si_signup() throws IOException
	{
		String ispass = "ok";
		
		//极耗性能（需要改善）
		List<Signup> list = signupService.list();
		if(!list.isEmpty())
		{
			for(Signup b:list)
			{
				if(b.getTId() == teacher.getUId())
				{
					if(b.getRId().intValue() == prelease.getRId().intValue())
					{
						ispass="fail";
						break;
					}
				}
			}
		}
		
		user = usersDao.getObj(teacher.getUId());
		if(user.getUIsfinish() != 2)
		{
			ispass="nofinish";
		}
		
		if(ispass=="ok")
		{
			Signup signup = new Signup();
			
			Prelease prelease1 = preleaseDao.getObj(prelease.getRId());
			prelease1.setSiCount((prelease1.getSiCount()+1));
			preleaseService.update(prelease1);
			
			try
			{
				//prelease1拷贝到signup
				BeanUtils.copyProperties(signup, prelease1);
			} catch (IllegalAccessException | InvocationTargetException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			user = usersDao.getObj(teacher.getUId());
			signup.setTTel(user.getUTel());
			
			signup.setTId(teacher.getUId());
			signup.setSiTime(new Date());		
			signupService.save(signup);		
			response.getWriter().write("success");
		}
		else if(ispass == "nofinish")
		{
			response.getWriter().write("no");
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
	
	
	//查
	public String si_signup()
	{
		ActionContext context = ActionContext.getContext();
		Integer pageNo = query.getPageNo();
		if (pageNo == null)
		{
			query.setPageNo(1);
		}
		
		query.setTId(teacher.getUId());
		
		Page page = signupService.queryObjByCondition(query, exclude);
		
		context.put("page", page);	
		
		return SUCCESS;
	}
	
	//删
	public void si_detele() throws IOException
	{
		
		Signup signup1 = signupDao.getObj(signup.getSiId());
		Prelease prelease1 = preleaseDao.getObj(signup1.getRId());
		if(prelease1 != null)
		{
			prelease1.setSiCount((prelease1.getSiCount()-1));
			preleaseService.update(prelease1);
		}		
		
		//删除对应发布信息
		signupService.delete(signup.getSiId());		
		response.getWriter().write("success");
	}
	
	//查看报名人员
	public String si_signuppeople()
	{
		Integer pageNo = query.getPageNo();
		if (pageNo == null)
		{
			query.setPageNo(1);
		}
		
		query.setUId(prelease.getUId());
		query.setRId(prelease.getRId());
		query.setWhereQuery("people");
		
		Page page = signupService.queryObjByCondition(query, exclude);
		
		List<Integer> list= new ArrayList<Integer>();
		
		if(!page.getList().isEmpty())
		{
			for(Object b:page.getList())
			{
				list.add(((Signup) b).getTId());
			}
		}
		
		querybaomingpeople(list);
		
		return WYX;
	}
	public void querybaomingpeople(List<Integer> list)
	{
		//System.out.println(list);
		ActionContext context = ActionContext.getContext();		
		
		List<Teacher> peoplelist= new ArrayList<Teacher>();
		for (Integer t : list) 
		{
			Teacher teacher = teacherDao.getObj(t);
			peoplelist.add(teacher);
	    }
		
		context.put("page", peoplelist);			
	}
	
	//相册 
	public String si_teacherphotos()
	{	
		ActionContext context = ActionContext.getContext();		
		Integer pageNo = queryphoto.getPageNo();
		if (pageNo == null)
		{
			queryphoto.setPageNo(1);
		}
		queryphoto.setUId(teacher.getUId());
		
		Page page = tphotoService.queryObjByCondition(queryphoto, exclude);
	
		context.put("tphotos", page);
		
		return WYX;
	}
		
	//============================================setter and getter=====================================================
	public SignupQuery getQuery() 
	{
		return query;
	}
	public void setQuery(SignupQuery query)
	{
		this.query = query;
	}
	public SignupService getSignupService() 
	{
		return signupService;
	}
	public void setSignupService(SignupService signupService) 
	{
		this.signupService = signupService;
	}
	public Teacher getTeacher()
	{
		return teacher;
	}
	public void setTeacher(Teacher teacher)
	{
		this.teacher = teacher;
	}
	public Prelease getPrelease()
	{
		return prelease;
	}
	public void setPrelease(Prelease prelease)
	{
		this.prelease = prelease;
	}
	public PreleaseDao getPreleaseDao()
	{
		return preleaseDao;
	}
	public void setPreleaseDao(PreleaseDao preleaseDao)
	{
		this.preleaseDao = preleaseDao;
	}
	public PreleaseService getPreleaseService()
	{
		return preleaseService;
	}
	public void setPreleaseService(PreleaseService preleaseService)
	{
		this.preleaseService = preleaseService;
	}
	public Signup getSignup()
	{
		return signup;
	}
	public void setSignup(Signup signup)
	{
		this.signup = signup;
	}
	public SignupDao getSignupDao()
	{
		return signupDao;
	}
	public void setSignupDao(SignupDao signupDao)
	{
		this.signupDao = signupDao;
	}
	public TeacherDao getTeacherDao()
	{
		return teacherDao;
	}
	public void setTeacherDao(TeacherDao teacherDao)
	{
		this.teacherDao = teacherDao;
	}
	public TphotoQuery getQueryphoto()
	{
		return queryphoto;
	}
	public void setQueryphoto(TphotoQuery queryphoto)
	{
		this.queryphoto = queryphoto;
	}
	public TphotoService getTphotoService()
	{
		return tphotoService;
	}
	public void setTphotoService(TphotoService tphotoService)
	{
		this.tphotoService = tphotoService;
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
