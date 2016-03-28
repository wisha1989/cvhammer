package servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.PropertyConfigurator;

public class InitLogServlet implements Servlet{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ServletConfig getServletConfig() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getServletInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		 
		System.out.println("InitLogServlet ���ڳ�ʼ�� log4j��־������Ϣ");  
        String log4jLocation = config.getInitParameter("log4j-properties-location");  

        ServletContext sc = config.getServletContext();  

        if (log4jLocation == null) {  
            System.err.println("*** û�� log4j-properties-location ��ʼ�����ļ�, ����ʹ�� BasicConfigurator��ʼ��");  
            BasicConfigurator.configure();  
        } else {  
            String webAppPath = sc.getRealPath("/");  
            String log4jProp = webAppPath + log4jLocation;  
            File yoMamaYesThisSaysYoMama = new File(log4jProp);  
            if (yoMamaYesThisSaysYoMama.exists()) {  
                System.out.println("ʹ��: " + log4jProp+"��ʼ����־������Ϣ");  
                PropertyConfigurator.configure(log4jProp);  
            } else {  
                System.err.println("*** " + log4jProp + " �ļ�û���ҵ��� ����ʹ�� BasicConfigurator��ʼ��");  
                BasicConfigurator.configure();  
            }  
        }  
      
   
	}

	@Override
	public void service(ServletRequest req, ServletResponse res)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
