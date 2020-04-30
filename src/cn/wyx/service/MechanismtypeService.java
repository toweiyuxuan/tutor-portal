package cn.wyx.service;

import java.util.List;

import cn.wyx.model.Mechanismtype;
import cn.wyx.model.Subjecttype;
import cn.wyx.query.MechanismtypeQuery;

public interface MechanismtypeService extends BaseService<Mechanismtype, MechanismtypeQuery> 
{
	public List<Mechanismtype> getStateMechanismtypes(Integer pid);
	public void updateMechanismtype(Integer pid, String mechanismtypeIds);
}
