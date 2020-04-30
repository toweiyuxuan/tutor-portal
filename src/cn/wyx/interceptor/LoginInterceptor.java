package cn.wyx.interceptor;
import java.util.Map;

import cn.wyx.controller.BaseAction;
import cn.wyx.model.Users;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class LoginInterceptor extends MethodFilterInterceptor
{
	@Override
	protected String doIntercept(ActionInvocation ai) throws Exception
	{
		String result = null;
		// ���Action������
		ActionContext context = ai.getInvocationContext();
		// ���session
		Map<String, Object> session = context.getSession();
		
		// ���session�е��û�
		Users user = (Users) session.get("user");
		
		if (user != null)
		{
			// ������������������
			result = ai.invoke();
		} 
		else
		{
			result = BaseAction.NONE;
		}
		return result;
	}
}
