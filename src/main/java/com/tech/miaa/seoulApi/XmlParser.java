package com.tech.miaa.seoulApi;

import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class XmlParser {
    private static DocumentBuilderFactory documentBuilderFactory;
    private static DocumentBuilder documentBuilder;
    private static Document doc;
    
    public static void parsing (String url) throws ParserConfigurationException, SAXException, IOException{
    	DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
    	DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
    	Document doc = documentBuilder.parse(url);
    	
    	doc.getDocumentElement().normalize();
    	System.out.println("Root element: " + doc.getDocumentElement().getNodeName());
    	NodeList nlList = doc.getElementsByTagName("subwayId");
    	System.out.println(nlList.getLength());
    	
    	for (int i = 0; i < nlList.getLength(); i++) {
    		Node nNode = nlList.item(i);
    		if(nNode.getNodeType()==Node.ELEMENT_NODE) {
    			Element eElement = (Element) nNode;
        		System.out.println("===============================");
    			System.out.println(getTagValue("subwayId", eElement));
    			System.out.println(getTagValue("updnLine", eElement));
    			System.out.println("===============================");
    		}
        	
		}
    	
	}
    private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}
}
