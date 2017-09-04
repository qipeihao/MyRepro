<%@page import="yh.biz.impl.EmpBizImpl"%>
<%@page import="yh.biz.EmpBiz"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
  String idStr = request.getParameter("empNo");
  int id = -1;
  if(idStr!=null){
      id = Integer.parseInt(idStr);
  }
  System.out.println("==========="+idStr);
  String msg ="";
  //调用业务层方法，执行删除员工操作
  EmpBiz empBiz = new EmpBizImpl();
  int num = empBiz.deleteEmp(id);
  if(num>0){
     msg = "删除员工成功！！";
  }else{
   msg = "删除员工失败！！";
  }
  request.setAttribute("msg", msg);
  request.getRequestDispatcher("doFindAllEmps.jsp").forward(request, response);
%>
