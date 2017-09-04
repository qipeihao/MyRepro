package yh.biz;

import java.util.List;

import yh.entity.Emp;
import yh.util.Page;

public interface EmpBiz {
	/**
	 * 查询所有员工
	 */
	public List<Emp> findAllEmps();

	/**
	 * 登录验证
	 */
	public Emp loginUser(String loginName, String pwd);

	/**
	 * 注册新员工
	 */
	public int addEmp(Emp emp);

	/**
	 * 删除员工
	 */
	public int deleteEmp(int id);

	/**
	 * 根据员工编号查询员工完整信息
	 */
	public Emp findEmpByNo(int id);

	/**
	 * 修改员工信息
	 */
	public int updateEmp(Emp emp);
	
	public Page<Emp> findEmpPage(int pageNo, int pageSize);
}
