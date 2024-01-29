package com.team3.rc_pro.controller;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team3.rc_pro.common.paging.domain.AdminBoardPagingCreatorDTO;
import com.team3.rc_pro.common.paging.domain.AdminBoardPagingDTO;
import com.team3.rc_pro.common.paging.domain.AdminPagingCreatorDTO;
import com.team3.rc_pro.common.paging.domain.AdminPagingDTO;
import com.team3.rc_pro.domain.AuthorityInfoVO;
import com.team3.rc_pro.domain.BoardVO;
import com.team3.rc_pro.service.AdminService;

@Controller
public class AdminController {

	
	private AdminService adminService ;
	
	public AdminController(AdminService adminService) {
		this.adminService = adminService ;
		System.out.println("AdminController의 모든 필드 초기화 생성자 입니다.");
	}
	
	
	//관리자 페이지
	@GetMapping("/admin")
	public String adminPage(AdminPagingDTO adminPaging, Model model) {
        // admin 권한을 가진 사용자만 해당 페이지에 접근할 수 있도록 체크
        SecurityContextHolder.getContext().getAuthentication().getAuthorities().stream()
                .filter(a -> a.getAuthority().equals("admin"))
                .findFirst()
                .orElseThrow(() -> new AccessDeniedException("Access denied"));
        
        AdminPagingCreatorDTO adminPagingCreator = adminService.getAdminUserList(adminPaging) ;
		System.out.println("컨트롤러에 전달된 adminPagingCreator: \n" + adminPagingCreator);

		model.addAttribute("adminPagingCreator", adminPagingCreator) ;
        
        
        // 권한 체크를 통과한 경우에만 해당 페이지로 이동
        return "/board/admin";
	}
        
    //권한 수정 Get /admin/modify
	@GetMapping("/admin/modify")
	public String modifyAuth(AuthorityInfoVO authInfo,  RedirectAttributes redirectAttr) {
		// admin 권한을 가진 사용자만 해당 페이지에 접근할 수 있도록 체크
        SecurityContextHolder.getContext().getAuthentication().getAuthorities().stream()
                .filter(a -> a.getAuthority().equals("admin"))
                .findFirst()
                .orElseThrow(() -> new AccessDeniedException("Access denied"));
        
		boolean modifyResult = adminService.modifyUserAuth(authInfo) ;
		
		if(modifyResult) {
			redirectAttr.addAttribute("result", "successModify") ;

		} else {
			redirectAttr.addAttribute("result", "failModify") ;
    		}
   
    		
    	return "redirect:/admin" ;
	}
	
	@GetMapping("/admin_board")
	public String adminBoardPage(AdminBoardPagingDTO adminboardPaging, Model model) {
        // admin 권한을 가진 사용자만 해당 페이지에 접근할 수 있도록 체크
        SecurityContextHolder.getContext().getAuthentication().getAuthorities().stream()
                .filter(a -> a.getAuthority().equals("admin"))
                .findFirst()
                .orElseThrow(() -> new AccessDeniedException("Access denied"));
        
        AdminBoardPagingCreatorDTO adminboardpagingCreator = adminService.getAdminBoardList(adminboardPaging) ;
		System.out.println("컨트롤러에 전달된 adminboardPagingCreator: \n" + adminboardpagingCreator);

		model.addAttribute("adminboardpagingCreator", adminboardpagingCreator) ;

        // 권한 체크를 통과한 경우에만 해당 페이지로 이동
        return "/board/admin_board";
	}
	
	@GetMapping("/admin_board/modify")
	public String adminBoardModify(BoardVO board,
								   RedirectAttributes redirectAttr,
								   AdminBoardPagingDTO adminboardPaging) {
        // admin 권한을 가진 사용자만 해당 페이지에 접근할 수 있도록 체크
        SecurityContextHolder.getContext().getAuthentication().getAuthorities().stream()
                .filter(a -> a.getAuthority().equals("admin"))
                .findFirst()
                .orElseThrow(() -> new AccessDeniedException("Access denied"));
        
        boolean modifyResult = adminService.modifyBoardCategoryRegion(board) ;
		
		if(modifyResult) {
			redirectAttr.addAttribute("result", "successModify") ;

		} else {
			redirectAttr.addAttribute("result", "failModify") ;
		}

		redirectAttr.addAttribute("pageNum", adminboardPaging.getPageNum());
		redirectAttr.addAttribute("rowAmountPerPage", adminboardPaging.getRowAmountPerPage());
		redirectAttr.addAttribute("scope", adminboardPaging.getScope());
		redirectAttr.addAttribute("keyword", adminboardPaging.getKeyword());
		

        // 권한 체크를 통과한 경우에만 해당 페이지로 이동
        return "redirect:/admin_board";
	}
	
	@GetMapping("/admin_board/remove")
	public String adminBoardRemove(long post_id,
								   RedirectAttributes redirectAttr,
								   AdminBoardPagingDTO adminboardPaging) {
        // admin 권한을 가진 사용자만 해당 페이지에 접근할 수 있도록 체크
        SecurityContextHolder.getContext().getAuthentication().getAuthorities().stream()
                .filter(a -> a.getAuthority().equals("admin"))
                .findFirst()
                .orElseThrow(() -> new AccessDeniedException("Access denied"));
        
        boolean modifyResult = adminService.modifyPosthide(post_id) ;
		
		if(modifyResult) {
			redirectAttr.addAttribute("result", "successModify") ;

		} else {
			redirectAttr.addAttribute("result", "failModify") ;
		}

		redirectAttr.addAttribute("pageNum", adminboardPaging.getPageNum());
		redirectAttr.addAttribute("rowAmountPerPage", adminboardPaging.getRowAmountPerPage());
		redirectAttr.addAttribute("scope", adminboardPaging.getScope());
		redirectAttr.addAttribute("keyword", adminboardPaging.getKeyword());
		

        // 권한 체크를 통과한 경우에만 해당 페이지로 이동
        return "redirect:/admin_board";
	}
	
        
}

