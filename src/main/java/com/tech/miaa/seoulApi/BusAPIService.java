package com.tech.miaa.seoulApi;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.tech.miaa.APIdto.SeoulBusArriveApiDto;
import com.tech.miaa.APIdto.SeoulBusLoadApiDto;
import com.tech.miaa.APIdto.SeoulBusLoadLocationApiDto;
import com.tech.miaa.APIdto.SeoulBusLoadStationApiDto;
import com.tech.miaa.APIdto.SeoulBusStationApiDto;

public class BusAPIService {
	private final static String API_KEY = "w2tmpAZfwyKccw%2B1Vax4J81O18cWzYO%2BQweLlYpN4IK1UcE1pizbeLk7RDSg3BMcIfd0D7PECVsLtBnrviDuOA%3D%3D";
	
	//버스정류장 id조회
	public static ArrayList<SeoulBusStationApiDto> getBusStation(String station_name)
			throws IOException, ParserConfigurationException, SAXException {
		StringBuilder urlBuilder = new StringBuilder(
				"http://ws.bus.go.kr/api/rest/stationinfo/getStationByName"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + API_KEY); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("stSrch", "UTF-8") + "="
				+ URLEncoder.encode(station_name, "UTF-8")); /* 정류소명 검색어 */

		DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
		Document doc = documentBuilder.parse(urlBuilder.toString());

		doc.getDocumentElement().normalize();
		NodeList nList = doc.getElementsByTagName("itemList");
		ArrayList<SeoulBusStationApiDto> dtos = new ArrayList<>();
		SeoulBusStationApiDto dto = null;

		for (int temp = 0; temp < nList.getLength(); temp++) {
			Node nNode = nList.item(temp);
			Element eElement = (Element) nNode;
			dto = new SeoulBusStationApiDto();
			dto.setArsId(getTagValue("arsId", eElement));
			dto.setStNm(getTagValue("stNm", eElement));
			dto.setTmX(getTagValue("tmX", eElement));
			dto.setTmY(getTagValue("tmY", eElement));
			dtos.add(dto);
		}
		return dtos;
	}
	
	//버스정류장 버스노선 조회
	public static ArrayList<SeoulBusLoadApiDto> getBusLoad(String arsId)
			throws IOException, ParserConfigurationException, SAXException {
		StringBuilder urlBuilder = new StringBuilder(
				"http://ws.bus.go.kr/api/rest/stationinfo/getRouteByStation"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + API_KEY); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("arsId", "UTF-8") + "=" + URLEncoder.encode(arsId, "UTF-8")); /**/

		DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
		Document doc = documentBuilder.parse(urlBuilder.toString());

		doc.getDocumentElement().normalize();
		NodeList nList = doc.getElementsByTagName("itemList");
		ArrayList<SeoulBusLoadApiDto> dtos = new ArrayList<>();
		SeoulBusLoadApiDto dto = null;
		for (int i = 0; i < nList.getLength(); i++) {
			Node nNode = nList.item(i);
			Element eElement = (Element) nNode;
			dto = new SeoulBusLoadApiDto();
			dto.setBusRouteId(getTagValue("busRouteId", eElement));
			dto.setBusRouteNm(getTagValue("busRouteNm", eElement));
			dto.setStBegin(getTagValue("stBegin", eElement));
			dto.setStEnd(getTagValue("stBegin", eElement));
			dtos.add(dto);
		}

		return dtos;
	}
	
	//버스정류장 버스 도착정보 조회
	public static ArrayList<SeoulBusArriveApiDto> getBusArrive(String arsId)
			throws IOException, ParserConfigurationException, SAXException {
		StringBuilder urlBuilder = new StringBuilder(
				"http://ws.bus.go.kr/api/rest/stationinfo/getStationByUid"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + API_KEY); /* Service Key */
		urlBuilder.append(
				"&" + URLEncoder.encode("arsId", "UTF-8") + "=" + URLEncoder.encode(arsId, "UTF-8")); /* 정류소 번호 */

		DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
		Document doc = documentBuilder.parse(urlBuilder.toString());

		doc.getDocumentElement().normalize();
		NodeList nList = doc.getElementsByTagName("itemList");
		ArrayList<SeoulBusArriveApiDto> dtos = new ArrayList<>();
		SeoulBusArriveApiDto dto = null;

		for (int i = 0; i < nList.getLength(); i++) {
			Node nNode = nList.item(i);
			Element eElement = (Element) nNode;

			dto = new SeoulBusArriveApiDto();
			dto.setAdirection(getTagValue("adirection", eElement));
			dto.setArrmsg1(getTagValue("arrmsg1", eElement));
			dto.setArsId(getTagValue("arsId", eElement));
			dto.setBusRouteAbrv(getTagValue("busRouteAbrv", eElement));
			dto.setBusRouteId(getTagValue("busRouteId", eElement));
			dtos.add(dto);
		}

		return dtos;
	}
	
	//버스노선 경로 조회
	public static ArrayList<SeoulBusLoadLocationApiDto> getBusLoadLocation(String busRouteId)
			throws IOException, ParserConfigurationException, SAXException {
		StringBuilder urlBuilder = new StringBuilder(
				"http://ws.bus.go.kr/api/rest/busRouteInfo/getRoutePath"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + API_KEY); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("busRouteId", "UTF-8") + "="
				+ URLEncoder.encode(busRouteId, "UTF-8")); /* 노선ID */

		DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
		Document doc = documentBuilder.parse(urlBuilder.toString());

		doc.getDocumentElement().normalize();
		NodeList nList = doc.getElementsByTagName("itemList");
		ArrayList<SeoulBusLoadLocationApiDto> dtos = new ArrayList<>();
		SeoulBusLoadLocationApiDto dto = null;

		for (int i = 0; i < nList.getLength(); i++) {
			Node nNode = nList.item(i);
			Element eElement = (Element) nNode;
			dto = new SeoulBusLoadLocationApiDto();
			dto.setGpsX(getTagValue("gpsX", eElement));
			;
			dto.setGpsY(getTagValue("gpsY", eElement));
			dtos.add(dto);
		}
		return dtos;
	}
	
	//버스노선 경로 중 버스정류장 위치조회
	public static ArrayList<SeoulBusLoadStationApiDto> getBusLoadStation(String busRouteId)
			throws IOException, ParserConfigurationException, SAXException {
		StringBuilder urlBuilder = new StringBuilder(
				"http://ws.bus.go.kr/api/rest/busRouteInfo/getStaionByRoute"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + API_KEY); /* Service Key */
		urlBuilder.append(
				"&" + URLEncoder.encode("busRouteId", "UTF-8") + "=" + URLEncoder.encode(busRouteId, "UTF-8")); /**/

		DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
		Document doc = documentBuilder.parse(urlBuilder.toString());

		doc.getDocumentElement().normalize();
		NodeList nList = doc.getElementsByTagName("itemList");
		ArrayList<SeoulBusLoadStationApiDto> dtos = new ArrayList<>();
		SeoulBusLoadStationApiDto dto = null;

		for (int i = 0; i < nList.getLength(); i++) {
			Node nNode = nList.item(i);
			Element eElement = (Element) nNode;
			dto = new SeoulBusLoadStationApiDto();
			dto.setBusRouteNm(getTagValue("busRouteNm", eElement));
			dto.setGpsX(getTagValue("gpsX", eElement));
			dto.setGpsY(getTagValue("gpsY", eElement));
			dto.setStationNm(getTagValue("stationNm", eElement));
			dto.setStationNo(getTagValue("stationNo", eElement));
			dtos.add(dto);
		}
		return dtos;
	}

	public static String getTagValue(String tag, Element eElement) {
		// 결과를 저장할 result 변수 선언
		String result = "";

		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();

		result = nlList.item(0).getTextContent();

		return result;
	}
}