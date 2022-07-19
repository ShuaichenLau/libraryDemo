package com.ruoyi.common.annotation;

import java.lang.annotation.*;

@Target(ElementType.METHOD) // 作用域
@Retention(RetentionPolicy.RUNTIME) // 注解生命周期
@Documented
public @interface Idempotent {

    String description() default "";

}
