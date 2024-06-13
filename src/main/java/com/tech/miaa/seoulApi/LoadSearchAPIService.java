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

import com.tech.miaa.APIdto.LoadSearchBusApiDto;
import com.tech.miaa.APIdto.LoadSearchTrainApiDto;

public class LoadSearchAPIService {
	private static final String key= "w2tmpAZfwyKccw%2B1Vax4J81O18cWzYO%2BQweLlYpN4IK1UcE1pizbeLk7RDSg3BMcIfd0D7PECVsLtBnrviDuOA%3D%3D";
	
	 public static ArrayList<LoadSearchBusApiDto> LoadSearchBus(String values1_xsize, String values1_ysize2, String values2_xsize,
				String values2_ysize) throws IOException, ParserConfigurationException, SAXException {
	        StringBuilder urlBuilder = new StringBuilder("http://ws.bus.go.kr/api/rest/pathinfo/getPathInfoByBus"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+key); /*Service Key*/
	        
	        urlBuilder.append("&" + URLEncoder.encode("startX","UTF-8") + "=" + URLEncoder.encode(values1_xsize, "UTF-8")); /*출발지x좌표*/
	        urlBuilder.append("&" + URLEncoder.encode("startY","UTF-8") + "=" + URLEncoder.encode(values1_ysize2, "UTF-8")); /*출발지Y좌표*/
	        urlBuilder.append("&" + URLEncoder.encode("endX","UTF-8") + "=" + URLEncoder.encode(values2_xsize, "UTF-8")); /*목적지X좌표*/
	        urlBuilder.append("&" + URLEncoder.encode("endY","UTF-8") + "=" + URLEncoder.encode(values2_ysize, "UTF-8")); /*목적지Y좌표*/
	        
	        DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
	    	DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
	    	Document doc = documentBuilder.parse(urlBuilder.toString());
	        
	    	doc.getDocumentElement().normalize();
	    	NodeList nList = doc.getElementsByTagName("pathList");
	    	ArrayList<LoadSearchBusApiDto> dtos = new ArrayList<>();
	    	LoadSearchBusApiDto dto=null;
	    	for (int temp = 0; temp < nList.getLength(); temp++) {
	    		Node nNode = nList.item(temp);
				Element eElement = (Element) nNode;
				dto=new LoadSearchBusApiDto();
				dto.setFname(getTagValue("fname", eElement));
				dto.setFx(getTagValue("fx", eElement));
				dto.setFy(getTagValue("fy", eElement));
				dto.setRouteId(getTagValue("routeId", eElement));
				dto.setRouteNm(getTagValue("routeNm", eElement));
				dto.setTname(getTagValue("tname", eElement));
				dto.setTx(getTagValue("tx", eElement));
				dto.setTy(getTagValue("ty", eElement));
				dtos.add(dto);
	    	}
	    	
	    	return dtos;
	    }
	 
	 public static ArrayList<LoadSearchTrainApiDto> LoadSearchTrain(String values1_xsize, String values1_ysize, String values2_xsize,
		String values2_ysize) throws IOException, ParserConfigurationException, SAXException {
	        StringBuilder urlBuilder = new StringBuilder("http://ws.bus.go.kr/api/rest/pathinfo/getPathInfoBySubway"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+key); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("startX","UTF-8") + "=" + URLEncoder.encode(values1_xsize, "UTF-8")); /*출발지x좌표*/
	        urlBuilder.append("&" + URLEncoder.encode("startY","UTF-8") + "=" + URLEncoder.encode(values1_ysize, "UTF-8")); /*출발지Y좌표*/
	        urlBuilder.append("&" + URLEncoder.encode("endX","UTF-8") + "=" + URLEncoder.encode(values2_xsize, "UTF-8")); /*목적지X좌표*/
	        urlBuilder.append("&" + URLEncoder.encode("endY","UTF-8") + "=" + URLEncoder.encode(values2_ysize, "UTF-8")); /*목적지Y좌표*/
	        
	        DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
	    	DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
	    	Document doc = documentBuilder.parse(urlBuilder.toString());
	        
	    	doc.getDocumentElement().normalize();
	    	NodeList nList = doc.getElementsByTagName("pathList");
	    	ArrayList<LoadSearchTrainApiDto> dtos = new ArrayList<>();
	    	LoadSearchTrainApiDto dto=null;
	    	for (int temp = 0; temp < nList.getLength(); temp++) {
	    		Node nNode = nList.item(temp);
				Element eElement = (Element) nNode;
				dto=new LoadSearchTrainApiDto();
				dto.setFname(getTagValue("fname", eElement));
				dto.setRouteNm(getTagValue("routeNm", eElement));
				dto.setTname(getTagValue("tname", eElement));
				dtos.add(dto);
	    	}
	    	
	        return dtos;
	    }
	 
	 public static String getTagValue(String tag, Element eElement) {
		    //결과를 저장할 result 변수 선언
		    String result = "";

			NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();

			result = nlList.item(0).getTextContent();

			return result;
			}
}