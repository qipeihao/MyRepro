package yh.biz.impl;

import java.util.List;


import yh.biz.EmpBiz;
import yh.dao.EmpDao;
import yh.dao.impl.EmpDaoImpl;
import yh.entity.Emp;
import yh.util.Page;

public class EmpBizImpl implements EmpBiz {
	
    private EmpDao empDao = new EmpDaoImpl();

	@Override
	public List<Emp> findAllEmps() {
		return empDao.getAllEmps();
	}

	@Override
	public Emp loginUser(String loginName, String pwd) {
		return empDao.login(loginName, pwd);
	}

	@Override
	public int addEmp(Emp emp) {
		return empDao.addEmp(emp);
	}

	@Override
	public int deleteEmp(int id) {
		return empDao.deleteEmp(id);
	}

	@Override
	public Emp findEmpByNo(int id) {
		return empDao.findEmpByNo(id);
	}

	@Override
	public int updateEmp(Emp emp) {
		return empDao.updateEmp(emp);
	}

	@Override
	public Page<Emp> findEmpPage(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return empDao.findEmpByPage(pageNo, pageSize);
	}

}
