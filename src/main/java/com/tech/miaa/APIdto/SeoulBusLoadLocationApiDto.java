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
public class SeoulBusLoadLocationApiDto {
	private String gpsX; //노선x
	private String gpsY; //노선y
}
