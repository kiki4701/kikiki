package com.herbmall.common;

import java.util.Date;

public class Utility {
	//자료실 업로드 관련 상수
	public static final String UP_PATH="/upload";
	public static final String TEST_PATH="D:\\lecture\\workspace_list\\jsp_ws\\herbmall\\src\\main\\webapp\\upload";
		
	public static String displayRe(int step) {
		String result="";

		if(step > 0) {
			for(int j = 0; j < step; j++) {
				result+= "&nbsp;";
			} 
			result+="<img src='../images/re.gif'>";
		} 

		return result;
	}

	public static String cutString(String title, int len) {
		String result = "";
		if(title.length()>len) {
			result = title.substring(0,len)+ "...";
		}else {
			result = title;
		}

		return result;
	}

	public static String displayNew(Date regdate){
		//24시간 이내의 글인 경우 new이미지 보여주기
		Date today = new Date();
		long gap= (today.getTime() - regdate.getTime())/1000;//초
		gap = gap/(60*60); //시간

		String result="";
		if(gap<24){
			result="<img src='../images/new.gif' alt='new 이미지'>";
		}

		return result;
	}

	public static String displayFile(String fileName) {
		String result = "";
		if(fileName != null) {
			result = "<img src = '../images/file.gif' alt = 'file 이미지'>";
		}
		return result;
	}

	public static String getFileInfo(String fileName, long fileSize) {
		String result="";
		float n=Math.round((fileSize/1024f)*10)/10f;
		
		if(fileName!=null) {
			result =displayFile(fileName)+" "+ fileName+" ( "+n+"KB )";
		} 
		
		return result;
	}


}












