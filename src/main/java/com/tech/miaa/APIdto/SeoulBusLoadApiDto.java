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
public class SeoulBusLoadApiDto {
	private String busRouteId; //노선ID
	private String busRouteNm; //노선명
	private String stBegin; //시작 정거장명
	private String stEnd; //종착 정거장명
	private String adirection; //방향
	private String arrmsg1; //첫번쨰 차 도착시간
}
