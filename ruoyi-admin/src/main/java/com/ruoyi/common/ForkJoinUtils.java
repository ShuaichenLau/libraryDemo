package com.ruoyi.common;

import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.ForkJoinWorkerThread;
import java.util.concurrent.atomic.AtomicInteger;

public class ForkJoinUtils {
    private static final Object LOCK = new Object();
    private static volatile ForkJoinPool instance;

    private static final int MAX_THREAD_NUM = 10;
    private static final String POOL_NAME = "Ruoyi-ForkJoin";

    /**
     * @return
     */
    public static ForkJoinPool getInstance() {
        if (instance == null) {
            synchronized (LOCK) {
                if (instance == null) {
                    AtomicInteger seq = new AtomicInteger(1);
                    ForkJoinPool.ForkJoinWorkerThreadFactory factory = pool -> {
                        ForkJoinWorkerThread thread = ForkJoinPool.defaultForkJoinWorkerThreadFactory.newThread(pool);
                        thread.setName(POOL_NAME + "-worker-" + seq.getAndIncrement());
                        return thread;
                    };
                    instance = new ForkJoinPool(MAX_THREAD_NUM, factory, null, false);

                }
            }
        }
        return instance;
    }

}
