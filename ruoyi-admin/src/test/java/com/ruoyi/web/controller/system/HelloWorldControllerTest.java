package com.ruoyi.web.controller.system;

import com.ruoyi.common.ForkJoinUtils;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Collectors;

@SpringBootTest
public class HelloWorldControllerTest {

    private static final Logger log = LoggerFactory.getLogger(HelloWorldControllerTest.class);

    @Test
    public void test() throws Exception {
        List<String> strList = new ArrayList<>();
        for (int i = 0; i < 100; i++) {
            strList.add(String.valueOf(i));
        }

        ForkJoinUtils.getInstance().submit(() -> {
            strList.parallelStream().forEach(str -> {
                try {
                    log.info("start==Thread: {}, Value: {}", Thread.currentThread().getName(), str);
                    Thread.sleep(1000);
                    log.info("end==Thread: {}, Value: {}", Thread.currentThread().getName(), str);
                    // todo 调用三方接口, 更新本地数据库
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt(); // 保持中断状态
                }
            });
        }).get();


        // 1. 提交所有任务，并收集 CompletableFuture 对象
        List<CompletableFuture<Void>> futures = strList.stream()
                .map(str -> CompletableFuture.runAsync(() -> {
                    try {
                        log.info("start==Thread: {}, Value: {}", Thread.currentThread().getName(), str);
                        Thread.sleep(1000);
                        log.info("end==Thread: {}, Value: {}", Thread.currentThread().getName(), str);
                        // todo 调用三方接口, 更新本地数据库
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt(); // 保持中断状态
                        throw new RuntimeException(e);
                    }
                }, ForkJoinUtils.getInstance()))
                .collect(Collectors.toList()); // 注意：JDK 8 需要 Collectors.toList()

        // 2. 主线程等待：将所有 Future 合并，并阻塞直到全部完成
        // 方式 A: 使用 join() (推荐，处理的是 RuntimeException)
        CompletableFuture.allOf(futures.toArray(new CompletableFuture[0])).join();

        // 3. 程序执行到这里，说明所有异步任务已完成
        log.info("All tasks are finished. Main thread continues.");
    }


}