package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

import org.apache.log4j.Logger;

import servlet.InitLogServlet;
import db.ConnectionPoolSingleton;
import entity.UExpItemEnt;

public class UExpItemDAO {
	/* 添加用户实验 */
	private static Logger logger = Logger.getLogger(InitLogServlet.class);

	public boolean addUExpItem(UExpItemEnt uitem) {
		Connection conn = null;
		try {
			conn = ConnectionPoolSingleton.getConnection();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if (conn == null) {
			return false;
		}
		// System.out.println("conn:"+conn.toString());
		String sql = "" + "insert into uexpitemtable"
				+ "(UPoneNum,EName,ESrcs,ERess,EParams,UTime,ERessType)"
				+ "values(" + "?,?,?,?,?,current_date(),?)";
		PreparedStatement ptmt;
		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, uitem.getuPoneNum());
			ptmt.setString(2, uitem.geteName());
			ptmt.setString(3, uitem.geteSrcs());
			ptmt.setString(4, uitem.geteRess());
			ptmt.setString(5, uitem.geteParams());
			ptmt.setString(6, uitem.geteRessType());
			ptmt.execute();
			ptmt.close();
			logger.info("Success insert experiment result "
					+ uitem.getuPoneNum());
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			logger.error(e.toString());
			return false;
		} finally {
			ConnectionPoolSingleton.returnConnection(conn);
		}
	}

	public List<UExpItemEnt> getUExpItemByPoneNum(String uPoneNum)
			throws ClassNotFoundException, SQLException {
		/* 返回值设置 */
		List<UExpItemEnt> uexpitemlist = new LinkedList<UExpItemEnt>();
		Connection conn = ConnectionPoolSingleton.getConnection();
		StringBuilder sb = new StringBuilder();
		sb.append("select * from  uexpitemtable where UPoneNum=? ");
		PreparedStatement ptmt;
		try {
			ptmt = conn.prepareStatement(sb.toString());
			ptmt.setString(1, uPoneNum);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {
				UExpItemEnt uexpitem = new UExpItemEnt();
				uexpitem.setuPoneNum(uPoneNum);
				uexpitem.seteName(rs.getString("EName"));
				uexpitem.seteSrcs(rs.getString("ESrcs"));
				uexpitem.seteRess(rs.getString("ERess"));
				uexpitem.seteParams(rs.getString("EParams"));
				uexpitem.seteRessType(rs.getString("ERessType"));
				if (rs.getString("ERessType") != null) {
					if (rs.getString("ERessType").equals("images")) {
						uexpitem.seteResImgList(rs.getString("ERess"));
					}
				}
				uexpitemlist.add(uexpitem);
				uexpitem.toString();
				logger.info("Success to select result \t experiment id"
						+ rs.getInt("ID") + "\t " + "user phone " + uPoneNum);
			}
			rs.close();
			ptmt.close();

			ConnectionPoolSingleton.returnConnection(conn);
			Collections.reverse(uexpitemlist);

			return uexpitemlist;
		} catch (SQLException e) {
			logger.error(e.toString());
			return null;
		}

	}
}
