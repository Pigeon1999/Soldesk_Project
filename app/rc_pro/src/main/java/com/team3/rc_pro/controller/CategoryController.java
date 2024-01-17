package com.team3.rc_pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CategoryController {
	
	// 관철동
	@GetMapping("/Gwancheol/FreePost")
	public String GwancheolFreePost() {
		return "/region/Gwancheol/FreePost";
	}
	
	@GetMapping("/Gwancheol/PromotionPost")
	public String GwancheolPromotionPost() {
		return "/region/Gwancheol/PromotionPost";
	}
	
	@GetMapping("/Gwancheol/NewsPost")
	public String GwancheolNewsPost() {
		return "/region/Gwancheol/NewsPost";
	}
	
	// 인사동
	@GetMapping("/Insa/FreePost")
	public String InsaFreePost() {
		return "/region/Insa/FreePost";
	}
	
	@GetMapping("/Insa/PromotionPost")
	public String InsaPromotionPost() {
		return "/region/Insa/PromotionPost";
	}
	
	@GetMapping("/Insa/NewsPost")
	public String InsaNewsPost() {
		return "/region/Insa/NewsPost";
	}
	
	// 청진동
	@GetMapping("/Cheongjin/FreePost")
	public String CheongjinFreePost() {
		return "/region/Cheongjin/FreePost";
	}
	
	@GetMapping("/Cheongjin/PromotionPost")
	public String CheongjinPromotionPost() {
		return "/region/Cheongjin/PromotionPost";
	}
	
	@GetMapping("/Cheongjin/NewsPost")
	public String CheongjinNewsPost() {
		return "/region/Cheongjin/NewsPost";
	}

	//공평동
	@GetMapping("/Gongpyeong/FreePost")
	public String GongpyeongFreePost() {
		return "/region/Gongpyeong/FreePost";
	}
	
	@GetMapping("/Gongpyeong/PromotionPost")
	public String GongpyeongPromotionPost() {
		return "/region/Gongpyeong/PromotionPost";
	}
	
	@GetMapping("/Gongpyeong/NewsPost")
	public String GongpyeongNewsPost() {
		return "/region/Gongpyeong/NewsPost";
	}
	
	//관수동
	@GetMapping("/Gwansu/FreePost")
	public String GwansuFreePost() {
		return "/region/Gwansu/FreePost";
	}
	
	@GetMapping("/Gwansu/PromotionPost")
	public String GwansuPromotionPost() {
		return "/region/Gwansu/PromotionPost";
	}
	
	@GetMapping("/Gwansu/NewsPost")
	public String GwansuNewsPost() {
		return "/region/Gwansu/NewsPost";
	}
	
	//종로2가
	@GetMapping("/Jongno2ga/FreePost")
	public String Jongno2gaFreePost() {
		return "/region/Jongno2ga/FreePost";
	}
	
	@GetMapping("/Jongno2ga/PromotionPost")
	public String Jongno2gaPromotionPost() {
		return "/region/Jongno2ga/PromotionPost";
	}
	
	@GetMapping("/Jongno2ga/NewsPost")
	public String Jongno2gaNewsPost() {
		return "/region/Jongno2ga/NewsPost";
	}

	//삼각동
	@GetMapping("/Samgak/FreePost")
	public String SamgakFreePost() {
		return "/region/Samgak/FreePost";
	}
	
	@GetMapping("/Samgak/PromotionPost")
	public String SamgakPromotionPost() {
		return "/region/Samgak/PromotionPost";
	}
	
	@GetMapping("/Samgak/NewsPost")
	public String SamgakNewsPost() {
		return "/region/Samgak/NewsPost";
	}

	//서린동
	@GetMapping("/Seorin/FreePost")
	public String SeorinFreePost() {
		return "/region/Seorin/FreePost";
	}
	
	@GetMapping("/Seorin/PromotionPost")
	public String SeorinPromotionPost() {
		return "/region/Seorin/PromotionPost";
	}
	
	@GetMapping("/Seorin/NewsPost")
	public String SeorinNewsPost() {
		return "/region/Seorin/NewsPost";
	}
	
	/*
	// 코드 중복 제거 연구 중
	@GetMapping("/region/{postType}/FreePost")
	public String freePost(@PathVariable String postType) {
	    return "/region/" + postType +"/FreePost";
	}

	@GetMapping("/region/{postType}/PromotionPost")
	public String promotionPost(@PathVariable String region, @PathVariable String postType) {
	    return String.format("/region/%s/PromotionPost", region);
	}

	@GetMapping("/region/{postType}/NewsPost")
	public String newsPost(@PathVariable String region, @PathVariable String postType) {
	    return String.format("/region/%s/NewsPost", region);
	}
	*/

}
