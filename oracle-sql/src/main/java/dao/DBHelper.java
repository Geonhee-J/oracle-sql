package dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DBHelper {
    public static Connection getConnection() throws Exception {
        Class.forName("oracle.jdbc.driver.OracleDriver"); // Oracle DB 접근 클래스

        FileReader fr = new FileReader("/Users/dream/iam/auth/oracledb.properties");
        Properties prop = new Properties();
        prop.load(fr);

        String dbUrl = prop.getProperty("url");
        String dbUser = prop.getProperty("id");
        String dbPw = prop.getProperty("pw");

        Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
        return conn;
    }

    public static void main(String[] args) throws Exception {
        Connection conn = DBHelper.getConnection();
        System.out.println("oracle-sql 연결 확인 : " + conn);
    }
}
