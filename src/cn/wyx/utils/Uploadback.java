package cn.wyx.utils;

public class Uploadback
{
	
	private Integer success;
	private Integer fail;
	public Integer getSuccess()
	{
		return success;
	}
	public void setSuccess(Integer success)
	{
		this.success = success;
	}
	public Integer getFail()
	{
		return fail;
	}
	public void setFail(Integer fail)
	{
		this.fail = fail;
	}
	
	@Override
	public String toString()
	{
		return "Uploadback [success=" + success + ", fail=" + fail + "]";
	}
}
