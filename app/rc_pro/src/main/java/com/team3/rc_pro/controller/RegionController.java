package com.team3.rc_pro.controller;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.team3.rc_pro.service.PostInfoService;

import lombok.Setter;

@Controller
public class RegionController {
	
	@Setter(onMethod_ = @Autowired)
	private PostInfoService postinfoService;
	
	@GetMapping("/Gwancheol")
	public String Gwancheol(Model model) {
		model.addAttribute("freePostInfo", postinfoService.getFreePostInfo());
		model.addAttribute("promtionPostInfo", postinfoService.getPromotionPostInfo());
		model.addAttribute("newsPostInfo", postinfoService.getNewsPostInfo());
		return "/region/Gwancheol/Gwancheol";
	}
	
	@GetMapping("/Insa")
	public String Insa(Model model) {
		model.addAttribute("freePostInfo", postinfoService.getFreePostInfo());
		model.addAttribute("promtionPostInfo", postinfoService.getPromotionPostInfo());
		model.addAttribute("newsPostInfo", postinfoService.getNewsPostInfo());
		return "/region/Insa/Insa";
	}
	
	@GetMapping("/Cheongjin")
	public String Cheongjin(Model model) {
		model.addAttribute("freePostInfo", postinfoService.getFreePostInfo());
		model.addAttribute("promtionPostInfo", postinfoService.getPromotionPostInfo());
		model.addAttribute("newsPostInfo", postinfoService.getNewsPostInfo());
		return "/region/Cheongjin/Cheongjin";
	}
	
	@GetMapping("/Gongpyeong")
	public String Gongpyeong(Model model) {
		model.addAttribute("freePostInfo", postinfoService.getFreePostInfo());
		model.addAttribute("promtionPostInfo", postinfoService.getPromotionPostInfo());
		model.addAttribute("newsPostInfo", postinfoService.getNewsPostInfo());
		return "/region/Gongpyeong/Gongpyeong";
	}
	
	@GetMapping("/Gwansu")
	public String Gwansu(Model model) {
		model.addAttribute("freePostInfo", postinfoService.getFreePostInfo());
		model.addAttribute("promtionPostInfo", postinfoService.getPromotionPostInfo());
		model.addAttribute("newsPostInfo", postinfoService.getNewsPostInfo());
		return "/region/Gwansu/Gwansu";
	}
	
	@GetMapping("/Jongno2ga")
	public String Jongno2ga(Model model) {
		model.addAttribute("freePostInfo", postinfoService.getFreePostInfo());
		model.addAttribute("promtionPostInfo", postinfoService.getPromotionPostInfo());
		model.addAttribute("newsPostInfo", postinfoService.getNewsPostInfo());
		return "/region/Jongno2ga/Jongno2ga";
	}
	
	@GetMapping("/Samgak")
	public String Samgak(Model model) {
		model.addAttribute("freePostInfo", postinfoService.getFreePostInfo());
		model.addAttribute("promtionPostInfo", postinfoService.getPromotionPostInfo());
		model.addAttribute("newsPostInfo", postinfoService.getNewsPostInfo());
		return "/region/Samgak/Samgak";
	}
	
	@GetMapping("/Seorin")
	public String Seorin(Model model) {
		model.addAttribute("freePostInfo", postinfoService.getFreePostInfo());
		model.addAttribute("promtionPostInfo", postinfoService.getPromotionPostInfo());
		model.addAttribute("newsPostInfo", postinfoService.getNewsPostInfo());
		return "/region/Seorin/Seorin";
	}
}
