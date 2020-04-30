package cn.wyx.model;

/**
 * Tphoto entity. @author MyEclipse Persistence Tools
 */

public class Tphoto implements java.io.Serializable
{

	// Fields

	private Integer tpId;
	private Integer UId;
	private String tpAddress;
	private String UTel;

	// Constructors

	/** default constructor */
	public Tphoto()
	{
	}

	/** full constructor */
	public Tphoto(Integer UId, String tpAddress, String UTel)
	{
		this.UId = UId;
		this.tpAddress = tpAddress;
		this.UTel = UTel;
	}

	// Property accessors

	public Integer getTpId()
	{
		return this.tpId;
	}

	public void setTpId(Integer tpId)
	{
		this.tpId = tpId;
	}

	public Integer getUId()
	{
		return this.UId;
	}

	public void setUId(Integer UId)
	{
		this.UId = UId;
	}

	public String getTpAddress()
	{
		return this.tpAddress;
	}

	public void setTpAddress(String tpAddress)
	{
		this.tpAddress = tpAddress;
	}

	public String getUTel()
	{
		return UTel;
	}

	public void setUTel(String uTel)
	{
		UTel = uTel;
	}

}