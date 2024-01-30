package com.team3.rc_pro.common.paging.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardPagingDTO {

	private int region_id ;
	private int category_id ;
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
	public BoardPagingDTO() {
		this.category_id  = 1 ;
		this.region_id = 1 ;
		this.pageNum = 1 ;
		this.rowAmountPerPage = 10 ;

	}

	public BoardPagingDTO(Integer category_id, Integer region_id, Integer pageNum, Integer rowAmountPerPage) {

		if(category_id == null || category_id <= 0)
		{
			this.category_id = 1 ;

		} else {
			this.category_id = category_id ;
		}

		if(region_id == null  || region_id <= 0) {
			this.region_id = 1;

		} else {
			this.region_id = region_id ;
		}

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
