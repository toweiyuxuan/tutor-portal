package cn.wyx.model;

import java.util.Set;

/**
 * Mechanism entity. @author MyEclipse Persistence Tools
 */

public class Mechanism implements java.io.Serializable
{

	// Fields

	private Integer UId;
	private Integer MArea;
	private String MName;
	private String MAddress;
	private String MIntroduce;
	private String MContact;
	private String MTedian;
	private String MHomepage;
	
	//一对一
	private Users user;
	
	//多对多
	private Set<Mechanismtype> mechanismtypes;

	// Constructors

	/** default constructor */
	public Mechanism()
	{
	}

	/** minimal constructor */
	public Mechanism(Integer UId)
	{
		this.UId = UId;
	}

	/** full constructor */
	public Mechanism(Integer UId, Integer MArea, String MName, String MAddress,
			String MIntroduce, String MContact, String MTedian, String MHomepage)
	{
		this.UId = UId;
		this.MArea = MArea;
		this.MName = MName;
		this.MAddress = MAddress;
		this.MIntroduce = MIntroduce;
		this.MContact = MContact;
		this.MTedian = MTedian;
		this.MHomepage = MHomepage;
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

	public Integer getMArea()
	{
		return this.MArea;
	}

	public void setMArea(Integer MArea)
	{
		this.MArea = MArea;
	}

	public String getMName()
	{
		return this.MName;
	}

	public void setMName(String MName)
	{
		this.MName = MName;
	}

	public String getMAddress()
	{
		return this.MAddress;
	}

	public void setMAddress(String MAddress)
	{
		this.MAddress = MAddress;
	}

	public String getMIntroduce()
	{
		return this.MIntroduce;
	}

	public void setMIntroduce(String MIntroduce)
	{
		this.MIntroduce = MIntroduce;
	}

	public String getMContact()
	{
		return this.MContact;
	}

	public void setMContact(String MContact)
	{
		this.MContact = MContact;
	}
	
	public String getMTedian()
	{
		return this.MTedian;
	}

	public void setMTedian(String MTedian)
	{
		this.MTedian = MTedian;
	}

	public Users getUser()
	{
		return user;
	}

	public void setUser(Users user)
	{
		this.user = user;
	}

	public Set<Mechanismtype> getMechanismtypes()
	{
		return mechanismtypes;
	}

	public void setMechanismtypes(Set<Mechanismtype> mechanismtypes)
	{
		this.mechanismtypes = mechanismtypes;
	}

	public String getMHomepage()
	{
		return MHomepage;
	}

	public void setMHomepage(String mHomepage)
	{
		MHomepage = mHomepage;
	}
	
}