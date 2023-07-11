package com.di;

public class ArticleServiceImpl2 implements ArticleService{
	private ArticleDAO articleDao;
	
	//DI - 생성자에 의한 종속객체 주입
	public ArticleServiceImpl2(ArticleDAO articleDao) {
		this.articleDao = articleDao;
	}

	@Override
	public void write(ArticleVO vo) {
		System.out.println("2. ArticleServiceImpl2의 write()메서드 호출!!");
		articleDao.insert(vo);
	}
	
}
