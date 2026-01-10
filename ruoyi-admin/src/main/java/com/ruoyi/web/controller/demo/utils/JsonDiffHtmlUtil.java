package com.ruoyi.web.controller.demo.utils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.TreeSet;

/**
 * Json diff to HTML
 */
public class JsonDiffHtmlUtil {

    private static final ObjectMapper MAPPER = new ObjectMapper();

    public static class DiffRow {
        public final String path;
        public final String left;
        public final String right;
        public final boolean different;

        public DiffRow(String path, String left, String right, boolean different) {
            this.path = path;
            this.left = left;
            this.right = right;
            this.different = different;
        }
    }

    public static class DiffResult {
        public final String htmlTable;
        public final List<DiffRow> rows;

        public DiffResult(String htmlTable, List<DiffRow> rows) {
            this.htmlTable = htmlTable;
            this.rows = rows;
        }
    }

    /**
     * payload 可传 JSON字符串 / JsonNode / Map / POJO
     */
    public static DiffResult diffToHtml(Object payloadLeft, Object payloadRight, String leftLabel, String rightLabel) throws Exception {
        JsonNode left = toJsonNode(payloadLeft);
        JsonNode right = toJsonNode(payloadRight);

        List<DiffRow> rows = new ArrayList<>();
        walk("", left, right, rows);

        String html = buildHtmlTable(rows, leftLabel, rightLabel);
        return new DiffResult(html, rows);
    }

    // ---------------- core diff ----------------

    private static void walk(String path, JsonNode a, JsonNode b, List<DiffRow> out) {
        // 两边都为空
        if (a == null && b == null) return;

        // 其中一边缺失：直接记录
        if (a == null) {
            out.add(new DiffRow(pathOrRoot(path), "—", format(b), true));
            return;
        }
        if (b == null) {
            out.add(new DiffRow(pathOrRoot(path), format(a), "—", true));
            return;
        }

        // 类型不同：直接记录
        if (!sameNodeKind(a, b)) {
            out.add(new DiffRow(pathOrRoot(path), format(a), format(b), true));
            return;
        }

        // 对象
        if (a.isObject()) {
            Set<String> fields = new TreeSet<>();
            a.fieldNames().forEachRemaining(fields::add);
            b.fieldNames().forEachRemaining(fields::add);

            for (String f : fields) {
                walk(join(path, f), a.get(f), b.get(f), out);
            }
            return;
        }

        // 数组（按下标对齐）
        if (a.isArray()) {
            int max = Math.max(a.size(), b.size());
            for (int i = 0; i < max; i++) {
                JsonNode ai = (i < a.size()) ? a.get(i) : null;
                JsonNode bi = (i < b.size()) ? b.get(i) : null;
                walk(path + "[" + i + "]", ai, bi, out);
            }
            return;
        }

        // 值节点：对比
        boolean diff = !valueEqual(a, b);
        out.add(new DiffRow(pathOrRoot(path), format(a), format(b), diff));
    }

    private static boolean sameNodeKind(JsonNode a, JsonNode b) {
        // 数字都算 number、文本都算 textual…（比 getNodeType 更贴近业务）
        if (a.isObject() && b.isObject()) return true;
        if (a.isArray() && b.isArray()) return true;
        if (a.isNumber() && b.isNumber()) return true;
        if (a.isTextual() && b.isTextual()) return true;
        if (a.isBoolean() && b.isBoolean()) return true;
        if (a.isNull() && b.isNull()) return true;
        // 其他情况按 nodeType
        return a.getNodeType() == b.getNodeType();
    }

    private static boolean valueEqual(JsonNode a, JsonNode b) {
        if (a == null && b == null) return true;
        if (a == null || b == null) return false;

        if (a.isNumber() && b.isNumber()) {
            BigDecimal da = a.decimalValue();
            BigDecimal db = b.decimalValue();
            return da.compareTo(db) == 0;
        }
        // 文本/布尔等
        return Objects.equals(a.asText(), b.asText());
    }

    // ---------------- formatting ----------------

    private static JsonNode toJsonNode(Object payload) throws Exception {
        if (payload == null) return null;
        if (payload instanceof JsonNode) return (JsonNode) payload;
        if (payload instanceof String) return MAPPER.readTree((String) payload);
        return MAPPER.valueToTree(payload);
    }

    private static String format(JsonNode n) {
        if (n == null || n.isMissingNode()) return "—";
        if (n.isNull()) return "null";
        if (n.isTextual()) return n.asText();
        if (n.isNumber()) return n.decimalValue().toPlainString();
        if (n.isBoolean()) return String.valueOf(n.asBoolean());
        // 对象/数组：用 JSON 串（短一点更易读）
        String s = n.toString();
        if (s.length() > 200) s = s.substring(0, 200) + "...";
        return s;
    }

    private static String join(String base, String field) {
        if (base == null || base.isEmpty()) return field;
        return base + "." + field;
    }

    private static String pathOrRoot(String p) {
        return (p == null || p.isEmpty()) ? "$" : p;
    }

    // ---------------- HTML ----------------

    private static String buildHtmlTable(List<DiffRow> rows, String leftLabel, String rightLabel) {
        StringBuilder sb = new StringBuilder();
        sb.append("<table style='border-collapse:collapse;font-family:Arial,Helvetica,sans-serif;font-size:14px'>");
        sb.append("<tr>")
                .append(th("Path"))
                .append(th(leftLabel))
                .append(th(rightLabel))
                .append("</tr>");

        for (DiffRow r : rows) {
            sb.append("<tr>");
            sb.append(td(escape(r.path), false));
            sb.append(td(escape(r.left), r.different));
            sb.append(td(escape(r.right), r.different));
            sb.append("</tr>");
        }
        sb.append("</table>");
        return sb.toString();
    }

    private static String th(String s) {
        return "<th style='padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left'>" + escape(s) + "</th>";
    }

    private static String td(String s, boolean highlight) {
        String style = "padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;";
        if (highlight) style += "background:#fff3a3;"; // 黄底
        return "<td style='" + style + "'>" + s + "</td>";
    }

    private static String escape(String s) {
        if (s == null) return "";
        return s.replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }


    // 追加：多份 JSON 对比（N 列）
// highlight 规则：与第 0 份不同的单元格标黄；如果你想“只要有差异就全行标黄”，也可以调整。
    public static DiffResult diffToHtml(List<?> payloads, List<String> labels) throws Exception {
        if (payloads == null || payloads.size() < 2) {
            throw new IllegalArgumentException("payloads 至少需要 2 份");
        }
        if (labels == null || labels.size() != payloads.size()) {
            throw new IllegalArgumentException("labels 数量必须与 payloads 一致");
        }

        // 1) 统一转 JsonNode
        List<JsonNode> nodes = new ArrayList<JsonNode>(payloads.size());
        for (Object p : payloads) {
            nodes.add(toJsonNode(p));
        }

        // 2) 收集所有路径（Path union）
        TreeSet<String> allPaths = new TreeSet<String>();
        for (int i = 0; i < nodes.size(); i++) {
            collectPaths("$", nodes.get(i), allPaths);
        }

        // 3) 组装 rows（DiffRow 的 left/right 字段这次不够用，所以把整行值拼到 html 里）
        //    为了复用你 DiffResult 结构：rows 里只放“是否不同”的标记 + path
        List<DiffRow> rows = new ArrayList<DiffRow>(allPaths.size());
        for (String path : allPaths) {
            boolean different = isDifferentComparedToBase(path, nodes);
            rows.add(new DiffRow(path, "", "", different));
        }

        // 4) 生成 HTML（多列）
        String html = buildHtmlTableMulti(allPaths, nodes, labels);
        return new DiffResult(html, rows);
    }

    private static boolean isDifferentComparedToBase(String path, List<JsonNode> nodes) {
        JsonNode base = getByPath(nodes.get(0), path);
        for (int i = 1; i < nodes.size(); i++) {
            JsonNode cur = getByPath(nodes.get(i), path);
            if (!valueEqual(base, cur)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 收集所有叶子路径：对象/数组一路展开，值节点落地为路径
     */
    private static void collectPaths(String path, JsonNode node, Set<String> out) {
        if (node == null || node.isMissingNode()) {
            out.add(path);
            return;
        }
        if (node.isObject()) {
            TreeSet<String> fields = new TreeSet<String>();
            node.fieldNames().forEachRemaining(fields::add);
            if (fields.isEmpty()) out.add(path);

            for (String f : fields) {
                collectPaths(path + "." + f, node.get(f), out);
            }
            return;
        }
        if (node.isArray()) {
            int size = node.size();
            if (size == 0) {
                out.add(path);
                return;
            }
            for (int i = 0; i < size; i++) {
                collectPaths(path + "[" + i + "]", node.get(i), out);
            }
            return;
        }
        // 值节点
        out.add(path);
    }

    /**
     * 简易 path 取值：支持 $.a.b[0].c
     * path 以 "$" 开头
     */
    private static JsonNode getByPath(JsonNode root, String path) {
        if (root == null || path == null || path.isEmpty()) return null;
        if ("$".equals(path)) return root;

        String p = path;
        if (p.startsWith("$.")) p = p.substring(2);
        else if (p.startsWith("$")) p = p.substring(1);

        JsonNode cur = root;
        int i = 0;
        while (i < p.length() && cur != null) {
            // 读 field 名
            StringBuilder field = new StringBuilder();
            while (i < p.length()) {
                char c = p.charAt(i);
                if (c == '.' || c == '[') break;
                field.append(c);
                i++;
            }
            if (field.length() > 0) {
                cur = cur.get(field.toString());
            }

            // 读数组下标（可重复）
            while (i < p.length() && p.charAt(i) == '[') {
                int end = p.indexOf(']', i);
                if (end < 0) return null;
                String idxStr = p.substring(i + 1, end);
                int idx = Integer.parseInt(idxStr);
                if (cur == null || !cur.isArray() || idx >= cur.size()) return null;
                cur = cur.get(idx);
                i = end + 1;
            }

            // 跳过 '.'
            if (i < p.length() && p.charAt(i) == '.') i++;
        }
        return cur;
    }

    private static String buildHtmlTableMulti(Set<String> paths,
                                              List<JsonNode> nodes,
                                              List<String> labels) {
        StringBuilder sb = new StringBuilder();
        sb.append("<table style='border-collapse:collapse;font-family:Arial,Helvetica,sans-serif;font-size:14px'>");

        // header
        sb.append("<tr>");
        sb.append(th("Path"));
        for (String label : labels) {
            sb.append(th(label));
        }
        sb.append("</tr>");

        // rows
        for (String path : paths) {
            sb.append("<tr>");
            sb.append(td(escape(path), false));

            JsonNode base = getByPath(nodes.get(0), path);
            String baseText = escape(format(base));

            for (int i = 0; i < nodes.size(); i++) {
                JsonNode cur = getByPath(nodes.get(i), path);
                String curText = escape(format(cur));

                // 高亮规则：除第0列外，只要与基准不一致就标黄（第0列永远不标黄）
                boolean highlight = (i != 0) && !valueEqual(base, cur);
                sb.append(td(curText, highlight));
            }

            sb.append("</tr>");
        }

        sb.append("</table>");
        return sb.toString();
    }


}
