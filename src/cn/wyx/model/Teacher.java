package cn.wyx.model;

import java.util.Set;

/**
 * Teacher entity. @author MyEclipse Persistence Tools
 */

public class Teacher implements java.io.Serializable
{

	// Fields

	private Integer UId;
	private Integer ttId;
	private String TName;
	private String TAge;
	private Integer TGender;
	private String TSchool;
	private String TMajor;
	private String TAddress;
	private String TWechat;
	private String TIntroduce;
	private String TExperience;

	//一对一
	private Users user;
	
	//多对一
	private Teachertype teachertype;

	// Constructors

	/** default constructor */
	public Teacher()
	{
	}

	/** minimal constructor */
	public Teacher(Integer UId)
	{
		this.UId = UId;
	}

	/** full constructor */
	public Teacher(Integer UId, Integer ttId, String TName, String TAge,
			Integer TGender, String TSchool, String TMajor, String TAddress,
			String TWechat, String TIntroduce, String TExperience)
	{
		this.UId = UId;
		this.ttId = ttId;
		this.TName = TName;
		this.TAge = TAge;
		this.TGender = TGender;
		this.TSchool = TSchool;
		this.TMajor = TMajor;
		this.TAddress = TAddress;
		this.TWechat = TWechat;
		this.TIntroduce = TIntroduce;
		this.TExperience = TExperience;
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

	public Integer getTtId()
	{
		return this.ttId;
	}

	public void setTtId(Integer ttId)
	{
		this.ttId = ttId;
	}

	public String getTName()
	{
		return this.TName;
	}

	public void setTName(String TName)
	{
		this.TName = TName;
	}

	public String getTAge()
	{
		return this.TAge;
	}

	public void setTAge(String TAge)
	{
		this.TAge = TAge;
	}

	public Integer getTGender()
	{
		return this.TGender;
	}

	public void setTGender(Integer TGender)
	{
		this.TGender = TGender;
	}

	public String getTSchool()
	{
		return this.TSchool;
	}

	public void setTSchool(String TSchool)
	{
		this.TSchool = TSchool;
	}

	public String getTMajor()
	{
		return this.TMajor;
	}

	public void setTMajor(String TMajor)
	{
		this.TMajor = TMajor;
	}

	public String getTAddress()
	{
		return this.TAddress;
	}

	public void setTAddress(String TAddress)
	{
		this.TAddress = TAddress;
	}

	public String getTWechat()
	{
		return this.TWechat;
	}

	public void setTWechat(String TWechat)
	{
		this.TWechat = TWechat;
	}

	public String getTIntroduce()
	{
		return this.TIntroduce;
	}

	public void setTIntroduce(String TIntroduce)
	{
		this.TIntroduce = TIntroduce;
	}

	public String getTExperience()
	{
		return this.TExperience;
	}

	public void setTExperience(String TExperience)
	{
		this.TExperience = TExperience;
	}

	public Users getUser()
	{
		return user;
	}

	public void setUser(Users user)
	{
		this.user = user;
	}

	public Teachertype getTeachertype()
	{
		return teachertype;
	}

	public void setTeachertype(Teachertype teachertype)
	{
		this.teachertype = teachertype;
	}

}