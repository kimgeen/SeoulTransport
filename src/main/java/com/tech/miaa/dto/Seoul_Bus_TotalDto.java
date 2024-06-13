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
public class Seoul_Bus_TotalDto {
	private String busstation_county;
	private int total_in;
	private int total_out;
}
