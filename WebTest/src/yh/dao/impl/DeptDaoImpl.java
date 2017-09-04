package yh.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import yh.dao.DeptDao;
import yh.entity.Dept;
import yh.entity.Emp;
import yh.util.DBUtil;

public class DeptDaoImpl implements DeptDao {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
	@Override
	public List<Dept> findAllDetps() {
		List<Dept>  dlist = new ArrayList<Dept>();
		String sql= "select * from DEPT";
		conn = DBUtil.getConnection();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				Dept dept = new Dept();
				dept.setDeptNo(rs.getInt("deptno"));
				dept.setDeptName(rs.getString("deptname"));
				dlist.add(dept);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, ps, conn);
			
		}
		
		return dlist;
	}

}
