package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Random;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.cloopen.rest.sdk.CCPRestSmsSDK;

import dao.LoginUserDAO;

public class VerifyServlet extends HttpServlet {
   /**
	 * 
	 */
	private static final long serialVersionUID = 5044444037799558319L;
	private static Logger logger = Logger.getLogger(InitLogServlet.class);
	/*ȫ����*/
	CCPRestSmsSDK restAPI ;
	/**
	 * Constructor of the object.
	 */
	public VerifyServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*��ȡ�绰*/
		String PonNum_str=request.getParameter("PoneNum");
		PrintWriter out = response.getWriter(); 
		LoginUserDAO uDAO = new LoginUserDAO();
		try {
			if(uDAO.isExitUser(PonNum_str))
			{
				logger.info(PonNum_str + " is already regist");
				out.write("UserExit");
				out.flush();
				out.close();
				return;
			}
		} catch (ClassNotFoundException e) {
			logger.error(e.toString());
			out.write("Error");
			out.flush();
			out.close();
			return;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			logger.error(e.toString());
			out.write("Error");
			out.flush();
			out.close();
			return;
		}
		System.out.println(PonNum_str);
		Random ne=new Random();//ʵ����һ��random�Ķ���ne
        int x=ne.nextInt(9999-1000+1)+1000;//Ϊ���������ֵ1000-9999 
        
		HashMap<String, Object> result = null;
		//*�������ò���Demo��APP ID������ʹ��Ĭ��ģ��ID 1�������ֻ�����13800000000���������Ϊ6532��5������÷�ʽΪ  
		result = restAPI.sendTemplateSMS(PonNum_str,"16279" ,new String[]{String.valueOf(x),"2"});
		
		HttpSession session=request.getSession();
		System.out.println("SDKTestGetSubAccounts result=" + result);
		if("000000".equals(result.get("statusCode"))){
			//�����������data������Ϣ��map��
	        //����verifyNum �� phoneNum
			session.setAttribute("ISLOGIN", false);
			session.setAttribute("UserPNRegister",PonNum_str );	
			session.setAttribute("VerifyNumRegister",String.valueOf(x) );	
			out.write("true"); 
			@SuppressWarnings("unchecked")
			HashMap<String,Object> data = (HashMap<String, Object>) result.get("data");
			Set<String> keySet = data.keySet();
			for(String key:keySet){
				Object object = data.get(key);
				System.out.println(key +" = "+object);
			}
			logger.info("send verify code : " + x  +" to phone " + PonNum_str);
			 out.flush(); 
			 out.close();
			 return;
		}else{
			logger.error("������=" + result.get("statusCode") +" ������Ϣ= "+result.get("statusMsg"));
			//�쳣�������������ʹ�����Ϣ
			out.write("Error"); 
			 out.flush(); 
			 out.close();
			 return;
		}
		 
	}
	

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		System.out.println("init");
		restAPI = new CCPRestSmsSDK();
		restAPI.init("app.cloopen.com", "8883");
		//*ACOUNT SID��AUTH TOKEN�ڵ�½�������ڡ�Ӧ��-�������̨���в鿴���������˺Ż�ȡ*
		//*����˳�򣺵�һ��������ACOUNT SID���ڶ���������AUTH TOKEN��        
		restAPI.setAccount("aaf98f89488d0aad0148b617a0a41333", "6a921c7e0918440c8b4d19cbe8899405");
		//*��ʼ��Ӧ��ID  		
		restAPI.setAppId("aaf98f89488d0aad0148b61a4d79133d");
		logger.info("init ccpreset sdk");
	}

}
