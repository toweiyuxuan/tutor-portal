package cn.wyx.service;

import java.util.List;

import cn.wyx.model.Teachertype;
import cn.wyx.query.TeachertypeQuery;

public interface TeachertypeService extends BaseService<Teachertype, TeachertypeQuery> 
{	
	public List<Teachertype> getStateTeachertypes(Integer pid);
	public void updateTeachertype(Integer pid, String teachertypeIds);
}
