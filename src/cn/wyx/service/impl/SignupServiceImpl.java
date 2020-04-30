package cn.wyx.service.impl;

import cn.wyx.dao.SignupDao;
import cn.wyx.model.Signup;
import cn.wyx.query.SignupQuery;
import cn.wyx.service.SignupService;

public class SignupServiceImpl extends BaseServiceImpl<Signup, SignupQuery> implements SignupService 
{	
	private SignupDao signupDao;
	
	public void setSignupDao(SignupDao signupDao) 
	{
		this.signupDao = signupDao;
		this.baseDao = signupDao;
	}
}
