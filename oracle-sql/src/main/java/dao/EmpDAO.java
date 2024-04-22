package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import vo.Emp;

public class EmpDAO {
    public static ArrayList<HashMap<String, String>> selectJobCaseList() throws Exception {
        ArrayList<HashMap<String, String>> result = new ArrayList<HashMap<String, String>>();

        Connection conn = DBHelper.getConnection();
        String sql = "SELECT" + " ename, job," + " CASE" + " WHEN job = 'MANAGER' THEN '매니저'" + " WHEN job = 'ANALYST' THEN '분석가'" + " WHEN job = 'CLERK' THEN '점원'" + " ELSE '인턴' END 직무" + " FROM emp"
                + " ORDER BY" + " (CASE" + " WHEN 직무 = '매니저' THEN 1" + " WHEN 직무 = '분석가' THEN 2" + " WHEN 직무 = '점원' THEN 3" + " ELSE 4 END)" + " ASC";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            HashMap<String, String> map = new HashMap<String, String>();
            map.put("ename", rs.getString("ename"));
            map.put("job", rs.getString("job"));
            map.put("직무", rs.getString("직무"));
            result.add(map);
        }

        conn.close();

        return result;
    }

    public static ArrayList<HashMap<String, Integer>> selectDeptNoCntList() throws Exception {
        ArrayList<HashMap<String, Integer>> result = new ArrayList<HashMap<String, Integer>>();

        Connection conn = DBHelper.getConnection();
        String sql = "SELECT deptno deptNo, COUNT(*) cnt FROM emp WHERE deptno IS NOT NULL GROUP BY deptno ORDER BY deptno ASC";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            HashMap<String, Integer> map = new HashMap<>();
            map.put("deptNo", rs.getInt("deptNo"));
            map.put("cnt", rs.getInt("cnt"));
            result.add(map);
        }

        conn.close();

        return result;
    }

    public static ArrayList<Integer> selelctDeptNoList() throws Exception {
        ArrayList<Integer> result = new ArrayList<>();

        Connection conn = DBHelper.getConnection();
        String sql = "SELECT DISTINCT deptno deptNo" + " FROM emp" + " WHERE deptno IS NOT NULL" + " ORDER BY deptno ASC";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Integer deptNo = rs.getInt("deptNo");
            result.add(deptNo);
        }

        conn.close();

        return result;
    }

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
            e.setEmpNo(rs.getInt("empNo"));
            e.setEname(rs.getString("ename"));
            e.setSal(rs.getDouble("sal"));
            list.add(e);
        }

        conn.close();

        return list;
    }
}
