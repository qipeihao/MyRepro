<%@page import="yh.biz.impl.EmpBizImpl"%>
<%@page import="yh.biz.EmpBiz"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="yh.entity.Emp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	EmpBiz empBiz = new EmpBizImpl();
	request.setCharacterEncoding("UTF-8");
	String userName = request.getParameter("uname");
	String passworld = request.getParameter("pwd");
	String isRemember = request.getParameter("isRemeber");
	System.out.println("isRemember:" + isRemember);
	//userName= new String(userName.getBytes("ISO-8859-1"),"UTF-8");
	System.out.println("用户名:" + userName);
	Emp emp = empBiz.loginUser(userName, passworld);
	if (emp != null) {
		//out.print("用户名密码正确!!!");
		//查询数据库, 获取主页中需要的集合数据, 通过 setAttribute() 存入 request对象, 转发,跳转到 home.jsp,  相当于一个为主页准备数据的过程
		//重定向
		//response.sendRedirect("home.jsp");

		//将当前用户 信息 存入 session, 该对象在 整个会话过程中 一直有效
		session.setAttribute("curr_user", emp);
		session.setAttribute("user_level", 1);
		if (isRemember != null) {
			//创建cookie对象
			Cookie c1 = new Cookie("userName", URLEncoder.encode(
					userName, "UTF-8"));
			Cookie c2 = new Cookie("pwd", URLEncoder.encode(passworld,
					"UTF-8"));
			c1.setMaxAge(1000);//设置cookie有效时间,单位:秒
			c2.setMaxAge(1000);//设置cookie有效时间,单位:秒
			c1.setPath("/");//设置有效访问路径 为 根目录下的任意路径
			c2.setPath("/");//设置有效访问路径 为 根目录下的任意路径
			response.addCookie(c1);
			response.addCookie(c2);
		} else {
			//创建cookie对象
			Cookie c1 = new Cookie("userName", URLEncoder.encode(
					userName, "UTF-8"));
			Cookie c2 = new Cookie("pwd", URLEncoder.encode(passworld,
					"UTF-8"));
			c1.setMaxAge(0);//设置cookie有效时间,单位:秒
			c2.setMaxAge(0);//设置cookie有效时间,单位:秒
			c1.setPath("/");//设置有效访问路径 为 根目录下的任意路径
			c2.setPath("/");//设置有效访问路径 为 根目录下的任意路径
			response.addCookie(c1);
			response.addCookie(c2);
		}

		request.getRequestDispatcher("home.jsp").forward(request,
				response);

	} else {
		out.print("用户名或密码错误!!!!!");
		request.setAttribute("message", "用户名或密码错误!!");
		//response.sendRedirect("login.jsp");
		//转发, 通过forward方法 将本次请求的 request和response对象 继续传递下去
		request.getRequestDispatcher("login.jsp").forward(request,
				response);
	}
%>