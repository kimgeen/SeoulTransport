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
public class LoadSearchTrainApiDto {
	private String fname; //탑승지
	private String routeNm;
	private String tname;
	private String routeNm2;
	private String tname2;
	private String routeNm3;
	private String tname3;
}
