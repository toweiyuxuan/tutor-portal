package cn.wyx.controller;

import java.io.IOException;

import cn.wyx.model.Mechanism;
import cn.wyx.model.Parent;
import cn.wyx.query.MechanismtypeQuery;
import cn.wyx.service.MechanismtypeService;
import cn.wyx.utils.Page;

import com.opensymphony.xwork2.ActionContext;

public class MechanismtypeAction extends BaseAction 
{	
	private MechanismtypeService mechanismtypeService;
	
	//���Զ���,���ڽ���ҳ�洫������ֵ
	private String mechanismtypeIds;
	
	//����
	private Mechanism mechanism;
	
	/*
	 * ѧ����Ϣ����
	 */
	public void ajax_my_setMechanismtypes() throws IOException
	{
		mechanismtypeService.updateMechanismtype(mechanism.getUId(), mechanismtypeIds);
		response.getWriter().write("success");
	}
	
	
	
	//============================================setter and getter=====================================================
	
	public MechanismtypeService getMechanismtypeService() 
	{
		return mechanismtypeService;
	}
	public void setMechanismtypeService(MechanismtypeService mechanismtypeService) 
	{
		this.mechanismtypeService = mechanismtypeService;
	}
	public String getMechanismtypeIds()
	{
		return mechanismtypeIds;
	}
	public void setMechanismtypeIds(String mechanismtypeIds)
	{
		this.mechanismtypeIds = mechanismtypeIds;
	}
	public Mechanism getMechanism()
	{
		return mechanism;
	}
	public void setMechanism(Mechanism mechanism)
	{
		this.mechanism = mechanism;
	}
	
}
