package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;

import servlet.InitLogServlet;
import db.ConnectionPoolSingleton;
import entity.LoginUserEnt;


/**
 * DAO锟斤拷 锟斤拷菘锟斤拷锟斤拷锟斤拷 锟矫伙拷锟斤拷锟斤拷锟� 锟斤拷锟斤拷锟睫革拷
 */
public class LoginUserDAO {
	private static Logger logger = Logger.getLogger(InitLogServlet.class);
	/* 添加用户 */
	public boolean addUser(LoginUserEnt u) throws ClassNotFoundException
			 {
		Connection conn = null;
		boolean re = false;
		try {
			conn = ConnectionPoolSingleton.getConnection();
			System.out.println("conn:" + conn.toString());
			String sql = "" + "insert into loginuser"
					+ "(UPoneNum,UPassword,UTime)" + "values("
					+ "?,?,current_date())";
			PreparedStatement ptmt;
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, u.getuPoneNum());
			ptmt.setString(2, u.getuPassword());
			ptmt.execute();
			ptmt.close();
			re = true;
			logger.info("User Register SUCCESS \t " + u.getuPoneNum());
		} catch (SQLException e) {
			logger.error(e.toString());
		} finally {
			ConnectionPoolSingleton.returnConnection(conn);
		}
		
		return re;
		
		 
	}

	/* 楠岃瘉鐢ㄦ埛鏄惁瀛樺湪 */
	public boolean isUser(LoginUserEnt u) throws 
			ClassNotFoundException {
		Connection conn = null;
		 
		boolean re = false;
		try	{
			conn = ConnectionPoolSingleton.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append("select * from loginuser where UPoneNum=? and UPassword=?");
			PreparedStatement ptmt = conn.prepareStatement(sb.toString());
			ptmt.setString(1, u.getuPoneNum());
			ptmt.setString(2, u.getuPassword());
			
			ResultSet rs = ptmt.executeQuery();
			if (rs.next()) {
				re = true;
				logger.info("User Verify SUCCESS \t" + u.getuPoneNum());
			} else{
				logger.info("User Verify FAILED \t" + u.getuPoneNum());
			}
			
			rs.close();
			ptmt.close();
			
		}catch (SQLException e)	{
			logger.error(e.toString());
		}finally{
			ConnectionPoolSingleton.returnConnection(conn);
		}
		

	
		
		return re;

	}

	public boolean isExitUser(String uPone) throws SQLException,
			ClassNotFoundException {
		Connection conn = ConnectionPoolSingleton.getConnection();

		StringBuilder sb = new StringBuilder();
		sb.append("select * from loginuser where UPoneNum=? ");
		PreparedStatement ptmt = conn.prepareStatement(sb.toString());
		ptmt.setString(1, uPone);
		// 鎵ц
		ResultSet rs = ptmt.executeQuery();
		boolean re = false;
		if (rs.next()) {
			re = true;
		}
		
		rs.close();
		ptmt.close();
		ConnectionPoolSingleton.returnConnection(conn);
		return re;

	}


	public boolean modifyUserPassWord(LoginUserEnt u) throws SQLException,
			ClassNotFoundException {
		Connection conn = ConnectionPoolSingleton.getConnection();
		StringBuilder sb = new StringBuilder();
		sb.append(" update  loginuser set UPassword=? where UPoneNum=?");
		PreparedStatement ptmt = conn.prepareStatement(sb.toString());
		ptmt.setString(1, u.getuPassword());
		ptmt.setString(2, u.getuPoneNum());
		// 锟斤拷锟斤拷1 说锟斤拷锟睫改成癸拷
		boolean re = false;
		if (ptmt.executeUpdate() == 1) {
			re = true;
		}  
		
		ptmt.close();
		ConnectionPoolSingleton.returnConnection(conn);
		return re;
	}

}
