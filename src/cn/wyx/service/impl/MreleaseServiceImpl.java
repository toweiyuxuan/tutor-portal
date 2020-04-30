package cn.wyx.service.impl;

import cn.wyx.dao.MreleaseDao;
import cn.wyx.model.Mrelease;
import cn.wyx.query.MreleaseQuery;
import cn.wyx.service.MreleaseService;

public class MreleaseServiceImpl extends BaseServiceImpl<Mrelease, MreleaseQuery> implements MreleaseService 
{	
	private MreleaseDao mreleaseDao;
	
	public void setMreleaseDao(MreleaseDao mreleaseDao) 
	{
		this.mreleaseDao = mreleaseDao;
		this.baseDao = mreleaseDao;
	}
}
