<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<!-- CONTROLER -->
<%
    // 파라미터로 정렬할 컬럼, 정렬순서 받기
    String col = request.getParameter("col");
    String sort = request.getParameter("sort");
    // System.out.println("col : " + col + " / sort : " + sort);
    
    // 파라미터로 받아온 값을 보내고, DB에서 데이터 받아오기
    ArrayList<Emp> list = EmpDAO.selectEmpListSort(col, sort);
    // System.out.println("list : " + list.size());
%>

<!-- VIEW -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OrderBy - Query예제_001</title>
</head>
<body>
    <h1>Emp OrderBy</h1>
    <table border="1">
        <tr>
            <th>
                empno
                <a href="./oracleSql-orderBy_001.jsp?col=empno&sort=asc">오름차순</a>
                <a href="./oracleSql-orderBy_001.jsp?col=empno&sort=desc">내림차순</a>
            </th>
            <th>
                ename
                <a href="./oracleSql-orderBy_001.jsp?col=ename&sort=asc">오름차순</a>
                <a href="./oracleSql-orderBy_001.jsp?col=ename&sort=desc">내림차순</a>
            </th>
        </tr>
        <%
            for (Emp e : list) {
                %>
                    <tr>
                        <td><%=e.getEmpNo()%></td>
                        <td><%=e.getEname()%></td>
                    </tr>
                <%
            }
        %>
    </table>
</body>
</html>