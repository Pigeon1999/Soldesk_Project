package com.team3.rc_pro.common.paging.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminBoardPagingDTO {

	private Integer region_id ;
	private Integer category_id ;
	private int pageNum ;
	private int rowAmountPerPage ;
	private String scope ;		//검색범위(scope - post_title: T, post_content: C, user_num : W)
	private String keyword ;	//검색어

	//@DateTimeFormat(pattern = "yyyy-MM-dd") //java.util.Date
	private String beginDate ;

	//@DateTimeFormat(pattern = "yyyy-MM-dd") //java.util.Date
	private String endDate;

	public String[] getScopeArray() {
		return scope == null ? new String[] {} : scope.split("") ; //["T", "C", "W"]

	}

	//기본 생성자 테스트
	public AdminBoardPagingDTO() {

		this.pageNum = 1 ;
		this.rowAmountPerPage = 10 ;

	}

	public AdminBoardPagingDTO(Integer pageNum, Integer rowAmountPerPage) {


		if(pageNum == null || pageNum <= 0)
		{
			this.pageNum = 1 ;

		} else {
			this.pageNum = pageNum ;
		}

		if(rowAmountPerPage == null) {
			this.rowAmountPerPage = 10;

		} else {
			this.rowAmountPerPage = rowAmountPerPage ;
		}

	}
}
