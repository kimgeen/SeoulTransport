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
public class SeoulBusStationApiDto {
	private String arsId;
	private String stNm;
	private String tmX;
	private String tmY;
}
