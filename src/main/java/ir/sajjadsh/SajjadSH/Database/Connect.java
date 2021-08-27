package ir.sajjadsh.SajjadSH.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {
    private static Connect cons = new Connect();

    private Connect(){}

    public static Connect getInstance(){
        return cons;
    }

    public Connection connection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/SajjadSH";
        String user = "sajjad";
        String pass = "32419";
        Connection con = DriverManager.getConnection(url,user,pass);
        return con;
    }
}
