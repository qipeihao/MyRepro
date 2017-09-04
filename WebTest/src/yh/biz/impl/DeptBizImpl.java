package yh.biz.impl;

import java.util.List;


import yh.biz.DeptBiz;
import yh.dao.DeptDao;
import yh.dao.impl.DeptDaoImpl;
import yh.entity.Dept;

public class DeptBizImpl implements DeptBiz {
    private DeptDao deptDao = new DeptDaoImpl();
	@Override
	public List<Dept> findAllDetps() {
		
		return deptDao.findAllDetps();
	}

}
