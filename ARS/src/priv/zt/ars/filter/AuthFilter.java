package priv.zt.ars.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import priv.zt.ars.domain.Admin;
import priv.zt.ars.domain.Assessor;
import priv.zt.ars.domain.Staff;

public class AuthFilter implements Filter{

	public void destroy() {
		
	}

	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        //获取根目录所对应的绝对路径
        String currentURL = request.getRequestURI();
        //截取到当前文件名用于比较
        String[] targetURL = currentURL.split("/");
        //如果session不为空就返回该session，如果为空就返回null
        HttpSession session = request.getSession(false);
        
        if(targetURL.length == 3){
        	if(!"login.jsp".equals(targetURL[2])){
                //判断当前页面是否是重顶次昂后的登陆页面页面，如果是就不做session的判断，防止死循环
                if(session==null||session.getAttribute("currentUser")==null){
                    response.sendRedirect(request.getContextPath()+"/login.jsp");
                    return;
                }
            }
        	//继续向下执行
            chain.doFilter(request, response);
        }else if(targetURL.length == 4){
        	if(session==null||session.getAttribute("currentUser")==null){
                response.sendRedirect(request.getContextPath()+"/login.jsp");
                return;
            }else{
            	if("pages_staff".equals(targetURL[2])){
            			String name = session.getAttribute("currentUser").getClass().getSimpleName();
                    	if("Staff".equals(name)){
                    		//继续向下执行
                            chain.doFilter(request, response);
                    	}else{
                    		response.sendRedirect(request.getContextPath()+"/login.jsp");
                            return;
                    	}
                }else if("pages_assessor".equals(targetURL[2])){
                    	String name = session.getAttribute("currentUser").getClass().getSimpleName();
                    	if("Assessor".equals(name)){
                    		//继续向下执行
                            chain.doFilter(request, response);
                    	}else{
                    		response.sendRedirect(request.getContextPath()+"/login.jsp");
                            return;
                    	}
                }else if("pages_admin".equals(targetURL[2])){
                		String name = session.getAttribute("currentUser").getClass().getSimpleName();
                    	if("Admin".equals(name)){
                    		//继续向下执行
                            chain.doFilter(request, response);
                    	}else{
                    		response.sendRedirect(request.getContextPath()+"/login.jsp");
                            return;
                    	}
                }else{
                	response.sendRedirect(request.getContextPath()+"/login.jsp");
                    return;
                }
            }
        }else{
        	response.sendRedirect(request.getContextPath()+"/login.jsp");
            return;
        }
        
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
