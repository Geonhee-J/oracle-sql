<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<!-- CONTROLER -->
<%
    ArrayList<Emp> list = null;
    String[] ck = request.getParameterValues("ck");
    if (ck == null) {
        System.out.println("ck : " + ck);
    } else {
        System.out.println("ck.length : " + ck.length);
        ArrayList<Integer> ckList = new ArrayList<>();
        for (String s : ck) {
            ckList.add(Integer.parseInt(s));
        }
        list = EmpDAO.selectEmpListByGradeEmp(ckList);
        System.out.println("list : " + list.size());
    }
%>

<!-- VIEW -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>WhereIn - Query예제_001</title>
</head>
<body>
    <h1>Emp Grade Search</h1>
    <form method="post" action="./oracleSql-whereIn_001.jsp">
        <label>Grade : </label>
        <%
            for (int i = 1; i < 6; i++) {
                %>
                    <input type="checkbox" name="ck" value="<%=i%>"><%=i%>
                <%
            }
        %>
        <button type="submit">검색</button>
    </form>
    
    <h1>Result</h1>
    <%
        if (ck == null) {
            return;
        }
    %>
    <table border="1">
        <tr>
            <th>ename</th>
            <th>grade</th>
        </tr>
        <%
            for (Emp e : list) {
                %>
                    <tr>
                        <td><%=e.getEname()%></td>
                        <td><%=e.getGrade()%></td>
                    </tr>
                <%
            }
        %>
    </table>
</body>
</html>