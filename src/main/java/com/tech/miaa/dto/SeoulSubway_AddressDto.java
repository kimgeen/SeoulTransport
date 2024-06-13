package com.tech.miaa.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SeoulSubway_AddressDto {
	private int subway_no;
	private String train_no;
	private String subway_name;
	private String subway_tell;
	private String subway_address;
}
