package com.aop;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.ProceedingJoinPoint;

public class LoggingAspect {
	private Log log = LogFactory.getLog(getClass());
	/*
		  JoinPoint : 공통 관심 사항이 적용될 수 있는 지점
		  ProceedingJoinPoint : JoinPoint 의 하위클래스로서 proceed() 메서드를 가지고 있다.
		  	- ProceedingJoinPoint 객체는 Aspect 가 적용되는 객체 및 메서드에 대한 정보를 
		  	담고 있으며, 이 객체를 통해서 핵심 로직을 실행할 수 있게 됨
	 */
	//설정파일에서  Aspect를 어떤 클래스의 어떤 메서드에 적용할지를 설정해야 함
	public Object logging(ProceedingJoinPoint joinPoint) throws Throwable {
		log.info("기록 시작 : " + joinPoint.toString());
		
		long start = System.currentTimeMillis();
		
		try {
			Object retValue = joinPoint.proceed();	//실제 타켓 메서드를 호출
			return retValue;
		} finally {
			long finish = System.currentTimeMillis();
			long time = finish-start;
			log.info("기록 종료");
			log.info(joinPoint.getSignature().getName() + "메서드 실행시간 : "
					+ time + "밀리초");
			
		}
	}
}
