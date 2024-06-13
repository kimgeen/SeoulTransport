package com.tech.miaa.serviceInter;

import java.io.IOException;
import java.util.ArrayList;

import javax.xml.parsers.ParserConfigurationException;

import org.springframework.ui.Model;
import org.xml.sax.SAXException;

import com.tech.miaa.dto.Seoul_Bus_TotalDto;

public interface BusServiceInter {
	public void bus_detailsearch(Model model);
	public void bus_station_detailsearch(Model model) throws IOException, ParserConfigurationException, SAXException;
	public void bus_Load_detailsearch(Model model) throws IOException, ParserConfigurationException, SAXException;
	public ArrayList<Seoul_Bus_TotalDto> get_county_total(Model model);
}
