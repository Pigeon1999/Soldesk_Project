package com.team3.rc_pro.common.paging.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminPagingDTO {

	private int pageNum ;
	private int rowAmountPerPage ;
	private String scope ;		//검색범위(scope - user_id: I, user_name: N, user_address : A, user_authority: U)
	private String keyword ;	//검색어


	public String[] getScopeArray() {
		return scope == null ? new String[] {} : scope.split("") ; //["I", "N", "A", "U"]

	}

	//기본 생성자 테스트
	public AdminPagingDTO() {
		this.pageNum = 1 ;
		this.rowAmountPerPage = 10 ;

	}

	public AdminPagingDTO( Integer pageNum, Integer rowAmountPerPage) {


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
