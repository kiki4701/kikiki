package com.tips.model;

public class MessageModel {
	
	public String proMessage(String message) {
		String result = "";
		if(message==null || message.isEmpty()) {
			result = "안녕하세요";
		}else if(message.equals("name")) {
			result = "홍길동입니다";
		}else {
			result = "타입이 맞지 않습니다";
		}
		return result;
	}
}
