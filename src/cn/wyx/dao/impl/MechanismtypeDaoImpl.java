package cn.wyx.dao.impl;

import cn.wyx.dao.MechanismtypeDao;
import cn.wyx.model.Mechanismtype;
import cn.wyx.query.MechanismtypeQuery;

public class MechanismtypeDaoImpl extends BaseDaoImpl<Mechanismtype, MechanismtypeQuery> implements MechanismtypeDao 
{

	@Override
	public String createHql(MechanismtypeQuery equery) 
	{
		String hql = "from Mechanismtype t where 1=1 ";		
		return hql;
	}

	@Override
	public String createHqlCount(MechanismtypeQuery q) 
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String createHqlCondition(MechanismtypeQuery q) 
	{
		// TODO Auto-generated method stub
		return null;
	}
	
}
