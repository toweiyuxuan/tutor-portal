package cn.wyx.dao.impl;

import cn.wyx.dao.SignupDao;
import cn.wyx.model.Signup;
import cn.wyx.query.SignupQuery;

public class SignupDaoImpl extends BaseDaoImpl<Signup, SignupQuery> implements SignupDao 
{

	@Override
	public String createHql(SignupQuery equery) 
	{
		String hql = "from Signup s where 1=1 ";
		hql = hql + createHqlCondition(equery) + " order by s.siId desc";
		return hql;
	}

	@Override
	public String createHqlCount(SignupQuery q) 
	{
		String hql = "select count(siId) from Signup s where 1=1";
		hql = hql + createHqlCondition(q);
		return hql;
	}

	@Override
	public String createHqlCondition(SignupQuery equery) 
	{
		String hql = "";
		
		if(equery.getWhereQuery() == "people")
		{
			hql = hql + " and s.UId = " + equery.getUId().toString();
			hql = hql + " and s.RId = " + equery.getRId().toString();
		}
		else if(equery.getWhereQuery() == "isSignup")
		{
			hql = hql + " and s.TId = "+ equery.getUId().toString();
		}
		else
		{
			hql = hql + " and s.TId = "+ equery.getTId().toString();
		}
		
		return hql;
	}
	
}
