package db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class LoginUserDB {
	private static final String URL="jdbc:mysql://121.42.179.29/cvhammer?useUnicode=true&amp;characterEncoding=utf-8";
	private static final String USER="root";
	private static final String PASSWORD="root123";
	private static Connection conn=null;
	/**
	 * 静态代码块；初始化使用，只被执行一次
	 */
    static{
	try {
		//1.锟斤拷锟斤拷锟斤拷锟斤拷锟�
		Class.forName("com.mysql.jdbc.Driver");
		//2.锟斤拷锟斤拷锟捷匡拷锟斤拷锟斤拷锟�
		conn=DriverManager.getConnection(URL, USER, PASSWORD);
	    System.out.println("数据库连接成功");
	} catch (ClassNotFoundException e) {
		System.out.println("erro1");
		e.printStackTrace();
		
	} catch (SQLException e) {
		System.out.println("error2");
		e.printStackTrace();
	  }
   }
    public static synchronized Connection getConnection(){
    	if(conn==null)
    	{
    		try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
    		try {
    			
				conn=DriverManager.getConnection(URL, USER, PASSWORD);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
    		return conn;
    	}
    	
    	
    	try {
			if(conn.isClosed()){
				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return null;
				}
	    		try {
	    			
					conn=DriverManager.getConnection(URL, USER, PASSWORD);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return null;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return conn;
    	
		
	}
}
