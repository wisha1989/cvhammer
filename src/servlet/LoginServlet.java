package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.LoginUserDAO;
import entity.LoginUserEnt;

public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3091463350951773552L;


	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
		super();
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException { 
			doPost(request,response); 
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

        /*获取POST信息*/	
		LoginUserEnt u =new LoginUserEnt();
		u.setuPoneNum(request.getParameter("PoneNum"));
	    u.setuPassword(request.getParameter("Password"));
        /*打开数据库连接*/
		
		LoginUserDAO uDAO = new LoginUserDAO();
		
		PrintWriter out = response.getWriter(); 
		try {
			if(uDAO.isUser(u))
			{    /*用户存在，*/
				 HttpSession session=request.getSession();
				 session.setAttribute("ISLOGIN", "true");
				 session.setAttribute("UserPN", u.getuPoneNum());			 
				 out.write("true"); 
				 System.out.println("Com into LoginServlet1-2");
				 out.flush(); 
				 out.close(); 
			}else{
					 out.write("false"); 
					 System.out.println("Com into LoginServlet1-3");
					 out.flush(); 
					 out.close(); 
				}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
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
