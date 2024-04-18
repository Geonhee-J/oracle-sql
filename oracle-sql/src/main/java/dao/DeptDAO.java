package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import vo.Dept;

public class DeptDAO {
    public static ArrayList<HashMap<String, Object>> selectDeptOnOffList() throws Exception {
        ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

        Connection conn = DBHelper.getConnection();
        String sql = "select" + " deptno deptNo, dname, loc, 'ON' OnOff" + " FROM dept";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            HashMap<String, Object> map = new HashMap<>();
            map.put("deptNo", rs.getInt("deptNo"));
            map.put("dname", rs.getString("dname"));
            map.put("loc", rs.getString("loc"));
            map.put("OnOff", rs.getString("OnOff"));
            list.add(map);
        }

        conn.close();

        return list;
    }

    public static ArrayList<Dept> selectDeptList() throws Exception {
        ArrayList<Dept> list = new ArrayList<>();

        Connection conn = DBHelper.getConnection();
        String sql = "select" + " deptno deptNo, dname, loc" + " FROM dept";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Dept d = new Dept();
            d.deptNo = rs.getInt("deptNo");
            d.dname = rs.getString("dname");
            d.loc = rs.getString("loc");
            list.add(d);

        }

        conn.close();

        return list;
    }
}