package com.tech.miaa.APIdto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SeoulTrain_intoApiDto {
	private String subwayId;
	private String updnLine;
	private String bstatnNm;
	private String btrainSttus;
	private String arvlMsg2;
	private String arvlMsg3;
}
