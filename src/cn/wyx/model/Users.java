package cn.wyx.model;

import java.sql.Timestamp;
import java.util.Set;

/**
 * Users entity. @author MyEclipse Persistence Tools
 */

public class Users implements java.io.Serializable
{

	// Fields

	private Integer UId;
	private Integer USf;
	private String UTel;
	private String UPassword;
	private Integer UStation;
	private Integer UAttestation;
	private Integer UIsfinish;
	private Timestamp UTime;

	//一对一
	private Parent parent;
	private Pphoto pphoto;
	private Teacher teacher;
	private Mechanism mechanism;
	
	//一对多
	private Set<Mphoto> mphoto;
	private Set<Tphoto> tphoto;
	
		
	// Constructors

	/** default constructor */
	public Users()
	{
	}

	/** full constructor */
	public Users(Integer USf, String UTel, String UPassword, Integer UStation,
			Integer UAttestation, Integer UIsfinish, Timestamp UTime)
	{
		this.USf = USf;
		this.UTel = UTel;
		this.UPassword = UPassword;
		this.UStation = UStation;
		this.UAttestation = UAttestation;
		this.UIsfinish = UIsfinish;
		this.UTime = UTime;
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

	public Integer getUSf()
	{
		return this.USf;
	}

	public void setUSf(Integer USf)
	{
		this.USf = USf;
	}

	public String getUTel()
	{
		return this.UTel;
	}

	public void setUTel(String UTel)
	{
		this.UTel = UTel;
	}

	public String getUPassword()
	{
		return this.UPassword;
	}

	public void setUPassword(String UPassword)
	{
		this.UPassword = UPassword;
	}

	public Integer getUStation()
	{
		return this.UStation;
	}

	public void setUStation(Integer UStation)
	{
		this.UStation = UStation;
	}

	public Integer getUAttestation()
	{
		return this.UAttestation;
	}

	public void setUAttestation(Integer UAttestation)
	{
		this.UAttestation = UAttestation;
	}

	public Integer getUIsfinish()
	{
		return this.UIsfinish;
	}

	public void setUIsfinish(Integer UIsfinish)
	{
		this.UIsfinish = UIsfinish;
	}

	public Parent getParent()
	{
		return parent;
	}

	public void setParent(Parent parent)
	{
		this.parent = parent;
	}

	public Pphoto getPphoto()
	{
		return pphoto;
	}

	public void setPphoto(Pphoto pphoto)
	{
		this.pphoto = pphoto;
	}

	public Teacher getTeacher()
	{
		return teacher;
	}

	public void setTeacher(Teacher teacher)
	{
		this.teacher = teacher;
	}

	public Mechanism getMechanism()
	{
		return mechanism;
	}

	public void setMechanism(Mechanism mechanism)
	{
		this.mechanism = mechanism;
	}

	public Set<Mphoto> getMphoto()
	{
		return mphoto;
	}

	public void setMphoto(Set<Mphoto> mphoto)
	{
		this.mphoto = mphoto;
	}

	public Set<Tphoto> getTphoto()
	{
		return tphoto;
	}

	public void setTphoto(Set<Tphoto> tphoto)
	{
		this.tphoto = tphoto;
	}
	public Timestamp getUTime()
	{
		return this.UTime;
	}

	public void setUTime(Timestamp UTime)
	{
		this.UTime = UTime;
	}
}