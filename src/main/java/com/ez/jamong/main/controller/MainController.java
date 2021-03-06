package com.ez.jamong.main.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.jamong.ads.model.AdsService;
import com.ez.jamong.categoryl.model.CategoryLService;
import com.ez.jamong.categoryl.model.CategoryLVO;
import com.ez.jamong.categorym.model.CategoryMService;
import com.ez.jamong.categorym.model.CategoryMVO;
import com.ez.jamong.pay.model.PayService;

@Controller
@RequestMapping("/main")
public class MainController {
	private Logger logger=LoggerFactory.getLogger(MainController.class);
	@Autowired CategoryLService categorylService;
	@Autowired CategoryMService categoryMService;
	@Autowired AdsService adsService;
	@Autowired PayService payService;
	
	@RequestMapping("/index_main.do")
	public String main_view(Model model) {
		logger.info("메인 페이지");
		//카테고리 영역
		List<CategoryLVO> list=categorylService.selectCategorylAll();
		
		//전문가 광고 영역
		List<Map<String, Object>> adsList=adsService.selectShowAds();
		Map<String,Object> map = payService.selectTopSellUser();
		logger.info("전문가 광고 영역 adsList={}",adsList.size());
		logger.info("최고 판매자 map={}",map);
		model.addAttribute("list",list);
		model.addAttribute("adsList",adsList);
		model.addAttribute("map",map);
		return "main/index_main";
	}
	
	@RequestMapping(value = "showCategoryMimg.do", method = RequestMethod.GET)
	public String showCategoryMimg(@RequestParam(defaultValue = "0") int no, Model model) {
		logger.info("카테고리(중) 목록 파라미터 categoryLNo={}", no);
		List<CategoryMVO> list=categoryMService.selectCategoryM(no);
		logger.info("카테고리(중) 목록 리스트 list.size={}",list.size());
		model.addAttribute("list",list);
		return "main/incs/categoryMList";
	}
	
	@RequestMapping("/showCategoryL.do")
	public String showCategoryL(Model model){
		logger.info("카테고리 (대)요청");
		List<CategoryLVO> list = categorylService.selectCategorylAll();
		logger.info("카테고리(대) 목록 list.size={}",list.size());
		model.addAttribute("list",list);
		return "main/incs/showCategoryL";
	}
	
	@RequestMapping("/showCategoryM.do")
	@ResponseBody
	public List<CategoryMVO> showCategoryM(@RequestParam int no) {
		List<CategoryMVO> list=categoryMService.selectCategoryM(no);
		return list;
	}
	
	@RequestMapping("/categoryList_bottom.do")
	public String bottomCategoryL(Model model){
		List<CategoryLVO> list = categorylService.selectCategorylAll();
		logger.info("카테고리(대) 목록 list.size={}",list.size());
		model.addAttribute("btCatList", list);
		return "main/incs/categoryList_bottom";
	}
}
