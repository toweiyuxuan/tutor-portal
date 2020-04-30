package cn.wyx.model;

import java.util.Date;

/**
 * Signup entity. @author MyEclipse Persistence Tools
 */

public class Signup implements java.io.Serializable
{

	// Fields

	private Integer siId;
	private Integer TId;
	private String TTel;
	private String PTel;
	private Date siTime;
	private Integer RId;
	private Integer UId;
	private Date RTime;
	private Integer PArea;
	private String PAddress;
	private Integer PMoney;
	private Integer PGender;
	private Integer PGrade;
	private Integer PCharacter;
	private Integer PLimitgender;
	private String POther;
	private String PSubjecttype;
	private String PLimitteachertype;
	private String PName;

	// Constructors

	/** default constructor */
	public Signup()
	{
	}

	/** full constructor */
	public Signup(Integer TId, String TTel, String PTel, Date siTime,
			Integer RId, Integer UId, Date RTime, Integer PArea,
			String PAddress, Integer PMoney, Integer PGender, Integer PGrade,
			Integer PCharacter, Integer PLimitgender, String POther,
			String PSubjecttype, String PLimitteachertype, String PName)
	{
		this.TId = TId;
		this.TTel = TTel;
		this.PTel = PTel;
		this.siTime = siTime;
		this.RId = RId;
		this.UId = UId;
		this.RTime = RTime;
		this.PArea = PArea;
		this.PAddress = PAddress;
		this.PMoney = PMoney;
		this.PGender = PGender;
		this.PGrade = PGrade;
		this.PCharacter = PCharacter;
		this.PLimitgender = PLimitgender;
		this.POther = POther;
		this.PSubjecttype = PSubjecttype;
		this.PLimitteachertype = PLimitteachertype;
		this.PName = PName;
	}

	// Property accessors

	public Integer getSiId()
	{
		return this.siId;
	}

	public void setSiId(Integer siId)
	{
		this.siId = siId;
	}

	public Integer getTId()
	{
		return this.TId;
	}

	public void setTId(Integer TId)
	{
		this.TId = TId;
	}

	public String getTTel()
	{
		return this.TTel;
	}

	public void setTTel(String TTel)
	{
		this.TTel = TTel;
	}

	public String getPTel()
	{
		return this.PTel;
	}

	public void setPTel(String PTel)
	{
		this.PTel = PTel;
	}

	public Date getSiTime()
	{
		return this.siTime;
	}

	public void setSiTime(Date siTime)
	{
		this.siTime = siTime;
	}

	public Integer getRId()
	{
		return this.RId;
	}

	public void setRId(Integer RId)
	{
		this.RId = RId;
	}

	public Integer getUId()
	{
		return this.UId;
	}

	public void setUId(Integer UId)
	{
		this.UId = UId;
	}

	public Date getRTime()
	{
		return this.RTime;
	}

	public void setRTime(Date RTime)
	{
		this.RTime = RTime;
	}

	public Integer getPArea()
	{
		return this.PArea;
	}

	public void setPArea(Integer PArea)
	{
		this.PArea = PArea;
	}

	public String getPAddress()
	{
		return this.PAddress;
	}

	public void setPAddress(String PAddress)
	{
		this.PAddress = PAddress;
	}

	public Integer getPMoney()
	{
		return this.PMoney;
	}

	public void setPMoney(Integer PMoney)
	{
		this.PMoney = PMoney;
	}

	public Integer getPGender()
	{
		return this.PGender;
	}

	public void setPGender(Integer PGender)
	{
		this.PGender = PGender;
	}

	public Integer getPGrade()
	{
		return this.PGrade;
	}

	public void setPGrade(Integer PGrade)
	{
		this.PGrade = PGrade;
	}

	public Integer getPCharacter()
	{
		return this.PCharacter;
	}

	public void setPCharacter(Integer PCharacter)
	{
		this.PCharacter = PCharacter;
	}

	public Integer getPLimitgender()
	{
		return this.PLimitgender;
	}

	public void setPLimitgender(Integer PLimitgender)
	{
		this.PLimitgender = PLimitgender;
	}

	public String getPOther()
	{
		return this.POther;
	}

	public void setPOther(String POther)
	{
		this.POther = POther;
	}

	public String getPSubjecttype()
	{
		return this.PSubjecttype;
	}

	public void setPSubjecttype(String PSubjecttype)
	{
		this.PSubjecttype = PSubjecttype;
	}

	public String getPLimitteachertype()
	{
		return this.PLimitteachertype;
	}

	public void setPLimitteachertype(String PLimitteachertype)
	{
		this.PLimitteachertype = PLimitteachertype;
	}

	public String getPName()
	{
		return this.PName;
	}

	public void setPName(String PName)
	{
		this.PName = PName;
	}

}