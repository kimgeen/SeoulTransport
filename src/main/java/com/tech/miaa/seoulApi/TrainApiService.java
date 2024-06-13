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

import com.tech.miaa.APIdto.SeoulTrain_intoApiDto;

public class TrainApiService {
	private final static String API_KEY= "5a6d72434d736f7339336b694a456e";
	private StringBuilder urlBuilder;
	private int page = 1;
	
	public static ArrayList<SeoulTrain_intoApiDto> getDto(String train_name,String train_no) throws IOException, ParserConfigurationException, SAXException {
			StringBuilder urlBuilder = new StringBuilder("http://swopenAPI.seoul.go.kr/api/subway"); /*URL*/
			urlBuilder.append("/" +  URLEncoder.encode(API_KEY,"UTF-8") ); /*인증키 (sample사용시에는 호출시 제한됩니다.)*/
			urlBuilder.append("/" +  URLEncoder.encode("xml","UTF-8") ); /*요청파일타입 (xml,xmlf,xls,json) */
			urlBuilder.append("/" + URLEncoder.encode("realtimeStationArrival","UTF-8")); /*서비스명 (대소문자 구분 필수입니다.)*/
			urlBuilder.append("/" + URLEncoder.encode("1","UTF-8")); /*요청시작위치 (sample인증키 사용시 5이내 숫자)*/
			urlBuilder.append("/" + URLEncoder.encode("100","UTF-8")); /*요청종료위치(sample인증키 사용시 5이상 숫자 선택 안 됨)*/
			// 상위 5개는 필수적으로 순서바꾸지 않고 호출해야 합니다.
			
			// 서비스별 추가 요청 인자이며 자세한 내용은 각 서비스별 '요청인자'부분에 자세히 나와 있습니다.
			urlBuilder.append("/" + URLEncoder.encode(train_name,"UTF-8")); //지하철역 코드
			
			DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
	    	DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
	    	Document doc = documentBuilder.parse(urlBuilder.toString());
	    	
	    	doc.getDocumentElement().normalize();
	    	NodeList nList = doc.getElementsByTagName("row");
	    	ArrayList<SeoulTrain_intoApiDto> dtos = new ArrayList<>();
	    	SeoulTrain_intoApiDto dto=null;
	    	
	    	for (int temp = 0; temp < nList.getLength(); temp++) {
	    		Node nNode = nList.item(temp);
				Element eElement = (Element) nNode;
				String subwayId=getTagValue("subwayId", eElement);
				String updnLine=getTagValue("updnLine", eElement);
				String bstatnNm=getTagValue("bstatnNm", eElement);
				String btrainSttus=getTagValue("btrainSttus", eElement);
				String arvlMsg2=getTagValue("arvlMsg2", eElement);
				String arvlMsg3=getTagValue("arvlMsg3", eElement);
				if(subwayId.equals(train_no)) {
					dto = new SeoulTrain_intoApiDto(subwayId, updnLine, bstatnNm, btrainSttus, arvlMsg2, arvlMsg3);
					dtos.add(dto);
				}
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