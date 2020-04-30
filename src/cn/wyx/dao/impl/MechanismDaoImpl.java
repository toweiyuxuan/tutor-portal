package cn.wyx.dao.impl;

import cn.wyx.dao.MechanismDao;
import cn.wyx.model.Mechanism;
import cn.wyx.query.MechanismQuery;

public class MechanismDaoImpl extends BaseDaoImpl<Mechanism, MechanismQuery> implements MechanismDao 
{

	@Override
	public String createHql(MechanismQuery equery) 
	{
		String hql = "from Mechanism m where 1=1 ";
		hql = hql + createHqlCondition(equery) ;//+ " order by mp.mpId desc";
		return hql;
	}

	@Override
	public String createHqlCount(MechanismQuery q) 
	{
		String hql = "select count(UId) from Mechanism m where 1=1";
		hql = hql + createHqlCondition(q);
		return hql;
	}

	@Override
	public String createHqlCondition(MechanismQuery equery) 
	{
		String hql = " and m.user.UIsfinish = 2 and m.user.UStation = 1";	
		return hql;
	}
	
}
