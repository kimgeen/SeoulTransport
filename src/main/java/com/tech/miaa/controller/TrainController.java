package com.tech.miaa.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.tech.miaa.service.TrainService;
import com.tech.miaa.serviceInter.TrainServiceInter;

@Controller
public class TrainController {
	@Autowired
	private SqlSession sqlSession;

	TrainServiceInter trainServiceInter;
	
	@RequestMapping("train_map_search")
	public String train_map_search(){
		return "Train.map_page.지하철위치정보.2";
	}
	@RequestMapping("train_map_detailsearch")
	public String missing_ani_write(HttpServletRequest request, Model model) {
		model.addAttribute("sqlSession", sqlSession); model.addAttribute("request", request);
		
		trainServiceInter=new TrainService();
		trainServiceInter.train_map_detailsearch(model);
		
		return "Train.map_detailpage.구역별 지하철위치정보.2";
	}
	@RequestMapping("train_inoutsearch")
	public String train_inoutsearch(HttpServletRequest request, Model model) {
		model.addAttribute("sqlSession", sqlSession); model.addAttribute("request", request);
		
		trainServiceInter=new TrainService();
		trainServiceInter.train_inoutsearch(model);
		
		return "Train_detail.train_inout.지하철 시간대 별 탑승객 추이.2";
	}
	@RequestMapping("train_into_search")
	public String train_into_search(HttpServletRequest request, Model model, @SessionAttribute(name = "train_name", required = false) String train_name,
			@SessionAttribute(name = "train_no", required = false) String train_no) {
		model.addAttribute("sqlSession", sqlSession); model.addAttribute("request", request);
		model.addAttribute("train_name", train_name); model.addAttribute("train_no", train_no);
		trainServiceInter=new TrainService();
		trainServiceInter.train_intosearch(model);
		
		return "Train_detail.train_into.지하철 실시간 도착정보.2";
	}
	@RequestMapping("train_county_total")
	public String train_county_total(Model model) {
		model.addAttribute("sqlSession", sqlSession);
		trainServiceInter=new TrainService();
		trainServiceInter.train_county_total(model);
		
		return "Train.train_county_total.자치구 별 탑승자.2";
	}
}
