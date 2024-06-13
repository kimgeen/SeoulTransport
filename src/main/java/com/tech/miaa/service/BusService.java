
package com.tech.miaa.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.xml.sax.SAXException;

import com.tech.miaa.APIdto.SeoulBusArriveApiDto;
import com.tech.miaa.APIdto.SeoulBusLoadApiDto;
import com.tech.miaa.APIdto.SeoulBusLoadStationApiDto;
import com.tech.miaa.APIdto.SeoulBusStationApiDto;
import com.tech.miaa.dao.BusDao;
import com.tech.miaa.dto.SeoulBusStationDto;
import com.tech.miaa.dto.Seoul_Bus_TotalDto;
import com.tech.miaa.seoulApi.BusAPIService;
import com.tech.miaa.serviceInter.BusServiceInter;
import com.tech.miaa.vopage.PageVO;

public class BusService implements BusServiceInter {
	
	@Override
	public void bus_detailsearch(Model model) {
		Map<String, Object> map = model.asMap(); SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String District = request.getParameter("District");
		BusDao dao_bus = sqlSession.getMapper(BusDao.class);
		
		PageVO pageVO = new PageVO();
		int totalCount=dao_bus.bus_detailsearchAll(District);
		String strPage=request.getParameter("page");
		if(strPage==null) strPage="1";
		int page=Integer.parseInt(strPage);
		pageVO.setPage(page); pageVO.pageCalculate(totalCount);
		int rowStart=pageVO.getRowStart(); int rowEnd=pageVO.getRowEnd();
		
		ArrayList<SeoulBusStationDto> dtos = dao_bus.bus_detailsearch(District,rowStart,rowEnd);
		for (int i = 0; i < dtos.size(); i++) {
			if(i!=0) {
				for(int j=0;j < dtos.size(); j++) {
					if(dtos.get(i).getStation_name()==dtos.get(j).getStation_name()&&dtos.get(i).getStation_type()==dtos.get(j).getStation_type()
							&&dtos.get(i).getLoad_count()==dtos.get(j).getLoad_count()&&dtos.get(i).getX_size()==dtos.get(j).getX_size()) {
						dtos.remove(dtos.get(j));
					}
				}
			}
		}
		model.addAttribute("dtos", dtos);
		model.addAttribute("totalCount", totalCount); model.addAttribute("pageVo", pageVO);
	}

	@Override
	public void bus_station_detailsearch(Model model) throws IOException, ParserConfigurationException, SAXException {
		Map<String, Object> map = model.asMap(); SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String Station_name=request.getParameter("station_name");
		BusAPIService apiService = new BusAPIService();
		
		//api에서 정류장 정보 및 정류장 id가져오기
		ArrayList<SeoulBusStationApiDto> dtos = apiService.getBusStation(Station_name);
		//api에서 정류장의 노선정보 받아오기
		ArrayList<SeoulBusLoadApiDto> dtos2 = apiService.getBusLoad(dtos.get(0).getArsId());
		//api에서 버스 도착시간 정보 받아오기
		ArrayList<SeoulBusArriveApiDto> dtos3= apiService.getBusArrive(dtos.get(0).getArsId());
		
		for (int i = 0; i < dtos3.size(); i++) {
			for (int j = 0; j < dtos2.size(); j++) {
				if(dtos3.get(i).getBusRouteId().equals(dtos2.get(j).getBusRouteId()) && dtos3.get(i).getBusRouteAbrv().equals(dtos2.get(j).getBusRouteNm())) {
					dtos2.get(j).setAdirection(dtos3.get(i).getAdirection());
					dtos2.get(j).setArrmsg1(dtos3.get(i).getArrmsg1());
				}
			}
		}
		System.out.println("서비스아웃");
		model.addAttribute("dtos", dtos); model.addAttribute("dtos2", dtos2);
	}
	
	@Override
	public void bus_Load_detailsearch(Model model) throws IOException, ParserConfigurationException, SAXException {
		Map<String, Object> map = model.asMap(); SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String busRouteId = request.getParameter("busRouteId"); String busRouteNm = request.getParameter("busRouteNm");
		String x_size=request.getParameter("x_size"); String y_size=request.getParameter("y_size");
		
		model.addAttribute("x_size", x_size); model.addAttribute("y_size", y_size);
		model.addAttribute("busRouteId", busRouteId); model.addAttribute("busRouteNm", busRouteNm);
	}

	@Override
	public ArrayList<Seoul_Bus_TotalDto> get_county_total(Model model) {
		Map<String, Object> map = model.asMap(); SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		BusDao dao_bus = sqlSession.getMapper(BusDao.class);
		ArrayList<Seoul_Bus_TotalDto> dtos=dao_bus.bus_get_county_total();
		System.out.println(dtos.get(0).getBusstation_county());
		return dtos;
	}
}