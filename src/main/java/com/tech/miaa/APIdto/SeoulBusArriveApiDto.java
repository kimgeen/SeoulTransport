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
public class SeoulBusArriveApiDto {
	private String adirection; //방향
	private String arrmsg1; //첫번쨰 차 도착시간
	private String arsId; //정류소 id
	private String busRouteAbrv; //버스명
	private String busRouteId; //노선 id
}
