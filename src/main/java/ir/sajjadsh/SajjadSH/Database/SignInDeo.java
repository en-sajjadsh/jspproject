package ir.sajjadsh.SajjadSH.Database;

import ir.sajjadsh.SajjadSH.Model.ModelUser;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class SignInDeo {
    private static ResultSet rs;
    private static boolean status = false;
    private static ModelUser model = new ModelUser();

    public static boolean validate(String user,String pass){
        try {
            Connection con = Connect.getInstance().connection();
            PreparedStatement statement = con.prepareStatement("SELECT * from pw_user where username=? and password=?");
            statement.setString(1,user);
            statement.setString(2,pass);

            rs = statement.executeQuery();
            status = rs.next();
        }catch (Exception ex){
            System.out.println(ex.getMessage());
        }
        return status;
    }

    public static ModelUser getInfo(String user, String pass){
        ResultSet rs1;
        try {
            Connection con = Connect.getInstance().connection();
            PreparedStatement statement = con.prepareStatement("SELECT * from pw_user where username=? and password=?");
            statement.setString(1,user);
            statement.setString(2,pass);
            rs = statement.executeQuery();
            while (rs.next()){
                model.setId(rs.getInt("id_user"));
                model.setUser(rs.getString("username"));
            }

            PreparedStatement statement1 = con.prepareStatement("SELECT * from user where id = ?");
            statement1.setInt(1,model.getId());
            rs1 = statement1.executeQuery();
            while (rs1.next()){
                model.setName(rs1.getString("name"));
                model.setEmail(rs1.getString("email"));
            }
            DateTimeFormatter dtfd = DateTimeFormatter.ofPattern("DD");
            LocalDateTime now = LocalDateTime.now();
            model.setTimeDay(Integer.parseInt(dtfd.format(now)));
            System.out.println(model);
            System.out.println("1");

        }catch (Exception ex){
        }
        return model;
    }
}
