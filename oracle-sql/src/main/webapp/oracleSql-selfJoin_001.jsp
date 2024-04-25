<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<!-- CONTROLER -->
<%
    ArrayList<HashMap<String, Object>> list = EmpDAO.selectEmpSelfJoin();
%>

<!-- VIEW -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Join - Query예제_001</title>
</head>
<body>
    <h1>직원 담당 매니저</h1>
    <table border="1">
        <tr>
            <th>empno</th>
            <th>ename</th>
            <th>grade</th>
            <th>mgrName</th>
            <th>mgrGrade</th>
        </tr>
        <%
            for (HashMap<String, Object> m : list) {
                %>
                    <tr>
                        <td><%=m.get("empNo")%></td>
                        <td><%=m.get("ename")%></td>
                        <td>
                            <%
                                for (int i = 0; i < (Integer)(m.get("grade")); i = i + 1) {
                                    %>
                                        &#128151;
                                    <%
                                }
                            %>
                        </td>
                        <td><%=m.get("mgrName")%></td>
                        <td>
                            <%
                                for (int i = 0; i < (Integer)(m.get("mgrGrade")); i = i + 1) {
                                    %>
                                        &#128150;
                                    <%
                                }
                            %>
                        </td>
                    </tr>
                <%
            }
        %>
    </table>
</body>
</html>