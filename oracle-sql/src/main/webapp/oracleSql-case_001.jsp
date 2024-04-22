<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<!-- CONTROLER -->
<%
    ArrayList<HashMap<String, String>> list = EmpDAO.selectJobCaseList();
%>

<!-- VIEW -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Case - Query예제_001</title>
</head>
<body>
    <h1>Job Case List</h1>
    <table border="1">
        <tr>
            <th>ename</th>
            <th>job</th>
            <th>직무</th>
        </tr>
        <%
            for (HashMap<String, String> map : list) {
                %>
                    <tr>
                        <td><%=map.get("ename")%></td>
                        <td><%=map.get("job")%></td>
                        <td><%=map.get("직무")%></td>
                    </tr>
                <%
            }
        %>
    </table>
</body>
</html>