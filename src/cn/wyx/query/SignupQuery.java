package cn.wyx.query;

import cn.wyx.model.Signup;

public class SignupQuery extends Signup
{
	
	private Integer pageNo;	
	private Integer startNum;
		
	private String whereQuery;
	
	//============================================setter和getter方法=====================================================	
	public Integer getPageNo() 
	{
		return pageNo;
	}
	public void setPageNo(Integer pageNo) 
	{
		this.pageNo = pageNo;
	}
	public Integer getStartNum() 
	{
		return startNum;
	}
	public void setStartNum(Integer startNum) 
	{
		this.startNum = startNum;
	}
	public String getWhereQuery()
	{
		return whereQuery;
	}
	public void setWhereQuery(String whereQuery)
	{
		this.whereQuery = whereQuery;
	}
	
}
