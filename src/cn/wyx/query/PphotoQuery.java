package cn.wyx.query;

import cn.wyx.model.Pphoto;

public class PphotoQuery extends Pphoto
{
	
	private Integer pageNo;	
	private Integer startNum;
		

	
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
	
}
