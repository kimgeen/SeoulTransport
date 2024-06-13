package com.tech.miaa.APIdto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SeoulBusLoadStationApiDto {
	private String busRouteNm; //노선ID
	private String gpsX; //노선ID
	private String gpsY; //노선명
	private String stationNm; //정류소 명
	private String stationNo; //정류소 id
}
