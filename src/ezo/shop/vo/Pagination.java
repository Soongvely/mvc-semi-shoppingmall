package ezo.shop.vo;

import ezo.shop.util.NumberUtils;

public class Pagination {

	private int rowsPerPage;
	private int pagesPerPage;
	private int pageNo;
	private int totalRows;

	public Pagination(int pageNo, int totalRows) {
		this.rowsPerPage = 5;
		this.pagesPerPage = 5;
		this.pageNo = pageNo;
		this.totalRows = totalRows;
	}

	/**
	 * Pagination객체를 생성한다.
	 * 
	 * @param pageNo      요청한 페이지 번호
	 * @param totalRows   전체 데이터 갯수
	 * @param rowsPerPage 한 화면에 표시할 행의 갯수
	 */

	public Pagination(int pageNo, int totalRows, int rowsPerPage) {
		this.rowsPerPage = rowsPerPage;
		this.pagesPerPage = 5;
		this.pageNo = pageNo;
		this.totalRows = totalRows;
	}

	/**
	 * Pagination객체를 생성한다.
	 * 
	 * @param pageNo       요청한 페이지 번호
	 * @param totalRows    전체 데이터 갯수
	 * @param rowsPerPage  한 화면에 표시할 행의 갯수
	 * @param pagesPerPage 한 화면에 표시할 페이지 번호 갯수
	 */
	public Pagination(int pageNo, int totalRows, int rowsPerPage, int pagesPerPage) {
		this.rowsPerPage = rowsPerPage;
		this.pagesPerPage = pagesPerPage;
		this.pageNo = pageNo;
		this.totalRows = totalRows;
	}

	/**
	 * 전체 페이지 갯수를 반환한다.
	 * 
	 * @return 총 페이지 갯수
	 */
	public int getTotalPagesCount() {
		return NumberUtils.ceil(totalRows, rowsPerPage);
	}

	/**
	 * 전체 구간 갯수를 반환한다
	 * 
	 * @return 총 구간 갯수
	 */
	public int getTotalBlocksCount() {
		return NumberUtils.ceil(getTotalPagesCount(), pagesPerPage);
	}

	/**
	 * 요청한 페이지 번호가 속한 현재 구간을 반환한다.
	 * 
	 * @return 현재 구간 번호
	 */
	public int getCurrentBlockNo() {
		return NumberUtils.ceil(pageNo, pagesPerPage);
	}

	/**
	 * 페이지 내비게이션의 시작 페이지 번호를 반환한다.
	 * 
	 * @return 시작 페이지 번호
	 */
	public int getBeginPage() {
		return (getCurrentBlockNo() - 1) * pagesPerPage + 1;
	}

	/**
	 * 페이지 내비게이션의 끝 페이지 번호를 반환한다.
	 * 
	 * @return 끝 페이지 번호
	 */
	public int getEndPage() {
		return (getCurrentBlockNo() == getTotalBlocksCount() ? getTotalPagesCount()
				: getCurrentBlockNo() * pagesPerPage);
	}

	/**
	 * 요청한 페이지 번호에 해당하는 데이터의 조회구간의 시작 번호를 반환한다.
	 * 
	 * @return 특정 열을 기준으로 정렬하고 순번을 부여했을 때 조회 구간의 시작 번호
	 */
	public int getBeginIndex() {
		return (pageNo - 1) * rowsPerPage + 1;
	}

	/**
	 * 요청한 페이지 번호에 해당하는 데이터의 조회구간의 끝 번호를 반환한다.
	 * 
	 * @return 특정 열을 기준으로 정렬하고 순번을 부여했을 때 조회 구간의 끝 번호
	 */
	public int getEndIndex() {
		return (pageNo * rowsPerPage);
	}

	@Override
	public String toString() {
		return "Pagination [rowsPerPage=" + rowsPerPage + ", pagesPerPage=" + pagesPerPage + ", pageNo=" + pageNo
				+ ", totalRows=" + totalRows + ", getTotalPagesCount()=" + getTotalPagesCount()
				+ ", getTotalBlocksCount()=" + getTotalBlocksCount() + ", getCurrentBlockNo()=" + getCurrentBlockNo()
				+ ", getBeginPage()=" + getBeginPage() + ", getEndPage()=" + getEndPage() + ", getBeginIndex()="
				+ getBeginIndex() + ", getEndIndex()=" + getEndIndex() + "]";
	}

}
