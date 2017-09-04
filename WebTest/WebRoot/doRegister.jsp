<%@page import="yh.entity.Position"%>
<%@page import="yh.entity.Dept"%>
<%@page import="yh.biz.impl.EmpBizImpl"%>
<%@page import="yh.biz.EmpBiz"%>
<%@page import="yh.entity.Emp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   EmpBiz empBiz = new  EmpBizImpl();
   Emp emp = new Emp();
   String loginName = request.getParameter("loginName");
   String pwd = request.getParameter("pwd");
   String username = request.getParameter("userName");
   String rePwd = request.getParameter("rePwd");
   String deptNoStr = request.getParameter("deptNo");
   String positionNoStr = request.getParameter("positionID");
   int deptNo=-1;
   int posID =-1;
   if(deptNoStr != null){
      deptNo = Integer.parseInt(deptNoStr);
   }
    if(positionNoStr != null){
      posID = Integer.parseInt(positionNoStr);
   }
   emp.setLoginName(loginName);
   emp.setPwd(pwd);
   emp.setUsername(username);
   //Dept d = new Dept();
   //d.setDeptNo(deptNo);
   emp.setDept(new Dept(deptNo));
   emp.setPosition(new Position(posID));
   empBiz.addEmp(emp);
   //System.out.println("================"+emp.getLoginName());
   request.getRequestDispatcher("login.jsp").forward(request, response);
   
%>