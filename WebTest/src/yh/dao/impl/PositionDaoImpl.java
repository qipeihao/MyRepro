package yh.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import yh.dao.PositionDao;
import yh.entity.Dept;
import yh.entity.Position;
import yh.util.DBUtil;

public class PositionDaoImpl implements PositionDao {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
	@Override
	public List<Position> findAllPositions() {
		List<Position>  plist = new ArrayList<Position>();
		String sql= "select * from POSITION";
		conn = DBUtil.getConnection();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				Position p = new Position();
				p.setPositionID(rs.getInt("positionid"));
				p.setPositionName(rs.getString("positionname"));
				plist.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, ps, conn);
			
		}
		return plist;
	}

}
