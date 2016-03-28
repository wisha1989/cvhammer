package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import dao.LoginUserDAO;
import entity.LoginUserEnt;

public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 6010811572751059193L;
	private static Logger logger = Logger.getLogger(InitLogServlet.class);
	/**
	 * Constructor of the object.
	 */
	public RegisterServlet() {
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

		String PonNum_str=request.getParameter("PoneNum");
		String Verify_str=request.getParameter("Verify");
        String Password_str=request.getParameter("Password");
        
        HttpSession session=request.getSession();
        String PoneNum_sesstr=(String) session.getAttribute("UserPNRegister");	
		String VerifyNum_sesstr=(String) session.getAttribute("VerifyNumRegister");	
		
		PrintWriter out = response.getWriter();
		
		System.out.println("PoneNum"+PonNum_str);
		System.out.println("Verify"+Verify_str);
		System.out.println("Password"+Password_str);
		
		System.out.println("SessionUserPNRegister"+PoneNum_sesstr);
		System.out.println("SessionVerifyNumRegister"+VerifyNum_sesstr);
		/*验证是相等*/
		/*连接数据库*/
		LoginUserDAO uDAO = new LoginUserDAO();
		LoginUserEnt u = new LoginUserEnt(PonNum_str,Password_str);
		
		try {
			if(PoneNum_sesstr.equals(PonNum_str)&&VerifyNum_sesstr.equals(Verify_str)&& uDAO.addUser(u)){
				 
				 session.setAttribute("ISLOGIN", "true");
				 session.setAttribute("UserPN", PoneNum_sesstr);	
				 out.write("true"); 
				 logger.info("login success");
			}else
			{
				logger.info("phone num or verify code is wrong");
				out.write("flase"); 
				 
			}
		} catch (ClassNotFoundException e) {
			logger.error(e.toString());
		}
		out.flush(); 
		out.close(); 
        
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
