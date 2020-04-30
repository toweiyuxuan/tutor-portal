package cn.wyx.model;

/**
 * Pphoto entity. @author MyEclipse Persistence Tools
 */

public class Pphoto implements java.io.Serializable
{

	// Fields

	private Integer UId;
	private String ppZaddress;
	private String ppFaddress;
	private String ppSaddress;

	//“ª∂‘“ª
	private Users user;
	
	// Constructors

	/** default constructor */
	public Pphoto()
	{
	}

	/** minimal constructor */
	public Pphoto(Integer UId)
	{
		this.UId = UId;
	}

	/** full constructor */
	public Pphoto(Integer UId, String ppZaddress, String ppFaddress,
			String ppSaddress)
	{
		this.UId = UId;
		this.ppZaddress = ppZaddress;
		this.ppFaddress = ppFaddress;
		this.ppSaddress = ppSaddress;
	}

	// Property accessors

	public Integer getUId()
	{
		return this.UId;
	}

	public void setUId(Integer UId)
	{
		this.UId = UId;
	}

	public String getPpZaddress()
	{
		return this.ppZaddress;
	}

	public void setPpZaddress(String ppZaddress)
	{
		this.ppZaddress = ppZaddress;
	}

	public String getPpFaddress()
	{
		return this.ppFaddress;
	}

	public void setPpFaddress(String ppFaddress)
	{
		this.ppFaddress = ppFaddress;
	}

	public String getPpSaddress()
	{
		return this.ppSaddress;
	}

	public void setPpSaddress(String ppSaddress)
	{
		this.ppSaddress = ppSaddress;
	}

	public Users getUser()
	{
		return user;
	}

	public void setUser(Users user)
	{
		this.user = user;
	}

}