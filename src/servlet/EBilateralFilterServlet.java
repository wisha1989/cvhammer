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

public class EBilateralFilterServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1200324902145009881L;
	private static Logger logger = Logger.getLogger(InitLogServlet.class);
	/* ȫ�ֱ��� ������̨ */
	Map<String, String> params;

	/**
	 * Constructor of the object.
	 */
	public EBilateralFilterServlet() {
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
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/* ���䷵������ */
		PrintWriter out = response.getWriter();
		/* ��ȡ��ݣ������ĵ�·�� */
		HttpSession session = request.getSession();
		String userPone = (String) session.getAttribute("UserPN");

		String dataString = request.getParameter("imgFile");

		byte[] bytes = null;
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			// Base64����
			bytes = decoder.decodeBuffer(dataString.split("base64,")[1]);
			for (int i = 0; i < bytes.length; ++i) {
				if (bytes[i] < 0) {// �����쳣����
					bytes[i] += 256;
				}
			}
			logger.info("Decode base64 success");
		} catch (Exception e) {
			logger.error(e.toString());
		}
	
		 

		/* ʵ��������� params */
		// ����
		params = new HashMap<String, String>();
		setDefaultParams();
		// --��ʵ��̨����Ҫ��֤
		params.put("threshold1", request.getParameter("threshold1"));
		params.put("file_name", request.getParameter("imgFileName"));
		// System.out.println(params.toString());

		/* �����ݱ��浽uexpitemtable���ݿ� */
		/* ����ʵ�� */
		UExpItemEnt uitem = new UExpItemEnt();
		uitem.setuPoneNum(userPone);
		uitem.seteName("bilateralFilter");
		uitem.seteParams(params.toString());
		uitem.seteRessType("image");
		// һ��Ҫ�ڴ���֮������
		params.put("method", "bilateralFilter_proc");
		params.put("background", "NoColor");
		System.out.println(params.toString());
		UExpItemDAO uitemdao = new UExpItemDAO();
		/*************** ��Ҫ�޸� ******************************/
		Map<String, String> re;
		logger.info("call bilateralFilter param :\t" + params);
		re = SingletonImgProcessor.process(bytes, params);
		logger.info("bilateralFilter return :\t" + re);
		System.out.println(re.toString());
		String desImgUser = re.get("result_path");
		String srcImgUser = re.get("src_path");
		params.remove("threshold2");
		params.remove("size");
		params.remove("gradient");
		uitem.seteSrcs(srcImgUser);
		uitem.seteRess(desImgUser);
		uitem.seteParams(params.toString());
		/********** д�����ݿ� ****************/
		System.out.println(uitem.toString());
		if (!"success".equals(re.get("result"))) {
			System.out.println("error");
			out.write("error");
			out.flush();
			out.close();
			return;
		}
		System.out.println("ʵ��ɹ�;��ʼ�������ݿ�");
		if (uitemdao.addUExpItem(uitem)) {
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

	/* ����Ĭ��ֵparams */
	public void setDefaultParams() {
		/************* ���ع���MethodXML���ù̶����� *******************/
		params.put("threshold2", "60");
		params.put("size", "3");
		params.put("gradient", "0");

	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
