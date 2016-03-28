package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {
	ServletContext context;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
		FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest req =(HttpServletRequest)arg0;
		HttpServletResponse resp =(HttpServletResponse)arg1;
       HttpSession session = req.getSession();
       

       String referHerf=req.getHeader("Referer");
    		 
      
       if(!(session.getAttribute("ISLOGIN")=="true"))
       { 
    	   if(referHerf==null)
		   {
    		   referHerf="http://www.cvhammer.cn:88/";
			  
		   }
			   resp.sendRedirect(referHerf+"#Login");
       }else{
			arg2.doFilter(arg0, arg1);
			return;
       }       
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		 context  = arg0.getServletContext();

		 System.out.println("-------------------------------------------Æô¶¯");
	}

}
