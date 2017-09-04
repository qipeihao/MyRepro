package test;

import java.util.List;

import yh.dao.DeptDao;
import yh.dao.impl.DeptDaoImpl;
import yh.entity.Dept;


public class T2 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		 DeptDao deptDao = new DeptDaoImpl();
		 List<Dept> dlist= deptDao.findAllDetps();
		 for (Dept dept : dlist) {
			System.out.println(dept.getDeptName());
		}

	}

}
