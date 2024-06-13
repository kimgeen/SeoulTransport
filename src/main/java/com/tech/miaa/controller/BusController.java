package com.tech.miaa.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xml.sax.SAXException;

import com.tech.miaa.APIdto.SeoulBusLoadLocationApiDto;
import com.tech.miaa.APIdto.SeoulBusLoadStationApiDto;
import com.tech.miaa.dto.Seoul_Bus_TotalDto;
import com.tech.miaa.seoulApi.BusAPIService;
import com.tech.miaa.service.BusService;
import com.tech.miaa.serviceInter.BusServiceInter;

@Controller
public class BusController {
	@Autowired
	private SqlSession sqlSession;

	BusServiceInter busService;
	
	//행정구역 선택 지도 페이지
	@RequestMapping("bus_map_search")
	public String train_map_search(){
		return "Bus.bus_map_page.버스위치정보.2";
	}
	
	//선택 행정구역의 버스정류소 출력 페이지
	@RequestMapping("bus_Station_search")
	public String bus_map_detailsearch(HttpServletRequest request, Model model){
		model.addAttribute("sqlSession", sqlSession); model.addAttribute("request", request);
		busService = new BusService();
		busService.bus_detailsearch(model);
		return "Bus.bus_Station_search.버스위치정보.2";
	}
	//버스정류소의 상세정보 페이지
	@RequestMapping("bus_station_detailsearch")
	public String bus_station_detailsearch(HttpServletRequest request, Model model) throws IOException, ParserConfigurationException, SAXException{
		model.addAttribute("sqlSession", sqlSession); model.addAttribute("request", request);
		busService = new BusService();
		busService.bus_station_detailsearch(model);
		return "Bus.bus_station_detailsearch.버스위치정보.2";
	}
	
	@RequestMapping("bus_Load_detailsearch")
	public String bus_Load_detailsearch(HttpServletRequest request, Model model) throws IOException, ParserConfigurationException, SAXException{
		model.addAttribute("sqlSession", sqlSession); model.addAttribute("request", request);
		busService = new BusService();
		busService.bus_Load_detailsearch(model);
		return "Bus.bus_Load_detailsearch.버스위치정보.2";
	}
	
	@ResponseBody
	@RequestMapping("getLoad")
	public ArrayList<SeoulBusLoadLocationApiDto> getLoad(HttpServletRequest request, Model model) throws IOException, ParserConfigurationException, SAXException{
		model.addAttribute("sqlSession", sqlSession); model.addAttribute("request", request);
		String busRouteId = request.getParameter("busRouteId");
		
		BusAPIService apiService = new BusAPIService();
		ArrayList<SeoulBusLoadLocationApiDto> dtos= apiService.getBusLoadLocation(busRouteId);
		
		return dtos;
	}
	@ResponseBody
	@RequestMapping("getStation")
	public ArrayList<SeoulBusLoadStationApiDto> getStation(HttpServletRequest request, Model model) throws IOException, ParserConfigurationException, SAXException{
		model.addAttribute("sqlSession", sqlSession); model.addAttribute("request", request);
		String busRouteId = request.getParameter("busRouteId");
		
		BusAPIService apiService = new BusAPIService();
		ArrayList<SeoulBusLoadStationApiDto> dtos=apiService.getBusLoadStation(busRouteId);
		
		return dtos;
	}
	
	@RequestMapping("bus_county_total")
	public String bus_county_total(){
		return "Bus.bus_county_total.버스위치정보.2";
	}
	
	@ResponseBody
	@RequestMapping("get_county_total")
	public ArrayList<Seoul_Bus_TotalDto> get_county_total(Model model){
		model.addAttribute("sqlSession", sqlSession);
		busService = new BusService();
		ArrayList<Seoul_Bus_TotalDto> dtos = busService.get_county_total(model);

		return dtos;
	}
}
