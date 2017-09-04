<%@page import="yh.biz.impl.PositionBizImpl"%>
<%@page import="yh.biz.PositionBiz"%>
<%@page import="yh.entity.Position"%>
<%@page import="yh.entity.Dept"%>
<%@page import="yh.biz.impl.DeptBizImpl"%>
<%@page import="yh.biz.DeptBiz"%>
<%@page import="yh.entity.Emp"%>
<%@page import="yh.biz.impl.EmpBizImpl"%>
<%@page import="yh.biz.EmpBiz"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	EmpBiz empBiz = new EmpBizImpl();
	String idStr = request.getParameter("empNo");
	String username = request.getParameter("userName");
	String deptNoStr = request.getParameter("deptNo");
	String positionNoStr = request.getParameter("positionID");
	int id = -1;
	int deptNo = -1;
	int posID = -1;
	if (idStr != null) {
		id = Integer.parseInt(idStr);
	}
	if (deptNoStr != null) {
		deptNo = Integer.parseInt(deptNoStr);
	}
	if (positionNoStr != null) {
		posID = Integer.parseInt(positionNoStr);
	}
	//将表单提交的参数 封装到 Emp 对象中 ， 向下层传递，最终 执行SQL
	Emp emp = new Emp();
	emp.setEmpNo(id);
	emp.setUsername(username);
	emp.setDept(new Dept(deptNo));
	emp.setPosition(new Position(posID));
	int num = empBiz.updateEmp(emp);
	request.setAttribute("emp", emp);

	request.getRequestDispatcher("doFindAllEmps.jsp").forward(request,
			response);
%>
