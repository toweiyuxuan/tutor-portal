package cn.wyx.service.impl;

import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;

import cn.wyx.dao.MechanismDao;
import cn.wyx.dao.MechanismtypeDao;
import cn.wyx.dao.SubjecttypeDao;
import cn.wyx.model.Mechanism;
import cn.wyx.model.Mechanismtype;
import cn.wyx.model.Parent;
import cn.wyx.model.Subjecttype;
import cn.wyx.query.MechanismtypeQuery;
import cn.wyx.service.MechanismtypeService;

public class MechanismtypeServiceImpl extends BaseServiceImpl<Mechanismtype, MechanismtypeQuery> implements MechanismtypeService 
{
	//ע��
	private MechanismDao mechanismDao;
	
	public MechanismDao getMechanismDao()
	{
		return mechanismDao;
	}

	public void setMechanismDao(MechanismDao mechanismDao)
	{
		this.mechanismDao = mechanismDao;
	}

	public MechanismtypeDao getMechanismtypeDao()
	{
		return mechanismtypeDao;
	}

	private MechanismtypeDao mechanismtypeDao;
	
	public void setMechanismtypeDao(MechanismtypeDao mechanismtypeDao) 
	{
		this.mechanismtypeDao = mechanismtypeDao;
		this.baseDao = mechanismtypeDao;
	}

	@Override
	public List<Mechanismtype> getStateMechanismtypes(Integer pid)
	{
		//��ѯ���б�ǩ����
		List<Mechanismtype> list = mechanismtypeDao.list();
		
		Mechanism mechanism = mechanismDao.getObj(pid);
		
		Set<Mechanismtype> mechanismtypes = mechanism.getMechanismtypes();
		
		for(Mechanismtype s : list)
		{
			for(Mechanismtype ty : mechanismtypes)
			{
				if(s.getMId().intValue() == ty.getMId().intValue())
				{
					s.setSelect("yes");
				}
			}
		}
		return list;
	}

	@Override
	public void updateMechanismtype(Integer pid, String mechanismtypeIds)
	{
		//����û�
		Mechanism mechanism = mechanismDao.getObj(pid);
		Set<Mechanismtype> mechanismtypes = mechanism.getMechanismtypes();
		//��ԭ�еı�ǩ���
		mechanismtypes.clear();
		if(StringUtils.isNotBlank(mechanismtypeIds))
		{
			String[] ids = mechanismtypeIds.split(",");
			for(String mechanismtypeId : ids)
			{
				//����id���Ҫ����ѧ��
				Mechanismtype mechanismtype = mechanismtypeDao.getObj(new Integer(mechanismtypeId));
				mechanismtypes.add(mechanismtype);
			}
		}				
	}
}
