<%@page import="yh.util.Page"%>
<%@page import="yh.entity.Emp"%>
<%@page import="yh.biz.impl.EmpBizImpl"%>
<%@page import="yh.biz.EmpBiz"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	EmpBiz empBiz = new EmpBizImpl();
	//List<Emp> list = empBiz.findAllEmps();
	String pageNoStr = request.getParameter("pageNo");
	int pageNo = 1;
	if (pageNoStr != null) {
		pageNo = Integer.parseInt(pageNoStr);
	}
	String pageSizeStr = request.getParameter("pageSize");
	int pageSize = 1;
	if (pageSizeStr != null) {
		pageSize = Integer.parseInt(pageSizeStr);
	}
	Page<Emp> pageItem = new Page<Emp>();
	//为前端 准备 需要遍历的 页码 范围 ， 存入 List集合， 再放入 request 
	String windowNoStr = request.getParameter("windowNo");

	List<Integer> pageNoList = new ArrayList<Integer>();
	int preWindowNo;//上一个窗口 号
	int nextWindowNo;//下一个窗口 号
	int windowNo = 1;//要查看的 窗口号， 相当于 之前 的 pageNo
	int totalWindowNum = 1;//页码区间总窗口数
	int windowSize =5 ;
	if (windowNoStr != null) {//请求来自于点击 "《" 和"》" (查看上一个窗口 或 下一个窗口， 翻窗口)
	    System.out.println("%%%%%%%%%%%%%%###@@@获取要查看窗口的第一个页码:"+((windowNo - 1) * windowSize + 1));
		windowNo = Integer.parseInt(windowNoStr);//从翻窗口 请求参数中 类型转换 获取 要查看的上一个或下一个窗口号
		pageItem = empBiz.findEmpPage((windowNo - 1) * windowSize + 1, pageSize);//分页查询
		System.out.println("%%%%%%%%%%%%%%###:"+pageItem.getPageNo());

	} else {//请求来自于 点击 页码数字
		pageItem = empBiz.findEmpPage(pageNo, pageSize);//分页查询
		//根据 页码数 确定 窗口 号
		if (pageItem.getPageNo() % windowSize == 0) {
			windowNo = pageItem.getPageNo() / windowSize;
		} else {
			windowNo = pageItem.getPageNo() / windowSize + 1;
		}
	}
    //根据窗口号，参照 总窗口数 边界 ，确定 要显示的页码窗口 的 页码列表 
    // (windowNo - 1) * 5 + 1 为 指定窗口 的 开始页码，,5 为 每个窗口 可以 容纳 的 页码 个数，相当于 之前 的 pageSize
	if (windowNo * windowSize > pageItem.getTotalPage()) { //windowNo * 5 越界， 也就是说 当前 窗口 未盛满
		for (int i = (windowNo - 1) * windowSize + 1; i <= pageItem
				.getTotalPage(); i++) {
			pageNoList.add(i);
		}
	} else { // 当前窗口 盛满 页码序列
		for (int i = (windowNo - 1) * windowSize + 1; i <= windowNo * windowSize; i++) {
			pageNoList.add(i);
		}
	}
	//确定 总窗口数
	if (pageItem.getTotalPage() % 5 == 0) {
		totalWindowNum = pageItem.getTotalPage() / windowSize;
	} else {
		totalWindowNum = pageItem.getTotalPage() / windowSize + 1;
	}
	
	//提前准备 上一个窗口号和下一个窗口号
	//确定 下一个窗口号
	if (windowNo + 1 >= totalWindowNum) {//越前边界
		nextWindowNo = totalWindowNum;
	} else {
		nextWindowNo = windowNo + 1;
	}
	//确定 上一个 窗口号
	if (windowNo - 1 <= 1) {//越后边界
		preWindowNo = 1;
	} else {
		preWindowNo = windowNo - 1;
	}

	/* if(pageItem.getTotalPage()<=5){
	   for(int i = 1; i<=pageItem.getTotalPage() ; i++){
	       pageNoList.add(i);
	   }
	}else if(pageItem.getPageNo()<=2){
	    for(int i = 1; i<=5 ; i++){
	       pageNoList.add(i);
	         System.out.print(i+",");
	   }
	}else if(pageItem.getPageNo()>pageItem.getTotalPage()-2){
	    for(int i = pageItem.getTotalPage()-4; i<=pageItem.getTotalPage() ; i++){
	       pageNoList.add(i); 
	       System.out.print(i+",");
	   }
	}else{
	   for(int i = pageItem.getPageNo()-2; i<=pageItem.getPageNo()+2 ; i++){
	       pageNoList.add(i); 
	    }
	} */
	request.setAttribute("pageNoList", pageNoList);
	request.setAttribute("preWindowNo", preWindowNo);
	request.setAttribute("nextWindowNo", nextWindowNo);
	request.setAttribute("page", pageItem);
	request.getRequestDispatcher("empList.jsp").forward(request,
			response);
%>




