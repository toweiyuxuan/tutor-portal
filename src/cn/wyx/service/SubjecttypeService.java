package cn.wyx.service;

import java.util.List;

import cn.wyx.model.Subjecttype;
import cn.wyx.model.Teachertype;
import cn.wyx.query.SubjecttypeQuery;

public interface SubjecttypeService extends BaseService<Subjecttype, SubjecttypeQuery> 
{
	public List<Subjecttype> getStateSubjecttypes(Integer pid);
	public void updateSubjecttype(Integer pid, String subjecttypeIds);
}
