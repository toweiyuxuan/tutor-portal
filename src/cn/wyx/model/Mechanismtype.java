package cn.wyx.model;

import java.util.Set;

/**
 * Mechanismtype entity. @author MyEclipse Persistence Tools
 */

public class Mechanismtype implements java.io.Serializable
{

	// Fields

	private Integer MId;
	private String MName;

	private String select;
	
	//¶à¶Ô¶à
	private Set<Mechanism> mechanisms;
	
	// Constructors

	/** default constructor */
	public Mechanismtype()
	{
	}

	/** full constructor */
	public Mechanismtype(String MName)
	{
		this.MName = MName;
	}

	// Property accessors

	public Integer getMId()
	{
		return this.MId;
	}

	public void setMId(Integer MId)
	{
		this.MId = MId;
	}

	public String getMName()
	{
		return this.MName;
	}

	public void setMName(String MName)
	{
		this.MName = MName;
	}

	public String getSelect()
	{
		return select;
	}

	public void setSelect(String select)
	{
		this.select = select;
	}

	public Set<Mechanism> getMechanisms()
	{
		return mechanisms;
	}

	public void setMechanisms(Set<Mechanism> mechanisms)
	{
		this.mechanisms = mechanisms;
	}

	@Override
	public String toString()
	{
		return MName;
	}

}