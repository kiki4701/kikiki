package com.tips.model;

public class TravelExpert {
	public String getTip(String city) {
		String result = "";
		if(city.equals("강화")) {
			result = "석모도"	;
		}else if(city.equals("강릉")) {
			result = "정동진";
		}else if(city.equals("해남")) {
			result = "땅끝마을";
		}else if(city.equals("거제")) {
			result = "외도";
		}
		
		return result;
	}
}
