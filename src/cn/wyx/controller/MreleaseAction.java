package cn.wyx.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;

import cn.wyx.dao.MechanismDao;
import cn.wyx.dao.TeachertypeDao;
import cn.wyx.dao.UsersDao;
import cn.wyx.model.Mechanism;
import cn.wyx.model.Mechanismtype;
import cn.wyx.model.Mrelease;
import cn.wyx.model.Parent;
import cn.wyx.model.Prelease;
import cn.wyx.model.Signup;
import cn.wyx.model.Subjecttype;
import cn.wyx.model.Teachertype;
import cn.wyx.model.Users;
import cn.wyx.query.MechanismQuery;
import cn.wyx.query.MreleaseQuery;
import cn.wyx.service.MechanismService;
import cn.wyx.service.MreleaseService;
import cn.wyx.service.TeachertypeService;
import cn.wyx.utils.Page;

import com.opensymphony.xwork2.ActionContext;

public class MreleaseAction extends BaseAction 
{	
	private Mechanism mechanism;
	private MechanismDao mechanismDao;
	private MechanismService mechanismService;
	
	private Users user;
	private UsersDao usersDao;
	
	//���Զ���,���ڽ���ҳ�洫������ֵ
	private String teachertypeIds;
	private Integer limitgender;
	
	private TeachertypeDao teachertypeDao;
	private TeachertypeService teachertypeService;
	
	private Mrelease mrelease;
	private MreleaseService mreleaseService;
	private MreleaseQuery query = new MreleaseQuery();
	
	//��ҳչʾ�����з�����Ϣ
	public String mrelease_mrelease()
	{		
		ActionContext context = ActionContext.getContext();		
		Integer pageNo = query.getPageNo();
		if(pageNo == null )
		{
			query.setPageNo(1);
		}
		Page page = mreleaseService.queryObjByCondition(query, exclude);		
		context.put("page", page);		
		return SUCCESS;
	}
	
	//����������Ϣѡ����ʦ����
	public String mr_mrelease()
	{
		ActionContext context = ActionContext.getContext();
		
		//��ʦ������Ϣ
		List<Teachertype> teachertypelist = teachertypeService.list();
		context.put("teacherList", teachertypelist);
		
		return SUCCESS;	
	}
	
	//��
	public void ajax_mr_release() throws IOException
	{
		String ispass = "ok";
		Integer count=0;
		
		Mechanism mechanism1 = mechanismDao.getObj(mechanism.getUId());	
		Set<Mechanismtype> mechanismtypes = mechanism1.getMechanismtypes();
		
		//��ѯ������Ϣ
		Mrelease mrelease = new Mrelease();
		
		//�������ܣ���Ҫ���ƣ�
		List<Mrelease> list = mreleaseService.list();
		if(!list.isEmpty())
		{
			for(Mrelease b:list)
			{
				if(b.getUId().intValue() == mechanism.getUId().intValue())
				{
					long diffMinute = ((new Date().getTime() - b.getRTime().getTime())/(60*1000))/(24*60);	
					System.out.println("----------------------------------"+diffMinute);
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
		user = usersDao.getObj(mechanism.getUId());
		if(user.getUIsfinish() != 2)
		{
			ispass="nofinish";
		}
		
		if(ispass=="ok" && count<2)
		{
			try
			{
				//mechanism������Mrelease
				BeanUtils.copyProperties(mrelease, mechanism1);
			} catch (IllegalAccessException | InvocationTargetException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			List<String> list1 = new ArrayList();
			if(StringUtils.isNotBlank(teachertypeIds))
			{
				String[] ids = teachertypeIds.split(",");
				for(String teachertypeId : ids)
				{
					//����id���Ҫ����ѧ��
					Teachertype teachertype = teachertypeDao.getObj(new Integer(teachertypeId));
					list1.add(teachertype.getTtName());
				}
			}
			if(list1.toString() == "[]")
			{
				mrelease.setMTeachertype("[����]");
			}
			else
			{
				mrelease.setMTeachertype(list1.toString());
			}
			mrelease.setRTime(new Date());
			mrelease.setMLimitgender(limitgender);
			mrelease.setMMechanismtype(mechanismtypes.toString());
			
			user = usersDao.getObj(mechanism.getUId());
			mrelease.setMTel(user.getUTel());
			
			mreleaseService.save(mrelease);
			
			response.getWriter().write("success");
		}
		else if(ispass == "nofinish")
		{
			response.getWriter().write("no");
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
	
	//������ѯ������Ϣ
	public String mr_mmrelease()
	{
		ActionContext context = ActionContext.getContext();		
		Integer pageNo = query.getPageNo();
		if(pageNo == null )
		{
			query.setPageNo(1);
		}	
		query.setUId(mechanism.getUId());
		query.setWhereQuery("mrelease");
		
		Page page = mreleaseService.queryObjByCondition(query, exclude);		
		context.put("page", page);		
		return SUCCESS;
	}
	
	//ɾ
	public void mr_detele() throws IOException
	{
		//ɾ����Ӧ������Ϣ
		mreleaseService.delete(mrelease.getRId());		
		response.getWriter().write("success");
	}
		
	//����ҳ����Ϣ��ѯ
	public String mr_info()
	{
		ActionContext context = ActionContext.getContext();	
		Integer pageNo = query.getPageNo();
		if (pageNo == null)
		{
			query.setPageNo(1);
		}
		Page page = mreleaseService.queryObjByCondition(query, exclude);
		context.put("page", page);
		return SUCCESS;
	}
	
	//��ҳ��ϸ��Ϣչʾ
	public String mr_detail()
	{
		ActionContext context = ActionContext.getContext();	
		//��ѯ��Ӧ������Ϣ
		mrelease = mreleaseService.getObj(mrelease.getRId());	
		context.put("mrelease", mrelease);
		return SUCCESS;
	}
	
	//============================================setter and getter=====================================================
	public MreleaseQuery getQuery() 
	{
		return query;
	}
	public void setQuery(MreleaseQuery query)
	{
		this.query = query;
	}
	public MreleaseService getMreleaseService() 
	{
		return mreleaseService;
	}
	public void setMreleaseService(MreleaseService mreleaseService) 
	{
		this.mreleaseService = mreleaseService;
	}

	public TeachertypeService getTeachertypeService()
	{
		return teachertypeService;
	}

	public void setTeachertypeService(TeachertypeService teachertypeService)
	{
		this.teachertypeService = teachertypeService;
	}

	public Mechanism getMechanism()
	{
		return mechanism;
	}

	public void setMechanism(Mechanism mechanism)
	{
		this.mechanism = mechanism;
	}

	public MechanismService getMechanismService()
	{
		return mechanismService;
	}

	public void setMechanismService(MechanismService mechanismService)
	{
		this.mechanismService = mechanismService;
	}

	public String getTeachertypeIds()
	{
		return teachertypeIds;
	}

	public void setTeachertypeIds(String teachertypeIds)
	{
		this.teachertypeIds = teachertypeIds;
	}

	public Integer getLimitgender()
	{
		return limitgender;
	}

	public void setLimitgender(Integer limitgender)
	{
		this.limitgender = limitgender;
	}

	public TeachertypeDao getTeachertypeDao()
	{
		return teachertypeDao;
	}

	public void setTeachertypeDao(TeachertypeDao teachertypeDao)
	{
		this.teachertypeDao = teachertypeDao;
	}
	
	public Mrelease getMrelease()
	{
		return mrelease;
	}

	public void setMrelease(Mrelease mrelease)
	{
		this.mrelease = mrelease;
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

	public MechanismDao getMechanismDao()
	{
		return mechanismDao;
	}

	public void setMechanismDao(MechanismDao mechanismDao)
	{
		this.mechanismDao = mechanismDao;
	}
	
}
