package servlet;

import imgprocserver.SingletonImgProcessor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.*;  

import java.util.*;  

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.cloopen.rest.sdk.utils.encoder.BASE64Decoder;

import dao.UExpItemDAO;
import entity.UExpItemEnt;

public class ESketchRetrieveServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 9127060882751608991L;
	private static Logger logger = Logger.getLogger(InitLogServlet.class);
	/*全局变量 传给后台*/
	Map<String,String> params ; 

	/**
	 * Constructor of the object.
	 */
	public ESketchRetrieveServlet() {
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
	/*传输返回数据*/	
	PrintWriter out = response.getWriter(); 
     /*获取身份，创建文档路径*/
		HttpSession session=request.getSession();
    	String userPone=(String) session.getAttribute("UserPN");
    	 //保存路径  
       /*获取前端信息*/
       System.out.println("获取图片流");
       String dataString = request.getParameter("imgFileContent");
       String fileNameString = request.getParameter("imgFileName");
       byte[] bytes = null ;
       BASE64Decoder decoder = new BASE64Decoder();
       try {
           // Base64解码
    	   bytes  = decoder.decodeBuffer(dataString.split("base64,")[1]);
           for (int i = 0; i < bytes.length; ++i) {
               if (bytes[i] < 0) {// 调整异常数据
                   bytes[i] += 256;
               }
           }
           logger.info("Decode base64 success");
       } catch (Exception e) {
    	   logger.error(e.toString());
       }

          
     
       /*实验参数传递  params */
       //对吗？
       params = new HashMap<String, String>();

       params.put("method", "retreive");
       
       /*将数据保存到uexpitemtable数据库*/
       /*创建实体*/
       //////////////////
       UExpItemEnt uitem= new UExpItemEnt();
       uitem.setuPoneNum(userPone);
       uitem.seteName("SketchRetrieve");
       uitem.seteParams(params.toString());
       ///////////////////
       //一定要在此项之后设置
       params.put("file_name", fileNameString);
       UExpItemDAO uitemdao =new UExpItemDAO();

 /***************需要修改******************************/  
          System.out.println(params.toString());
          Map<String,String> re ;
          logger.info("call sketch retrieval param :\t" + params);
          re = SingletonImgProcessor.sketch_process(bytes, params);
          logger.info("sketch retrieval retrun :\t" + re);
          System.out.println(re.toString());
          
           //存储的数据不同
          String srcImgUser=re.get("src_image");
          
         uitem.seteRessType("images");
         uitem.seteSrcs(srcImgUser);
         uitem.seteRess(re.get("list"));
         System.out.println(uitem.toString());
         if(!"success".equals(re.get("result")))
         {       System.out.println("error");
	        	 out.write("error");
	        	 out.flush(); 
	        	 out.close();
	        	 return;
         }
         System.out.println("实验成功;开始插入数据库");
		  if(uitemdao.addUExpItem(uitem))
		  {
			    System.out.println("true");
			    out.write("true");
				out.flush(); 
				out.close();
				return;
		  } else {
			  System.out.println("false");
				out.write("false");
				out.flush(); 
				out.close();
				return;
		  }
	 
	}
	/*设置默认值params*/
	 public  void setDefaultParams()
	    {
	     /*************需重构用MethodXML放置固定参数*******************/

	    
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
