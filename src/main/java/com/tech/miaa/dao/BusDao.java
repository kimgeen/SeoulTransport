package com.tech.miaa.dao;

import java.util.ArrayList;

import com.tech.miaa.dto.SeoulBusStationDto;
import com.tech.miaa.dto.SeoulDistrictDto;
import com.tech.miaa.dto.Seoul_Bus_TotalDto;

public interface BusDao {
	public int bus_detailsearchAll(String district);
	public ArrayList<SeoulBusStationDto> bus_detailsearch(String District, int rowStart, int rowEnd);
	public ArrayList<Seoul_Bus_TotalDto> bus_get_county_total();
	
}
