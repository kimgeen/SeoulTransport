package com.tech.miaa.dao;

import java.util.ArrayList;

import com.tech.miaa.dto.SeoulBusStationDto;
import com.tech.miaa.dto.SeoulDistrictDto;
import com.tech.miaa.dto.SeoulSubway_AddressDto;
import com.tech.miaa.dto.Seoul_Train_TotalDto;
import com.tech.miaa.dto.seoulTrain_inDto;
import com.tech.miaa.dto.seoulTrain_outDto;

public interface TrainDao {
	public SeoulDistrictDto train_map_detailsearch(String District);
	
	public ArrayList<SeoulSubway_AddressDto> subway_address(String train_name,String train_no);
	public ArrayList<SeoulSubway_AddressDto> subway_address2(String train_name);
	
	public ArrayList<seoulTrain_inDto> train_insearch(String train_name,String train_no);
	public ArrayList<seoulTrain_inDto> train_insearch2(String train_name);
	
	public ArrayList<seoulTrain_outDto> train_outsearch(String train_name,String train_no);
	public ArrayList<seoulTrain_outDto> train_outsearch2(String train_name);
	
	public ArrayList<Seoul_Train_TotalDto> train_county_total();
	
}
