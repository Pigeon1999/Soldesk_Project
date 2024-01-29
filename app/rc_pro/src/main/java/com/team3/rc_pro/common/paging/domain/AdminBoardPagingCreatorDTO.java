package com.team3.rc_pro.common.paging.domain;


import java.util.List;

import com.team3.rc_pro.domain.BoardVO;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class AdminBoardPagingCreatorDTO {

	private AdminBoardPagingDTO adminboardPaging ;

	private int startPagingNum ;
	private int endPagingNum ;
	private boolean prev ;
	private boolean next ;
	private long rowTotal ; // 행의 총 개수
	private int pagingNumCnt ; //기본 10
	private int lastPageNum ;
	private List<BoardVO> boardList ;

	public AdminBoardPagingCreatorDTO(long rowTotal,
			   					AdminBoardPagingDTO adminboardPaging,
			   					List<BoardVO> boardList) {


		this.rowTotal = rowTotal ;
		this.adminboardPaging = adminboardPaging ;
		this.boardList = boardList ;
		this.pagingNumCnt = 10;


		//계산된 끝 페이징 번호:
		this.endPagingNum = (int) Math.ceil((double) adminboardPaging.getPageNum()/this.pagingNumCnt) * this.pagingNumCnt ;

		//계산된 시작 페이징 번호:
		this.startPagingNum = this.endPagingNum - (this.pagingNumCnt -1) ;

		//총 페이지 수 = 맨 마지막 페이지번호
		this.lastPageNum = (int) Math.ceil((double)this.rowTotal / this.adminboardPaging.getRowAmountPerPage()) ;

		//맨 마지막 페이지번호를 endPagingNum에 대입
		if(this.lastPageNum < this.endPagingNum) {
			this.endPagingNum = this.lastPageNum ;
		}

		//이전 버튼 표시(true) 여부
		this.prev = this.startPagingNum > 1 ;

		//다음 버튼 표시(true) 여부
		this.next = this.endPagingNum < this.lastPageNum ;

		System.out.println("전달된 페이징 기본데이터-BoardPagingDTO: " + this.adminboardPaging.toString());
		System.out.println("시작 페이징번호: " + this.startPagingNum);
		System.out.println("끝 페이징번호: " + this.endPagingNum);
		System.out.println("이전버튼 표시 여부: " + this.prev);
		System.out.println("다음버튼 표시 여부: " + this.next);
		System.out.println("마지막 페이지 번호: " + this.lastPageNum);
		System.out.println("표시할 데이터: " + this.boardList);
	}

}
