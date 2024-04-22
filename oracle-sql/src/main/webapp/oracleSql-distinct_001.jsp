<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<!-- CONTROLER -->
<%
    ArrayList<Integer> list = EmpDAO.selelctDeptNoList();
    ArrayList<HashMap<String, Integer>> cntList = EmpDAO.selectDeptNoCntList();
%>

<!-- VIEW -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Distinct - Query예제_001</title>
</head>
<body>
    <h1>Dept Distinct No</h1>
    <select name="deptNo">
        <option value="">--- 선택 ---</option>
        <%
            for (Integer i : list) {
                %>
                    <option value="<%=i%>"><%=i%></option>
                <%
            }
        %>
    </select>
    <h1>DISTINCT대신 GROUP BY를 사용해야만 하는 경우</h1>
    <select>
        <option value="">--- 선택 ---</option>
        <%
            for (HashMap map : cntList) {
                %>
                        <option value="<%=map.get("deptNo")%>">
                            <%=map.get("deptNo")%>
                            (<%=map.get("cnt")%>명)
                        </option>
                <%
            }
        %>
    </select>
</body>
</html>