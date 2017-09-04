<%@page import="yh.entity.Position"%>
<%@page import="yh.entity.Dept"%>
<%@page import="yh.entity.Emp"%>
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
<base href="<%=basePath%>">

<title>My JSP 'updateEmp.jsp' starting page</title>

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
#updateDiv {
	width: 30%;
	margin: 50px auto;
}

</style>
</head>

<body>
	<%
		Emp emp = (Emp) request.getAttribute("emp");
		List<Dept> dlist = (List<Dept>) request.getAttribute("dlist");
		List<Position> plist = (List<Position>) request
				.getAttribute("plist");
	%>
	<div id="updateDiv">
		<form class="form-horizontal" role="form" action="doUpdate.jsp"
			method="post">
			<input type="hidden" name="empNo" value="<%=emp.getEmpNo()%>">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">登录名:</label>
				<div class="col-sm-10">
					<input type="text" readonly="readonly" class="form-control"
						name="loginName" id="loginName" placeholder="请输入用户名"
						value="<%=emp.getLoginName()%>">
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">用户姓名:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="userName"
						id="userName" placeholder="请输入用户名" value="<%=emp.getUsername()%>">
				</div>
			</div>

			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">所属部门:</label>
				<div class="col-sm-10">
					<select class="form-control" name="deptNo">
						<%
							for (int i = 0; i < dlist.size(); i++) {
								if (dlist.get(i).getDeptNo() == emp.getDept().getDeptNo()) {
						%>

						        <option value="<%=dlist.get(i).getDeptNo()%>" selected="selected"><%=dlist.get(i).getDeptName()%></option>
						<%
							    } else {
						%>

						        <option value="<%=dlist.get(i).getDeptNo()%>"><%=dlist.get(i).getDeptName()%></option>
						<%
							   }
							}
						%>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">职位:</label>
				<div class="col-sm-10">
					<select class="form-control" name="positionID">
						<%
							for (int i = 0; i < plist.size(); i++) {
						%>
						<option value="<%=plist.get(i).getPositionID()%>"><%=plist.get(i).getPositionName()%></option>
						<%
							}
						%>
					</select>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="确认修改">
				</div>
			</div>

		</form>

	</div>
</body>
</html>
