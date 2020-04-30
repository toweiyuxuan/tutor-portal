package cn.wyx.model;

import java.util.Set;

/**
 * Parent entity. @author MyEclipse Persistence Tools
 */

public class Parent implements java.io.Serializable
{

	// Fields

	private Integer UId;
	private String PName;
	private Integer PArea;
	private String PAddress;
	private Integer PMoney;
	private Integer PGender;
	private Integer PGrade;
	private Integer PCharacter;
	private Integer PLimitgender;
	private String POther;

	//一对一
	private Users user;
	
	//多对多
	private Set<Teachertype> teachertypes;
	private Set<Subjecttype> subjecttypes;
	
	
	// Constructors

	/** default constructor */
	public Parent()
	{
	}

	/** minimal constructor */
	public Parent(Integer UId)
	{
		this.UId = UId;
	}

	/** full constructor */
	public Parent(Integer UId, String PName, Integer PArea, String PAddress,
			Integer PMoney, Integer PGender, Integer PGrade,
			Integer PCharacter, Integer PLimitgender, String POther)
	{
		this.UId = UId;
		this.PName = PName;
		this.PArea = PArea;
		this.PAddress = PAddress;
		this.PMoney = PMoney;
		this.PGender = PGender;
		this.PGrade = PGrade;
		this.PCharacter = PCharacter;
		this.PLimitgender = PLimitgender;
		this.POther = POther;
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

	public String getPName()
	{
		return this.PName;
	}

	public void setPName(String PName)
	{
		this.PName = PName;
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

	public Users getUser()
	{
		return user;
	}

	public void setUser(Users user)
	{
		this.user = user;
	}

	public Set<Teachertype> getTeachertypes()
	{
		return teachertypes;
	}

	public void setTeachertypes(Set<Teachertype> teachertypes)
	{
		this.teachertypes = teachertypes;
	}

	public Set<Subjecttype> getSubjecttypes()
	{
		return subjecttypes;
	}

	public void setSubjecttypes(Set<Subjecttype> subjecttypes)
	{
		this.subjecttypes = subjecttypes;
	}

}