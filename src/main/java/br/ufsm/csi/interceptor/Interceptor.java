package br.ufsm.csi.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			  HttpServletResponse response, Object controller) throws Exception {
		
		String uri = request.getRequestURI();
	    if(uri.endsWith("login") || uri.endsWith("authenticate") || uri.endsWith("recoverPassword") 
	    		|| uri.contains("createAccount") || uri.contains("resources") || uri.contains("validateAccount")
	    		|| uri.contains("remandMail") || uri.contains("editAccount") || uri.contains("removeAccount")){
	        return true;
	    }

	    if(request.getSession().getAttribute("usuarioLogado") != null) {
	        return true;
	    }
	      
	    response.sendRedirect("login");
	    return false;
	}

}
