package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import vo.Emp;

public class EmpDAO {
    public static ArrayList<HashMap<String, Object>> selectEmpInnerJoinDeptList() throws Exception {
        ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

        Connection conn = DBHelper.getConnection();
        String sql = "select" + " emp.empno empNo, emp.ename empName, emp.sal empSal, emp.deptno empDeptNo, dept.dname dName" + " FROM emp inner join dept" + " ON emp.deptno = dept.deptno";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            HashMap<String, Object> map = new HashMap<>();
            map.put("empNo", rs.getInt("empNo"));
            map.put("empName", rs.getString("empName"));
            map.put("empSal", rs.getDouble("empSal"));
            map.put("empDeptNo", rs.getInt("empDeptNo"));
            map.put("dName", rs.getString("dName"));
            list.add(map);
        }

        conn.close();

        return list;
    }

    public static ArrayList<Emp> selectEmpList() throws Exception {
        ArrayList<Emp> list = new ArrayList<>();

        Connection conn = DBHelper.getConnection();
        String sql = "select" + " empno empNo, ename, sal" + " FROM emp";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Emp e = new Emp();
            e.empNo = rs.getInt("empNo");
            e.ename = rs.getString("ename");
            e.sal = rs.getDouble("sal");
            list.add(e);
        }

        conn.close();

        return list;
    }
}
