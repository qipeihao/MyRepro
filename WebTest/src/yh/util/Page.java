package yh.util;

import java.util.ArrayList;
import java.util.List;

import yh.entity.Emp;

/**
 * 
 * @author Administrator 分页信息封装类 , 通用于 各种 类型的记录的 分页
 */
public class Page<T> {
	private int pageNo;
	private int pageSize = 5;
	
	private int totalRow; //总结果数
	private int totalPage; // 总页数
	
	private int nextPageNo; //下一页页码
	private int prePageNo;  //上一页页码
	
	private List<T> pageList = new ArrayList<T>(); //分页查询内容

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRow() {
		return totalRow;
	}

	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
		if (totalRow % pageSize == 0) {
			this.totalPage = totalRow / pageSize;
		} else {
			this.totalPage = totalRow / pageSize + 1;
		}
		//确定 上一页 和下一页 页码
		//确定上一页
		if(pageNo-1<1){//越前边界
			prePageNo=1;
		}else{
			prePageNo=pageNo-1;
		}
		//确定下一页
		if(pageNo+1>totalPage){//越后边界
			nextPageNo=totalPage;
		}else{
			nextPageNo=pageNo+1;
		}
		
		
		/*if (totalPage == 1) {
			this.nextPageNo = 1;
			this.prePageNo = 1;
		} else if (pageNo <= 1) {
			this.prePageNo = 1;
			this.nextPageNo = pageNo + 1;
		} else if (pageNo >= totalPage) {
			this.prePageNo = pageNo - 1;
			this.nextPageNo = totalPage;
		} else {
			this.prePageNo = pageNo - 1;
			this.nextPageNo = pageNo + 1;
		}*/
	}

	public int getTotalPage() {
		return totalPage;
	}

	/*
	 * public void setTotalPage(int totalPage) { this.totalPage = totalPage; }
	 */
	public int getNextPageNo() {
		return nextPageNo;
	}

	public void setNextPageNo(int nextPageNo) {
		this.nextPageNo = nextPageNo;
	}

	public int getPrePageNo() {
		return prePageNo;
	}

	public void setPrePageNo(int prePageNo) {
		this.prePageNo = prePageNo;
	}

	public List<T> getPageList() {
		return pageList;
	}

	public void setPageList(List<T> pageList) {
		this.pageList = pageList;
	}

}
