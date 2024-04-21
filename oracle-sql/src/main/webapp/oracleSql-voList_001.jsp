<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<!-- CONTROLER -->
<%
    ArrayList<Dept> dList = DeptDAO.selectDeptList();
    ArrayList<Emp> eList = EmpDAO.selectEmpList();
%>

<%
    ArrayList<HashMap<String, Object>> dOnOffList = DeptDAO.selectDeptOnOffList();
    ArrayList<HashMap<String, Object>> empInnerJoinDeptList = EmpDAO.selectEmpInnerJoinDeptList();
%>

<!-- VIEW -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>VO or Map - Query예제_001</title>
</head>
<body>
    <h1>Dept List</h1>
    <table border="1">
        <tr>
            <th>deptNo</th>
            <th>dname</th>
            <th>loc</th>
        </tr>
        <%
            for (Dept d : dList ) {
                %>
                    <tr>
                        <td><%=d.getDeptNo()%></td>
                        <td><%=d.getDname()%></td>
                        <td><%=d.getLoc()%></td>
                    </tr>
                <%
            }
        %>
    </table>
    
    <h1>Emp List</h1>
    <table border="1">
        <tr>
            <th>empNo</th>
            <th>ename</th>
            <th>sal</th>
        </tr>
        <%
            for (Emp e : eList ) {
                %>
                    <tr>
                        <td><%=e.getEmpNo()%></td>
                        <td><%=e.getEname()%></td>
                        <td><%=e.getSal()%></td>
                    </tr>
                <%
            }
        %>
    </table>
    
    <h1>Dept OnOff List</h1>
    <table border="1">
        <tr>
            <th>deptNo</th>
            <th>dname</th>
            <th>loc</th>
            <th>OnOff</th>
        </tr>
        <%
            for (HashMap<String, Object> m : dOnOffList ) {
                %>
                    <tr>
                        <td><%=(Integer)(m.get("deptNo"))%></td>
                        <td><%=(String)(m.get("dname"))%></td>
                        <td><%=(String)(m.get("loc"))%></td>
                        <td><%=(String)(m.get("OnOff"))%></td>
                    </tr>
                <%
            }
        %>
    </table>
    
    <h1>Emp Inner Join Dept List</h1>
    <table border="1">
        <tr>
            <th>empNo</th>
            <th>ename</th>
            <th>sal</th>
            <th>deptNo</th>
            <th>deptName</th>
        </tr>
        <%
            for (HashMap<String, Object> m : empInnerJoinDeptList ) {
                %>
                    <tr>
                        <td><%=(Integer)(m.get("empNo"))%></td>
                        <td><%=(String)(m.get("empName"))%></td>
                        <td><%=(Double)(m.get("empSal"))%></td>
                        <td><%=(Integer)(m.get("empDeptNo"))%></td>
                        <td><%=(String)(m.get("dName"))%></td>
                    </tr>
                <%
            }
        %>
    </table>
</body>
</html>