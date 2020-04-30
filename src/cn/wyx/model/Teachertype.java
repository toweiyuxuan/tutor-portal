package cn.wyx.model;

import java.util.Set;

/**
 * Teachertype entity. @author MyEclipse Persistence Tools
 */

public class Teachertype implements java.io.Serializable
{

	// Fields

	private Integer ttId;
	private String ttName;
	
	private String select;
	
	//一对多
	private Set<Teacher> teachers;
	
	//多对多
	private Set<Parent> parents;

	// Constructors

	/** default constructor */
	public Teachertype()
	{
	}

	/** full constructor */
	public Teachertype(String ttName)
	{
		this.ttName = ttName;
	}

	// Property accessors

	public Integer getTtId()
	{
		return this.ttId;
	}

	public void setTtId(Integer ttId)
	{
		this.ttId = ttId;
	}

	public String getTtName()
	{
		return this.ttName;
	}

	public void setTtName(String ttName)
	{
		this.ttName = ttName;
	}

	public String getSelect()
	{
		return select;
	}

	public void setSelect(String select)
	{
		this.select = select;
	}

	public Set<Teacher> getTeachers()
	{
		return teachers;
	}

	public void setTeachers(Set<Teacher> teachers)
	{
		this.teachers = teachers;
	}

	public Set<Parent> getParents()
	{
		return parents;
	}

	public void setParents(Set<Parent> parents)
	{
		this.parents = parents;
	}
	
	@Override
	public String toString()
	{
		return ttName;
	}
}