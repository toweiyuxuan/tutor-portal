package cn.wyx.model;

import java.util.Set;

/**
 * Subjecttype entity. @author MyEclipse Persistence Tools
 */

public class Subjecttype implements java.io.Serializable
{

	// Fields

	private Integer SId;
	private String SName;
	
	private String select;
	
	//¶à¶Ô¶à
	private Set<Parent> parents;

	// Constructors

	/** default constructor */
	public Subjecttype()
	{
	}

	/** full constructor */
	public Subjecttype(String SName)
	{
		this.SName = SName;
	}

	// Property accessors

	public Integer getSId()
	{
		return this.SId;
	}

	public void setSId(Integer SId)
	{
		this.SId = SId;
	}

	public String getSName()
	{
		return this.SName;
	}

	public void setSName(String SName)
	{
		this.SName = SName;
	}

	public Set<Parent> getParents()
	{
		return parents;
	}

	public void setParents(Set<Parent> parents)
	{
		this.parents = parents;
	}

	public String getSelect()
	{
		return select;
	}

	public void setSelect(String select)
	{
		this.select = select;
	}
	
	@Override
	public String toString()
	{
		return SName;
	}
}