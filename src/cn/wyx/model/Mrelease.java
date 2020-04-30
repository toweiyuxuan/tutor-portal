package cn.wyx.model;

import java.util.Date;

/**
 * Mrelease entity. @author MyEclipse Persistence Tools
 */

public class Mrelease implements java.io.Serializable
{

	// Fields

	private Integer RId;
	private Date RTime;
	private Integer UId;
	private String MName;
	private String MTel;
	private Integer MArea;
	private String MAddress;
	private String MIntroduce;
	private String MContact;
	private String MMechanismtype;
	private String MTedian;
	private String MTeachertype;
	private Integer MLimitgender;

	// Constructors

	/** default constructor */
	public Mrelease()
	{
	}

	/** full constructor */
	public Mrelease(Date RTime, Integer UId, String MName, String MTel, Integer MArea,
			String MAddress, String MIntroduce, String MContact, String MMechanismtype,
			String MTedian, String MTeachertype, Integer MLimitgender)
	{
		this.RTime = RTime;
		this.UId = UId;
		this.MName = MName;
		this.MTel = MTel;
		this.MArea = MArea;
		this.MAddress = MAddress;
		this.MIntroduce = MIntroduce;
		this.MContact = MContact;
		this.MMechanismtype = MMechanismtype;
		this.MTedian = MTedian;
		this.MTeachertype = MTeachertype;
		this.MLimitgender = MLimitgender;
	}

	// Property accessors

	public Integer getRId()
	{
		return this.RId;
	}

	public void setRId(Integer RId)
	{
		this.RId = RId;
	}

	public Date getRTime()
	{
		return this.RTime;
	}

	public void setRTime(Date RTime)
	{
		this.RTime = RTime;
	}

	public Integer getUId()
	{
		return this.UId;
	}

	public void setUId(Integer UId)
	{
		this.UId = UId;
	}

	public String getMName()
	{
		return this.MName;
	}

	public void setMName(String MName)
	{
		this.MName = MName;
	}

	public Integer getMArea()
	{
		return this.MArea;
	}

	public void setMArea(Integer MArea)
	{
		this.MArea = MArea;
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

	public String getMMechanismtype()
	{
		return this.MMechanismtype;
	}

	public void setMMechanismtype(String MMechanismtype)
	{
		this.MMechanismtype = MMechanismtype;
	}

	public String getMTedian()
	{
		return this.MTedian;
	}

	public void setMTedian(String MTedian)
	{
		this.MTedian = MTedian;
	}

	public String getMTeachertype()
	{
		return this.MTeachertype;
	}

	public void setMTeachertype(String MTeachertype)
	{
		this.MTeachertype = MTeachertype;
	}

	public Integer getMLimitgender()
	{
		return this.MLimitgender;
	}

	public void setMLimitgender(Integer MLimitgender)
	{
		this.MLimitgender = MLimitgender;
	}

	public String getMTel()
	{
		return MTel;
	}

	public void setMTel(String mTel)
	{
		MTel = mTel;
	}

}