<%@page import="yh.util.Page"%>
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

<title>My JSP 'empList.jsp' starting page</title>

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
#pageListDiv { /* width:50%; */
	/* margin: 5px auto; */
	text-align: center;
}
#tableDiv{
   height: 80%;
}
</style>
<script type="text/javascript">
    $(function(){
        setTimeout("clearMsg()",3000);
    
    });
	function confirmDelete(eno) {
	   // alert(eno);
		var r = confirm("是否确认删除该员工？");
		if (r == true) {
			window.location.href="doDelete.jsp?empNo="+eno; 
		}
	}
	function  clearMsg(){
	
	   $(".alert").slideUp("slow");
	}
	
</script>
</head>

<body>
	<ol class="breadcrumb">
		<li><a href="#">主页</a></li>
		<li class="active">员工管理</li>
	</ol>
	<%
		if (request.getAttribute("msg") != null
				&& request.getAttribute("msg").equals("删除员工成功！！")) {
	%>
	<div class="alert alert-success"><%=request.getAttribute("msg")%></div>
	<%
		}
	%>
	<%
		if (request.getAttribute("msg") != null
				&& request.getAttribute("msg").equals("删除员工失败！！")) {
	%>
	<div class="alert alert-danger"><%=request.getAttribute("msg")%></div>
	<%
		}
	%>
	<%
		//List<Emp> emplist = (List<Emp>) request.getAttribute("elist");
		Page<Emp> pageItem = (Page<Emp>) request.getAttribute("page");
		List<Integer> pageNoList = (List<Integer>) request
				.getAttribute("pageNoList");
	%>
	<div id="tableDiv">
		<table class="table">
			<tr>
				<td>员工编号</td>
				<td>员工账号</td>
				<td>员工姓名</td>
				<!-- <td>所属部门</td>
			<td>职位</td> -->
				<td>操作</td>
			</tr>
			<%
				for (int i = 0; i < pageItem.getPageList().size(); i++) {
					Emp emp = pageItem.getPageList().get(i);
			%>
			<tr>
				<td><%=emp.getEmpNo()%></td>
				<td><%=emp.getLoginName()%></td>
				<td><%=emp.getUsername()%></td>
				<%-- <td><%=emp.getDept().getDeptName()%></td>
			<td><%=emp.getPosition().getPositionName()%></td> --%>
				<td><a href="toUpdate.jsp?empNo=<%=emp.getEmpNo()%>">修改</a> <a
					onclick="confirmDelete(<%=emp.getEmpNo()%>);">删除</a></td>
			</tr>

			<%
				}
			%>
		</table>
	</div>
	<div id="pageListDiv">
		<ul class="pagination">
			<li><a href="doFindAllEmps.jsp?pageNo=1">首页</a>
			</li>
			<li><a
				href="doFindAllEmps.jsp?windowNo=<%=request.getAttribute("preWindowNo")%>">&laquo;</a>
			</li>
			<%
				for (int i : pageNoList) {
					if (i == pageItem.getPageNo()) {
			%>
			<li class="active"><a href="doFindAllEmps.jsp?pageNo=<%=i%>"><%=i%></a>
			</li>
			<%
				} else {
			%>
			<li><a href="doFindAllEmps.jsp?pageNo=<%=i%>"><%=i%></a>
			</li>

			<%
				}
				}
			%>
			<li><a
				href="doFindAllEmps.jsp?windowNo=<%=request.getAttribute("nextWindowNo")%>">&raquo;</a>
			</li>
			<li><a
				href="doFindAllEmps.jsp?pageNo=<%=pageItem.getTotalPage()%>">尾页</a>
			</li>
		</ul>
	</div>
	<%=pageItem.getPageNo()%>
</body>
</html>
