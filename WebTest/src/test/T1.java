package test;

import java.util.List;

import yh.dao.EmpDao;
import yh.dao.impl.EmpDaoImpl;
import yh.entity.Emp;


public class T1 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		 EmpDao empDao = new EmpDaoImpl();
		/* List<Emp> list = empDao.getAllEmps();
		 for (Emp emp : list) {
			System.out.println(emp.getLoginName()+","+emp.getPwd());
		}  */
		// System.out.println(empDao.login("yh", "123").getEmpNo());
        // System.out.println(empDao.deleteEmp(2));
		 /*List<Emp> list = empDao.findEmpByPage(2, 5);
		 System.out.println(list.size());
		 for (Emp emp : list) {
			 System.out.println(emp.getLoginName());
		}*/
		 System.out.println(empDao.countEmp());
	}

}
