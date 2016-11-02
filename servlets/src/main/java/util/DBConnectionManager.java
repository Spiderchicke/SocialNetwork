package util;

import common.ConnectionPool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.function.Supplier;

/**
 * Created by Aleksandr_Shakhov on 31.10.16 21:06.
 */


public class DBConnectionManager {

    private Connection connection;

    public DBConnectionManager(String dbURL, String user, String pwd) throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        this.connection = DriverManager.getConnection(dbURL, user, pwd);
    }

    public Connection getConnection(){
        return this.connection;
    }
}
