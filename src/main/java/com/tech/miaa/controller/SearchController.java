package com.tech.miaa.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.xml.sax.SAXException;

import com.tech.miaa.APIdto.LoadSearchBusApiDto;
import com.tech.miaa.APIdto.LoadSearchTrainApiDto;
import com.tech.miaa.seoulApi.LoadSearchAPIService;

@Controller
public class SearchController {
	@Autowired
	private SqlSession sqlSession;
	private LoadSearchAPIService apiService;
	
	@RequestMapping("bus_search_load_map")
	public String search_load__map(){
		return "searchs.searchBus_map_page.경로 검색.2";
	}
	@RequestMapping("train_search_load_map")
	public String train_search_load_map(){
		return "searchs.searchtrain_map_page.경로 검색.2";
	}
	
	@RequestMapping("bus_search_load")
	public String bus_search_load(HttpServletRequest request, Model model) throws IOException, ParserConfigurationException, SAXException{
		String values1= request.getParameter("values1"); String values2= request.getParameter("values2");
		int index1=values1.indexOf(","); int index2=values1.indexOf(")");
		int index3=values2.indexOf(","); int index4=values2.indexOf(")");
		
		String values1_ysize=values1.substring(1, index1); String values1_xsize=values1.substring(index1+2, index2);
		String values2_ysize=values2.substring(1, index3); String values2_xsize=values2.substring(index3+2, index4);
		ArrayList<LoadSearchBusApiDto> dtos=apiService.LoadSearchBus(values1_xsize,values1_ysize,values2_xsize,values2_ysize);
		int count=0;
		if(dtos.size()>0) {
			for (int i = 0; i < dtos.size(); i++) {
				if(i>0) {
					if(dtos.get(i-1).getTname().contains(dtos.get(i).getFname())||dtos.get(i).getFname().contains(dtos.get(i-1).getTname())) {
						dtos.get(i-1).setRouteId2(dtos.get(i).getRouteId());
						dtos.get(i-1).setRouteNm2(dtos.get(i).getRouteNm());
						dtos.get(i-1).setTname2(dtos.get(i).getTname());
						dtos.get(i-1).setTx2(dtos.get(i).getTx());
						dtos.get(i-1).setTy2(dtos.get(i).getTy());
						dtos.remove(i);
						count=1;
						if(dtos.size()>(i) && dtos.get(i-1).getTname2()!="") {
							if(dtos.get(i-1).getTname2().contains(dtos.get(i).getFname())||dtos.get(i).getFname().contains(dtos.get(i-1).getTname2())) {
								dtos.get(i-1).setRouteId3(dtos.get(i).getRouteId());
								dtos.get(i-1).setRouteNm3(dtos.get(i).getRouteNm());
								dtos.get(i-1).setTname3(dtos.get(i).getTname());
								dtos.get(i-1).setTx3(dtos.get(i).getTx());
								dtos.get(i-1).setTy3(dtos.get(i).getTy());
								dtos.remove(i);
								count=2;
							}
						}
					}
				}
			}
		}
		model.addAttribute("dtos", dtos); model.addAttribute("count", count);
		
		return "searchs.searchBus_List.경로 검색 결과.2";
	}
	@RequestMapping("train_search_load")
	public String train_search_load(HttpServletRequest request, Model model) throws IOException, ParserConfigurationException, SAXException{
		String values1= request.getParameter("values1"); String values2= request.getParameter("values2");
		int index1=values1.indexOf(","); int index2=values1.indexOf(")");
		int index3=values2.indexOf(","); int index4=values2.indexOf(")");
		String values1_ysize=values1.substring(1, index1); String values1_xsize=values1.substring(index1+2, index2);
		String values2_ysize=values2.substring(1, index3); String values2_xsize=values2.substring(index3+2, index4);
		ArrayList<LoadSearchTrainApiDto> dtos=apiService.LoadSearchTrain(values1_xsize, values1_ysize, values2_xsize, values2_ysize);
		int count=0;
		if(dtos.size()>0) {
			for (int i = 0; i < dtos.size(); i++) {
				if(i>0) {
					if(dtos.get(i-1).getTname().contains(dtos.get(i).getFname())) {
						dtos.get(i-1).setRouteNm2(dtos.get(i).getRouteNm());
						dtos.get(i-1).setTname2(dtos.get(i).getTname());
						dtos.remove(i);
						count=1;
						if(dtos.size()>(i) && dtos.get(i).getTname2()!="") {
							if(dtos.get(i-1).getTname2().contains(dtos.get(i).getFname())) {
								dtos.get(i-1).setRouteNm3(dtos.get(i).getRouteNm());
								dtos.get(i-1).setTname3(dtos.get(i).getTname());
								dtos.remove(i);
								count=2;
							}
						}
					}
					
				}
			}
		}
		model.addAttribute("dtos", dtos); model.addAttribute("count", count);
		return "searchs.searchTrain_List.경로 검색 결과.2";
	}
	
}
