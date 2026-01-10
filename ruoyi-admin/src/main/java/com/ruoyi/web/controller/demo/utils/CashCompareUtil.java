package com.ruoyi.web.controller.demo.utils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.TreeSet;
import java.util.stream.Collectors;


/**
 * 比较两个 payload 的结果
 */
public class CashCompareUtil {

    private static final ObjectMapper MAPPER = new ObjectMapper();

    public static class CompareResult {
        public final String htmlTable;
        public final List<Map<String, Object>> diffs;

        public CompareResult(String htmlTable, List<Map<String, Object>> diffs) {
            this.htmlTable = htmlTable;
            this.diffs = diffs;
        }
    }

    /** 入口：payload 可以是 JSON 字符串或 JsonNode */
    public static CompareResult compare(Object payload1, Object payload2, String date1, String date2) throws Exception {
        JsonNode p1 = toJsonNode(payload1);
        JsonNode p2 = toJsonNode(payload2);

        Map<String, JsonNode> idx1 = indexByRowName(p1);
        Map<String, JsonNode> idx2 = indexByRowName(p2);

        // 所有 rowName
        Set<String> rowNames = new TreeSet<>();
        rowNames.addAll(idx1.keySet());
        rowNames.addAll(idx2.keySet());

        // 所有 amounts key（TOTAL/HKD/...）
        LinkedHashSet<String> amountKeys = new LinkedHashSet<>();
        amountKeys.add("TOTAL"); // 优先
        for (String rn : rowNames) {
            collectAmountKeys(idx1.get(rn), amountKeys);
            collectAmountKeys(idx2.get(rn), amountKeys);
        }
        // 把 TOTAL 放第一位，其余排序
        List<String> keys = new ArrayList<>(amountKeys);
        keys.remove("TOTAL");
        Collections.sort(keys);
        List<String> orderedKeys = new ArrayList<>();
        orderedKeys.add("TOTAL");
        orderedKeys.addAll(keys);
        // 如果根本没有 TOTAL，也能正常（去掉空列）
        orderedKeys = orderedKeys.stream().filter(k -> amountKeys.contains(k)).collect(Collectors.toList());

        List<Map<String, Object>> diffs = new ArrayList<>();

        StringBuilder sb = new StringBuilder();
        sb.append("<table style='border-collapse:collapse;font-family:Arial,Helvetica,sans-serif;font-size:14px'>");

        // header
        sb.append("<tr>");
        sb.append(th("项目"));
        for (String k : orderedKeys) {
            sb.append(th(date1 + " " + k));
            sb.append(th(date2 + " " + k));
        }
        sb.append("</tr>");

        // rows
        for (String rn : rowNames) {
            JsonNode r1 = idx1.get(rn);
            JsonNode r2 = idx2.get(rn);

            sb.append("<tr>");
            sb.append(td(escapeHtml(rn), false));

            for (String k : orderedKeys) {
                JsonNode v1 = getAmountValue(r1, k);
                JsonNode v2 = getAmountValue(r2, k);

                boolean different = !valueEqual(v1, v2);

                if (different) {
                    Map<String, Object> diff = new LinkedHashMap<>();
                    diff.put("rowName", rn);
                    diff.put("amountKey", k);
                    diff.put("date1", date1);
                    diff.put("value1", nodeToJava(v1));
                    diff.put("date2", date2);
                    diff.put("value2", nodeToJava(v2));
                    diffs.add(diff);
                }

                sb.append(td(escapeHtml(formatValue(v1)), different));
                sb.append(td(escapeHtml(formatValue(v2)), different));
            }

            sb.append("</tr>");
        }

        sb.append("</table>");

        return new CompareResult(sb.toString(), diffs);
    }

    // -------- helpers --------

    private static JsonNode toJsonNode(Object payload) throws Exception {
        if (payload instanceof JsonNode) return (JsonNode) payload;
        if (payload instanceof String) return MAPPER.readTree((String) payload);
        // 允许 Map/POJO
        return MAPPER.valueToTree(payload);
    }

    private static Map<String, JsonNode> indexByRowName(JsonNode payload) {
        Map<String, JsonNode> map = new HashMap<>();
        JsonNode arr = payload.path("cashValues");
        if (arr.isArray()) {
            for (JsonNode row : arr) {
                String rowName = row.path("rowName").asText(null);
                if (rowName != null && !rowName.isEmpty()) {
                    map.put(rowName, row);
                }
            }
        }
        return map;
    }

    private static void collectAmountKeys(JsonNode row, Set<String> out) {
        if (row == null) return;
        JsonNode amounts = row.path("amounts");
        if (amounts != null && amounts.isObject()) {
            amounts.fieldNames().forEachRemaining(out::add);
        }
    }

    private static JsonNode getAmountValue(JsonNode row, String key) {
        if (row == null) return null;
        JsonNode amounts = row.path("amounts");
        if (amounts == null || !amounts.isObject()) return null;
        JsonNode v = amounts.get(key);
        return (v == null || v.isMissingNode() || v.isNull()) ? null : v;
    }

    /** 数值严格对比：数值用 BigDecimal compareTo，其他用字符串/空值规则 */
    private static boolean valueEqual(JsonNode a, JsonNode b) {
        if (a == null && b == null) return true;
        if (a == null || b == null) return false;

        if (a.isNumber() && b.isNumber()) {
            BigDecimal da = a.decimalValue();
            BigDecimal db = b.decimalValue();
            return da.compareTo(db) == 0;
        }
        return Objects.equals(a.asText(), b.asText());
    }

    private static Object nodeToJava(JsonNode n) {
        if (n == null) return null;
        if (n.isNumber()) return n.decimalValue();
        if (n.isTextual()) return n.asText();
        if (n.isBoolean()) return n.asBoolean();
        return n.toString();
    }

    private static String formatValue(JsonNode n) {
        if (n == null) return "—";
        if (n.isNumber()) return n.decimalValue().toPlainString();
        return n.asText();
    }

    private static String th(String s) {
        return "<th style='padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left'>" + escapeHtml(s) + "</th>";
    }

    private static String td(String s, boolean highlight) {
        String style = "padding:8px;border:1px solid #ddd;";
        if (highlight) style += "background:#fff3a3;"; // 黄底
        return "<td style='" + style + "'>" + s + "</td>";
    }

    private static String escapeHtml(String s) {
        if (s == null) return "";
        return s.replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }
}
