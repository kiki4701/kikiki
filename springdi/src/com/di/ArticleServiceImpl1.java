package com.di;

public class ArticleServiceImpl1 implements ArticleService{
	private ArticleDAO articleDao;
	
	public ArticleServiceImpl1() {
		//articleDao = new OracleArticleDAO();
		articleDao = new MysqlArticleDAO();
	}

	@Override
	public void write(ArticleVO vo) {
		System.out.println("1. ArticleServiceImpl1의 write()메서드 호출!");
		articleDao.insert(vo);
	}
	
}
