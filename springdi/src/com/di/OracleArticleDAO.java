package com.di;

public class OracleArticleDAO implements ArticleDAO{

	@Override
	public void insert(ArticleVO vo) {
		System.out.println("oracle DB에 접속해서 table에 "+ vo +" 를 insert한다.");
		
	}

}
