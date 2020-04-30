package cn.wyx.model;

import java.util.Date;
import java.util.Set;

/**
 * Prelease entity. @author MyEclipse Persistence Tools
 */

public class Prelease implements java.io.Serializable
{

	// Fields

	private Integer RId;
	private Date RTime;
	private Integer UId;
	private String PTel;
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
	private Integer siCount;
	private String PName;

	// Constructors

	/** default constructor */
	public Prelease()
	{
	}

	/** full constructor */
	public Prelease(Date RTime, Integer UId, String PTel, Integer PArea, String PName,
			String PAddress, Integer PMoney, Integer PGender, Integer PGrade,
			Integer PCharacter, Integer PLimitgender, String POther,
			String PSubjecttype, String PLimitteachertype, Integer siCount)
	{
		this.RTime = RTime;
		this.UId = UId;
		this.PTel = PTel;
		this.PName = PName;
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
		this.siCount = siCount;
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

	public String getPTel()
	{
		return this.PTel;
	}

	public void setPTel(String PTel)
	{
		this.PTel = PTel;
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

	public Integer getSiCount()
	{
		return this.siCount;
	}

	public void setSiCount(Integer siCount)
	{
		this.siCount = siCount;
	}

	public String getPName()
	{
		return PName;
	}

	public void setPName(String pName)
	{
		PName = pName;
	}

}