package cn.wyx.dao.impl;

import cn.wyx.dao.ParentDao;
import cn.wyx.model.Parent;
import cn.wyx.query.ParentQuery;

public class ParentDaoImpl extends BaseDaoImpl<Parent, ParentQuery> implements ParentDao 
{

	@Override
	public String createHql(ParentQuery equery) 
	{
		String hql = "from Parent t where 1=1 ";		
		return hql;
	}

	@Override
	public String createHqlCount(ParentQuery q) 
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String createHqlCondition(ParentQuery q) 
	{
		// TODO Auto-generated method stub
		return null;
	}
	
}
