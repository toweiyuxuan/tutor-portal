package cn.wyx.dao.impl;

import org.apache.commons.lang.StringUtils;

import cn.wyx.dao.MreleaseDao;
import cn.wyx.model.Mrelease;
import cn.wyx.query.MreleaseQuery;

public class MreleaseDaoImpl extends BaseDaoImpl<Mrelease, MreleaseQuery> implements MreleaseDao 
{

	@Override
	public String createHql(MreleaseQuery equery) 
	{
		String hql = "from Mrelease m where 1=1 ";
		hql = hql + createHqlCondition(equery) + " order by m.RId desc";
		return hql;
	}

	@Override
	public String createHqlCount(MreleaseQuery q) 
	{
		String hql = "select count(RId) from Mrelease m where 1=1";
		hql = hql + createHqlCondition(q);
		return hql;
	}

	@Override
	public String createHqlCondition(MreleaseQuery equery) 
	{
		String hql = "";
		
		if (equery.getMArea() != null)
		{
			hql = hql + " and m.MArea = :MArea";
		}	
		
		if (equery.getWhereQuery() == "mrelease")
		{
			hql = hql + " and m.UId = " + equery.getUId().toString();
		}

		return hql;
	}
	
}
