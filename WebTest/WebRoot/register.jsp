<%@page import="yh.entity.Position"%>
<%@page import="yh.biz.impl.PositionBizImpl"%>
<%@page import="yh.biz.PositionBiz"%>
<%@page import="yh.entity.Dept"%>
<%@page import="yh.biz.impl.DeptBizImpl"%>
<%@page import="yh.biz.DeptBiz"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>" target="">

<title>My JSP 'login.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<style type="text/css">
#loginDiv {
	width: 30%;
	margin: 50px auto;
}

#bar {
	width: 10%;
	margin: 50px auto;
}

li.list-group-item {
	padding: 10px 0;
}

span.li {
	margin-left: 20px;
}

span.l2 {
	margin-left: 25px;
}

ul {
	padding: 0px 0px 0px 8px;
}
</style>

  
</head>

<body>
	
	<%
	    DeptBiz deptBiz = new DeptBizImpl();
	    List<Dept> dlist = deptBiz.findAllDetps();
	    PositionBiz positionBiz = new PositionBizImpl();
	    List<Position> plist = positionBiz.findAllPositions();
	 %>

	<div id="loginDiv">
		<form class="form-horizontal" role="form" action="doRegister.jsp"
			method="post">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">登录名:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="loginName" id="loginName"
						 placeholder="请输入用户名">
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">用户姓名:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="userName" id="userName"
						 placeholder="请输入用户名">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">密码:</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="pwd"
						name="pwd"  placeholder="请输入密码">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">确认密码:</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="repwd"
						name="repwd"  placeholder="请输入密码">
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">所属部门:</label>
				<div class="col-sm-10">
					<select  class="form-control" name="deptNo">
					    <%for(int i=0;i<dlist.size();i++){ %>
					        <option value="<%=dlist.get(i).getDeptNo()  %>" ><%=dlist.get(i).getDeptName() %></option>
					    <% } %>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">职位:</label>
				<div class="col-sm-10">
					<select  class="form-control" name="positionID">
					    <%for(int i=0;i<plist.size();i++){ %>
					        <option value="<%=plist.get(i).getPositionID()  %>" ><%=plist.get(i).getPositionName() %></option>
					    <% } %>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="注册">
				</div>
			</div>

		</form>
	
	</div>
	
</body>
</html>
