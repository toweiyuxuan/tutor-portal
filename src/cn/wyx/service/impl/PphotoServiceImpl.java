package cn.wyx.service.impl;

import cn.wyx.dao.PphotoDao;
import cn.wyx.model.Pphoto;
import cn.wyx.query.PphotoQuery;
import cn.wyx.service.PphotoService;

public class PphotoServiceImpl extends BaseServiceImpl<Pphoto, PphotoQuery> implements PphotoService 
{	
	private PphotoDao pphotoDao;
	
	public void setPphotoDao(PphotoDao pphotoDao) 
	{
		this.pphotoDao = pphotoDao;
		this.baseDao = pphotoDao;
	}
}
