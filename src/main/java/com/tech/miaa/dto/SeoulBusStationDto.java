package com.tech.miaa.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SeoulBusStationDto {
	private String station_name;
	private String district;
	private int load_count;
	private String station_type;
	private double x_size;
	private double y_size;
}
