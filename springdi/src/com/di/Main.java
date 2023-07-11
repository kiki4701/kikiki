package com.di;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class Main {

	public static void main(String[] args) {
		//1. 기존 방식 (serviceimpl1 의 객체 생성해서 가져오기)
		ArticleService service1 = new ArticleServiceImpl1();
		
		ArticleVO vo = new ArticleVO();
		vo.setNo(1);
		vo.setTitle("1. 기존방식 이용");
		service1.write(vo);
		
		//2. 스프링 설정파일로부터 빈 얻어오기
		//	(Beanfactory 사용, 잘 사용하지는 않지만 해봄)
		//Resource resource = new ClassPathResource("applicationContext.xml");
		//BeanFactory context = new XmlBeanFactory(resource);
		//ApplicationContext 사용 (이걸 훨씬 더 많이 사용함 Beanfactory보단)
		ApplicationContext context 
			= new ClassPathXmlApplicationContext("applicationContext.xml");
		
		//빈 얻어오기
		ArticleService articleService2
			= (ArticleService) context.getBean("articleService");
		
		//빈 사용하기
		ArticleVO vo2 = new ArticleVO();
		vo2.setNo(2);
		vo2.setTitle("2. 생성자에서 종속객체 주입받는 경우");
		articleService2.write(vo2);
		
		//3.
		ArticleService articleService3 
			= (ArticleService) context.getBean("articleService3");
		
		ArticleVO vo3 = new ArticleVO();
		vo3.setNo(3);
		vo3.setTitle("3. setter에서 종속객체 주입받는 경우");
		articleService3.write(vo3);
		
		
	}

}
