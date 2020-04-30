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
		// 获得Action的容器
		ActionContext context = ai.getInvocationContext();
		// 获得session
		Map<String, Object> session = context.getSession();
		
		// 获得session中的用户
		Users user = (Users) session.get("user");
		
		if (user != null)
		{
			// 让拦截器继续向下走
			result = ai.invoke();
		} 
		else
		{
			result = BaseAction.NONE;
		}
		return result;
	}
}
