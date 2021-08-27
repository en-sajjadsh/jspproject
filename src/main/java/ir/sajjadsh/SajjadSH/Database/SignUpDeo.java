package ir.sajjadsh.SajjadSH.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class SignUpDeo {
    private static boolean state = false;
    public static boolean insert(String name,String email,String user,String pass){
        ResultSet rs = null;
        int candidateId = 0;

        try {
            Connection con = Connect.getInstance().connection();
            PreparedStatement stmt1 = con.prepareStatement("insert into user (name, email) values (?,?)", Statement.RETURN_GENERATED_KEYS);
            stmt1.setString(1,name);
            stmt1.setString(2,email);

            int rowAffected = stmt1.executeUpdate();
            if(rowAffected == 1)
            {
                // get candidate id
                rs = stmt1.getGeneratedKeys();
                if(rs.next())
                    candidateId = rs.getInt(1);

            }

            PreparedStatement stmt2 = con.prepareStatement("insert into pw_user (id_user, username, password) values (?,?,?)",Statement.RETURN_GENERATED_KEYS);
            stmt2.setInt(1,candidateId);
            stmt2.setString(2,user);
            stmt2.setString(3,pass);

            int x2 = stmt2.executeUpdate();
            if (x2 == 1){
                state = true;
            }


        }catch (Exception ex){
            System.out.println(ex.getMessage());
        }
        return state;
    }
}
