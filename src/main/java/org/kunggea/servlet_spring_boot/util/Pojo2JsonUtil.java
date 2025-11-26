package org.kunggea.servlet_spring_boot.util;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.JsonProcessingException;

public class Pojo2JsonUtil {

    private static final ObjectMapper objectMapper = new ObjectMapper();

    /**
     * 将POJO对象转换为JSON字符串
     *
     * @param pojo 需要转换的POJO对象
     * @return 转换后的JSON字符串
     * @throws RuntimeException 当JSON序列化失败时抛出运行时异常
     */
    public static String pojo2Json(Object pojo) {
        try {
            // 使用objectMapper将对象序列化为JSON字符串
            return objectMapper.writeValueAsString(pojo);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("JSON序列化失败", e);
        }
    }


}
