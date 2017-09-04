<%@page import="yh.entity.Emp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>" target="rightFrame">

<title>My JSP 'home.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
#topDiv {
	width: 100%;
	height: 100px;
	background-color: #3399CC;
	clear: both;
	font-family: "楷体";
}

#leftDiv {
	float: left;
	width: 15%;
	height: 700px;
}

#mainDiv {
	float: left;
	width: 85%;
	height: 700px;
}

#bottomDiv {
	width: 100%;
	height: 100px;
	background-color: #336699;
	clear: both;
	
}
#rightFrame{
   border: none;
}

</style>

</head>

<body>
	<div id="topDiv">
		<%@include file="pageItem/top.jsp"%>
	</div>
	<div id="leftDiv">
		<%@include file="pageItem/leftSiderBar.jsp"%>
	</div>
	<div id="mainDiv">
	    <iframe id="rightFrame"  name="rightFrame" width="100%" height="700px" src="welcome.html"></iframe>
	</div>
	<div id="bottomDiv">
		<%@include file="pageItem/foot.jsp"%>

	</div>

</body>
</html>
