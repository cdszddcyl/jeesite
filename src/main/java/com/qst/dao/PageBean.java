package com.qst.dao;

import java.io.Serializable;
import java.util.List;
/**
 * Stone.Cai
 * 2015年09月07日18:39:46
 * 添加
 * 分页的类用于传递分页数据
 */
@SuppressWarnings("rawtypes")
public class PageBean implements  Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2655688662025810299L;

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public int getAllRow() {
		return allRow;
	}

	public void setAllRow(int allRow) {
		this.allRow = allRow;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public boolean getIsFirstPage() {
		return this.isFirstPage;
	}

	public boolean getIsLastPage() {
		return this.isLastPage;
	}

	
	private List list;
	private int allRow = 0; // total records
	private int totalPage = 1;// Total page
	private int currentPage = 1;//
	private int pageSize=10;// 每页 records 总数没有

	private boolean isFirstPage;// 是否为第一页
	private boolean isLastPage;// 是否为最后一页
	private boolean hasPreviousPage;// 是否有前一页
	private boolean hasNextPage;// 是否有下一页
	private int startIndex;
	private int endIndex;
	private long total;

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public int getStartIndex() {
		return (currentPage-1)*pageSize;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getEndIndex() {
		return currentPage*pageSize;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}

	/** * 初始化分页信息 */
	public void init() {
		this.isFirstPage = isFirstPage();
		this.isLastPage = isLastPage();
		this.hasPreviousPage = isHasPreviousPage();
		this.hasNextPage = isHasNextPage();
	}
	/**
	 * * 以下判断页的信息,只需getter方法(is方法)即可 * @return
	 */
	public boolean isFirstPage() {
		return currentPage == 1;// 如是当前页是第1页
	}

	public boolean isLastPage() {
		return currentPage == totalPage;// 如果当前页是最后一页
	}

	public boolean isHasPreviousPage() {
		return currentPage != 1;
	}

	public boolean isHasNextPage() {
		return currentPage != totalPage;// 只要当前页不是最后1页
	}

	/**
	 * 计算总页数,静态方法,供外部直接通过类名调用 * @param pageSize 每页记录数 * @param allRow 总记录数
	 * * @return 总页数
	 */
	public  int countTotalPage(final int pageSize, final int allRow) {
		if (allRow == 0)
			return 1;
		if (allRow % pageSize == 0)
			return allRow / pageSize;
		else
			return allRow / pageSize + 1;
	}

	/**
	 * 总页数
	 */
	public int totalPages() {
		int totalPage = allRow % pageSize == 0 ? allRow / pageSize : allRow / pageSize + 1;
		if (totalPage == 0) {
			totalPage = 1;
		}
		return totalPage;
	}

	

}
