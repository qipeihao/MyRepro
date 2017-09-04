package yh.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import yh.biz.EmpBiz;
import yh.dao.EmpDao;
import yh.entity.Dept;
import yh.entity.Emp;
import yh.entity.Position;
import yh.util.DBUtil;
import yh.util.Page;

public class EmpDaoImpl implements  EmpDao {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
	@Override
	public List<Emp> getAllEmps() {
		List<Emp>  elist = new ArrayList<Emp>();
		String sql= "select e.*,d.deptname,p.positionname from EMP e , DEPT d,position p where e.deptno=d.deptno and e.positionid=p.positionid ";
		conn = DBUtil.getConnection();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				Emp emp = new Emp();
				emp.setEmpNo(rs.getInt("empno"));
				emp.setUsername(rs.getString("empname"));
				emp.setPwd(rs.getString("pwd"));
				emp.setLoginName(rs.getString("loginname"));
				emp.setDept(new Dept(rs.getInt("deptno"), rs.getString("deptname")));
				emp.setPosition(new Position(rs.getInt("positionid"), rs.getString("positionname")));
				elist.add(emp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, ps, conn);
			
		}
		
		return elist;
	}
	@Override
	public Emp login(String loginName, String pwd) {
		Emp emp = null;
		StringBuffer strBuff = new StringBuffer();
		strBuff.append(" select *");
		strBuff.append(" from EMP");
		strBuff.append(" where loginname = ? and pwd =?");
		conn = DBUtil.getConnection();
		try {
			ps = conn.prepareStatement(strBuff.toString());
			ps.setString(1, loginName);
			ps.setString(2, pwd);
			rs = ps.executeQuery();
			if(rs.next()){
			    emp = new Emp();
				emp.setEmpNo(rs.getInt("empno"));
				emp.setUsername(rs.getString("empname"));
				emp.setPwd(rs.getString("pwd"));
				emp.setLoginName(rs.getString("loginname"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, ps, conn);
		}
		return emp;
	}
	@Override
	public int addEmp(Emp emp) {
		int num = -1;
		StringBuffer strBuff = new StringBuffer();
		strBuff.append(" insert into EMP");
		strBuff.append("(empno,loginname,pwd,empname,deptno,positionid)");
		strBuff.append(" values(seq_empno.nextval,?,?,?,?,?)");
		conn=DBUtil.getConnection();
		try {
			ps= conn.prepareStatement(strBuff.toString());
			ps.setString(1, emp.getLoginName());
			ps.setString(2, emp.getPwd());
			ps.setString(3, emp.getUsername());
			ps.setInt(4, emp.getDept().getDeptNo());
			System.out.println(emp.getPosition()+"========1111");
			System.out.println(emp.getPosition().getPositionID()+"=============222");
			ps.setInt(5, emp.getPosition().getPositionID());
			num = ps.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, ps, conn);
		}	
		return num;
	}
	@Override
	public int deleteEmp(int id) {
		int num = -1;
		StringBuffer strBuff = new StringBuffer();
		strBuff.append(" delete  Emp");
		strBuff.append(" where empno=?");
		System.out.println(strBuff);
		conn=DBUtil.getConnection();
		try {
			ps = conn.prepareStatement(strBuff.toString());
			ps.setInt(1, id);
			num = ps.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		return num;
	}
	@Override
	public Emp findEmpByNo(int id) {
		Emp emp =null;
		StringBuffer strBuff = new StringBuffer();
		strBuff.append(" select e.*,d.deptname,p.positionname");
		strBuff.append(" from EMP e , dept d,position p");
		strBuff.append(" where e.deptno=d.deptno and e.positionid = p.positionid and empno=?");
		conn=DBUtil.getConnection();
		try {
			ps= conn.prepareStatement(strBuff.toString());
			ps.setInt(1,id);
			rs = ps.executeQuery();
			if(rs.next()){
				emp = new Emp();
				emp.setEmpNo(rs.getInt("empno"));
				emp.setUsername(rs.getString("empname"));
				emp.setPwd(rs.getString("pwd"));
				emp.setLoginName(rs.getString("loginname"));
				emp.setDept(new Dept(rs.getInt("deptno"), rs.getString("deptname")));
				emp.setPosition(new Position(rs.getInt("positionid"), rs.getString("positionname")));
				
			}
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, ps, conn);
		}	
		return emp;
	}
	@Override
	public int updateEmp(Emp emp) {
		int num = -1;
		StringBuffer strBuff = new StringBuffer();
		strBuff.append(" update EMP");
		strBuff.append(" set empname=? ,deptno=?,positionid=?");
		strBuff.append(" where empno=?");
		conn=DBUtil.getConnection();
		try {
			ps= conn.prepareStatement(strBuff.toString());
			ps.setString(1, emp.getUsername());
			ps.setInt(2, emp.getDept().getDeptNo());
			ps.setInt(3, emp.getPosition().getPositionID());
			ps.setInt(4, emp.getEmpNo());
			System.out.println(emp.getEmpNo()+"============");
			num = ps.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, ps, conn);
		}	
		return num;
	}
	@Override
	public Page<Emp> findEmpByPage(int pageNo, int pageSize) {
		Page<Emp> page = new Page<Emp>();
		page.setPageSize(pageSize);
		page.setPageNo(pageNo);
		int num = this.countEmp();
		page.setTotalRow(num);
		
		List<Emp> list = new ArrayList<Emp>();
		Emp emp =null;
		StringBuffer strBuff = new StringBuffer();
		strBuff.append(" select * ");
		strBuff.append(" from (");
		strBuff.append("      select e.*, rownum as rn ");
		strBuff.append("      from EMP e ");
		strBuff.append("      where rownum <=?");
		strBuff.append(" ) ");
		strBuff.append(" where rn >?");
		conn=DBUtil.getConnection();
		try {
			ps= conn.prepareStatement(strBuff.toString());
			ps.setInt(1,pageNo*pageSize);
			ps.setInt(2,(pageNo-1)*pageSize);
			rs = ps.executeQuery();
			while(rs.next()){
				System.out.println("=============");
				emp = new Emp();
				emp.setEmpNo(rs.getInt("empno"));
				emp.setUsername(rs.getString("empname"));
				emp.setPwd(rs.getString("pwd"));
				emp.setLoginName(rs.getString("loginname"));
				/*emp.setDept(new Dept(rs.getInt("deptno"), rs.getString("deptname")));
				emp.setPosition(new Position(rs.getInt("positionid"), rs.getString("positionname")));*/
				list.add(emp);
			}
			page.setPageList(list);
			//conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, ps, conn);
		}	
		return page;
	}
	@Override
	public int countEmp() {
		int num=0;
		StringBuffer strBuff = new StringBuffer();
		strBuff.append(" select count(*)");
		strBuff.append(" from EMP");
		conn=DBUtil.getConnection();
			try {
				ps= conn.prepareStatement(strBuff.toString());
				rs = ps.executeQuery();
				if(rs.next()){
					num = rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtil.closeAll(rs, ps, conn);
			}
		return num;
	}


}
