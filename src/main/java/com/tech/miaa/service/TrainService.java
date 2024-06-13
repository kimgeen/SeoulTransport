
package com.tech.miaa.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.xml.sax.SAXException;

import com.tech.miaa.APIdto.SeoulTrain_intoApiDto;
import com.tech.miaa.dao.TrainDao;
import com.tech.miaa.dto.SeoulDistrictDto;
import com.tech.miaa.dto.SeoulSubway_AddressDto;
import com.tech.miaa.dto.Seoul_Train_TotalDto;
import com.tech.miaa.dto.seoulTrain_inDto;
import com.tech.miaa.dto.seoulTrain_outDto;
import com.tech.miaa.seoulApi.TrainApiService;
import com.tech.miaa.serviceInter.TrainServiceInter;

public class TrainService implements TrainServiceInter {
	@Override
	public void train_map_detailsearch(Model model) {
		Map<String, Object> map = model.asMap(); SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		TrainDao dao = sqlSession.getMapper(TrainDao.class);
		
		String District = request.getParameter("District");
		SeoulDistrictDto dto= dao.train_map_detailsearch(District);
		
		model.addAttribute("dto", dto);
	}

	@Override
	public void train_inoutsearch(Model model) {
		Map<String, Object> map = model.asMap(); SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpServletRequest request = (HttpServletRequest) map.get("request"); HttpSession session = null;
		TrainDao dao = sqlSession.getMapper(TrainDao.class);
		
		String train = request.getParameter("place");
		int index=train.indexOf("역");
		String train_name= train.substring(0, index);
		String train_no= train.substring(train.length()-3, train.length());
		
		//세션에 저장
		session = request.getSession(false);
		session.setAttribute("train_name", train_name);
		session.setAttribute("train_no", train_no);
		
		ArrayList<SeoulSubway_AddressDto> addressdto = dao.subway_address(train_name, train_no);
		ArrayList<seoulTrain_inDto> indto = dao.train_insearch(train_name, train_no);
		ArrayList<seoulTrain_outDto> outdto = dao.train_outsearch(train_name, train_no);
		
		if(addressdto.size()<=0) addressdto=dao.subway_address2(train_name);
		if(indto.size()<=0) {
			indto=dao.train_insearch2(train_name); outdto=dao.train_outsearch2(train_name);
		}
		
		model.addAttribute("indto", indto); model.addAttribute("outdto", outdto); model.addAttribute("addressdto", addressdto);
//		model.addAttribute("train_name", train_name); model.addAttribute("train_no", train_no);
	}

	@Override
	public void train_intosearch(Model model) {
		Map<String, Object> map = model.asMap(); SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpServletRequest request = (HttpServletRequest) map.get("request"); HttpSession session = null;
		String train_name = (String) map.get("train_name"); String train_no = (String) map.get("train_no");
		
		if(train_no.equals("1호선")) train_no="1001";
		if(train_no.equals("2호선")) train_no="1002";
		if(train_no.equals("3호선")) train_no="1003";
		if(train_no.equals("4호선")) train_no="1004";
		if(train_no.equals("5호선")) train_no="1005";
		if(train_no.equals("6호선")) train_no="1006";
		if(train_no.equals("7호선")) train_no="1007";
		if(train_no.equals("8호선")) train_no="1008";
		if(train_no.equals("9호선")) train_no="1009";

		ArrayList<SeoulTrain_intoApiDto> intoDto=null;
		try {
			intoDto = TrainApiService.getDto(train_name,train_no);
		} catch (IOException e) {e.printStackTrace();
		} catch (ParserConfigurationException e) {e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();}
		
		for (int i = 0; i < intoDto.size(); i++) {
			if(intoDto.get(i).getSubwayId().equals("1001")) intoDto.get(i).setSubwayId("1호선");
			else if(intoDto.get(i).getSubwayId().equals("1002")) intoDto.get(i).setSubwayId("2호선");
			else if(intoDto.get(i).getSubwayId().equals("1003")) intoDto.get(i).setSubwayId("3호선");
			else if(intoDto.get(i).getSubwayId().equals("1004")) intoDto.get(i).setSubwayId("4호선");
			else if(intoDto.get(i).getSubwayId().equals("1005")) intoDto.get(i).setSubwayId("5호선");
			else if(intoDto.get(i).getSubwayId().equals("1006")) intoDto.get(i).setSubwayId("6호선");
			else if(intoDto.get(i).getSubwayId().equals("1007")) intoDto.get(i).setSubwayId("7호선");
			else if(intoDto.get(i).getSubwayId().equals("1008")) intoDto.get(i).setSubwayId("8호선");
			else if(intoDto.get(i).getSubwayId().equals("1009")) intoDto.get(i).setSubwayId("9호선");
			else if(intoDto.get(i).getSubwayId().equals("1061")) intoDto.get(i).setSubwayId("중앙선");
			else if(intoDto.get(i).getSubwayId().equals("1063")) intoDto.get(i).setSubwayId("경의중앙선");
			else if(intoDto.get(i).getSubwayId().equals("1065")) intoDto.get(i).setSubwayId("공항철도");
			else if(intoDto.get(i).getSubwayId().equals("1067")) intoDto.get(i).setSubwayId("경춘선");
			else if(intoDto.get(i).getSubwayId().equals("1075")) intoDto.get(i).setSubwayId("수의분당선");
			else if(intoDto.get(i).getSubwayId().equals("1077")) intoDto.get(i).setSubwayId("신분당선");
			else if(intoDto.get(i).getSubwayId().equals("1092")) intoDto.get(i).setSubwayId("우이신설선");
			else if(intoDto.get(i).getSubwayId().equals("1093")) intoDto.get(i).setSubwayId("서해선");
			else if(intoDto.get(i).getSubwayId().equals("1081")) intoDto.get(i).setSubwayId("경강선");
			else if(intoDto.get(i).getSubwayId().equals("1032")) intoDto.get(i).setSubwayId("GTX-A");
		}
//		for (int j = 0; j < intoDto.size(); j++) {
//			if(!intoDto.get(j).getSubwayId().equals(train_no)) intoDto.remove(j);
//		}
		
		model.addAttribute("intoDto", intoDto);
	}

	@Override
	public void train_county_total(Model model) {
		Map<String, Object> map = model.asMap(); SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		TrainDao dao = sqlSession.getMapper(TrainDao.class);
		
		ArrayList<Seoul_Train_TotalDto> dto = dao.train_county_total();
		for (int i = 0; i < dto.size(); i++) {
			System.out.println(dto.get(i).getCounty_name());
			System.out.println(dto.get(i).getTotal());
		}
		model.addAttribute("dto", dto);
	}
}