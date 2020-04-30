package cn.wyx.dao.impl;

import cn.wyx.dao.PphotoDao;
import cn.wyx.model.Pphoto;
import cn.wyx.query.PphotoQuery;

public class PphotoDaoImpl extends BaseDaoImpl<Pphoto, PphotoQuery> implements PphotoDao 
{

	@Override
	public String createHql(PphotoQuery equery) 
	{
		String hql = "from Pphoto t where 1=1 ";		
		return hql;
	}

	@Override
	public String createHqlCount(PphotoQuery q) 
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String createHqlCondition(PphotoQuery q) 
	{
		// TODO Auto-generated method stub
		return null;
	}
	
}
