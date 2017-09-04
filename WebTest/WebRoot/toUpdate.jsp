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
  String idStr = request.getParameter("empNo");
  EmpBiz empBiz = new EmpBizImpl();
  DeptBiz deptBiz = new DeptBizImpl();
  PositionBiz positionBiz = new PositionBizImpl();
  int id = -1;
  if(idStr!=null){
      id = Integer.parseInt(idStr);
  }
  Emp emp = empBiz.findEmpByNo(id);
  List<Dept> dlist = deptBiz.findAllDetps();
  List<Position> plist = positionBiz.findAllPositions();
  request.setAttribute("emp", emp);
  request.setAttribute("dlist", dlist);
  request.setAttribute("plist", plist);
  request.getRequestDispatcher("updateEmp.jsp").forward(request, response);
%>
