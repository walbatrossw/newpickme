package com.cafe24.newpickme.commons.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.Arrays;

@Component
@Aspect
public class LogAdvice {

    private static final Logger logger = LoggerFactory.getLogger(LogAdvice.class);

    @Around("execution(* com.cafe24.newpickme..*Controller.*(..))" +
            " || execution(* com.cafe24.newpickme..*ServiceImpl.*(..))" +
            " || execution(* com.cafe24.newpickme..*DaoImpl.*(..))"
    )
    public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable {
        // Start time
        long startTime = System.currentTimeMillis();
        // 핵심로직으로 이동
        Object result = joinPoint.proceed();
        // Class name
        String type = joinPoint.getSignature().getDeclaringTypeName();
        String name = "";
        // Controller name
        if (type.contains("Controller")) {
            name = "Controller \t: ";
            // Service name
        } else if (type.contains("Service")) {
            name = "ServiceImpl \t: ";
            // DAO name
        } else if (type.contains("Dao")) {
            name = "DaoImpl \t: ";
        }
        // Method name
        logger.info(name + type + "." + joinPoint.getSignature().getName() + "()");
        // Argument / Parameter
        logger.info("Arguments / Parameters : " + Arrays.toString(joinPoint.getArgs()));
        // End time
        long endTime = System.currentTimeMillis();
        // Running time
        long runTime = endTime - startTime;
        logger.info("Method Running time : " + runTime);
        return result;
    }
}
