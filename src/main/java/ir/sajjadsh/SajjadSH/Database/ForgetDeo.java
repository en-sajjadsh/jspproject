package ir.sajjadsh.SajjadSH.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ForgetDeo {
    private static boolean state = false;
    private static ResultSet rs , rs1;
    public static boolean checkEmail(String email){

        try {
            Connection con = Connect.getInstance().connection();
            PreparedStatement stmt1 = con.prepareStatement("select * from user where email = ?");
            stmt1.setString(1,email);

            rs = stmt1.executeQuery();
            while (rs.next()){
                state = true;
            }

        }catch (Exception ex){
        }
        return state;
    }

    public static String getPass(){
        int id = 0;
        String pass = null;
        try {
            Connection con = Connect.getInstance().connection();
            while (rs.next()){
                id = rs.getInt(1);
            }
            PreparedStatement stmt1 = con.prepareStatement("select * from pw_user where id_user = ?");
            stmt1.setInt(1,id);

            rs1 = stmt1.executeQuery();
            while (rs1.next()){
                pass = rs1.getString(4);
            }
        }catch (Exception ex){
        }
        return pass;
    }
}
