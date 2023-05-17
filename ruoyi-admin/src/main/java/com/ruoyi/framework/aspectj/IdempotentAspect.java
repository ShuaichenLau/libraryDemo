package com.ruoyi.framework.aspectj;

import cn.hutool.json.JSONUtil;
import com.google.common.base.Stopwatch;
import com.google.common.collect.Maps;


import com.ruoyi.common.annotation.Idempotent;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import java.util.Map;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

@Aspect
@Component
@Slf4j
public class IdempotentAspect {

    @Pointcut("@annotation(com.ruoyi.common.annotation.Idempotent)")
    public void idempotentAspect() {
        log.info("idempotentAspect");
    }

    @Around("idempotentAspect()")
    public Object around(ProceedingJoinPoint pjp) throws Throwable {
        // 构造StopWatch
        Stopwatch timer = Stopwatch.createStarted();

        log.info(JSONUtil.toJsonStr(pjp));

        boolean check = this.handleRequest(pjp);

        if (check) {
            log.info("重复性请求...");
            throw new Exception("重复性请求...");
        }

        log.info(timer.stop().elapsed(TimeUnit.MILLISECONDS) + "ms, around");
        return pjp.proceed();
    }

    private boolean handleRequest(ProceedingJoinPoint pjp) {

        boolean check = false;

        log.info("判断是否重复性请求....");
        MethodSignature methodSignature = (MethodSignature) pjp.getSignature();
        Idempotent idempotent = methodSignature.getMethod().getDeclaredAnnotation(Idempotent.class);
        String description = idempotent.description();  // 自定义注解定义的元素

        String methodName = methodSignature.getMethod().getName();  // 方法名
        String[] pjpParameters = methodSignature.getParameterNames();  // 参数名称
        Object[] pjpArgs = pjp.getArgs();   // 参数值

        Map<String, Object> reqMaps = Maps.newHashMap();

        for (int i = 0; i < pjpParameters.length; i++) {
            reqMaps.put(pjpParameters[i], pjpArgs[i]);
        }

        log.info(JSONUtil.toJsonStr(reqMaps));

        if (Objects.isNull(reqMaps)){
            return true;
        }

        return check;


    }

}
