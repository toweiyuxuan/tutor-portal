package cn.wyx.service.impl;

import cn.wyx.dao.PreleaseDao;
import cn.wyx.model.Prelease;
import cn.wyx.query.PreleaseQuery;
import cn.wyx.service.PreleaseService;

public class PreleaseServiceImpl extends BaseServiceImpl<Prelease, PreleaseQuery> implements PreleaseService 
{	
	private PreleaseDao preleaseDao;
	
	public void setPreleaseDao(PreleaseDao preleaseDao) 
	{
		this.preleaseDao = preleaseDao;
		this.baseDao = preleaseDao;
	}
}
