package ir.sajjadsh.SajjadSH.Database;

import ir.sajjadsh.SajjadSH.Model.ModelLearn;
import ir.sajjadsh.SajjadSH.Model.ModelUser;
import ir.sajjadsh.SajjadSH.Model.ModelVideo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class GetLearnVideos {
    private static ResultSet rs;
    private static List<ModelLearn> list = new ArrayList<>();
    private static Connection con = null;

    public static List<ModelLearn> getInfo(String service , String page) throws SQLException {
        ModelLearn model = new ModelLearn();
        int page1 , service1 = 0;
        try {
            list.clear();
            con = Connect.getInstance().connection();
            if (service == null) {
                if (page == "0" || page == null) {
                    page1 = 0;
                }else {
                    page1 = Integer.parseInt(page);
                }
                PreparedStatement statement = con.prepareStatement("select * from learn LIMIT ? , 10");
                statement.setInt(1,page1);
                rs = statement.executeQuery();
                while (rs.next()){
                    model.setId(rs.getInt("idlearn"));
                    model.setName(rs.getString("namelearn"));
                    model.setPic(rs.getString("piclearn"));
                    model.setStudent(rs.getInt("student"));
                    model.setText(rs.getString("textlearn"));
                    model.setTeacher(rs.getString("teacherlearn"));

                    list.add(model);
                }
            }else {
                for (String strService : getTitle()){
                    if (service == strService){
                        service1 = getTitle().indexOf(service);
                    }
                }
                if (page == "0" || page == null) {
                    page1 = 0;
                }else {
                    page1 = Integer.parseInt(page);
                }
                PreparedStatement statement = con.prepareStatement("select * from learn where idservice = ? LIMIT ? , 20");
                statement.setInt(1,service1);
                statement.setInt(2,page1);
                rs = statement.executeQuery();
                while (rs.next()){
                    model.setId(rs.getInt("idlearn"));
                    model.setName(rs.getString("namelearn"));
                    model.setPic(rs.getString("piclearn"));
                    model.setStudent(rs.getInt("student"));
                    model.setText(rs.getString("textlearn"));
                    model.setTeacher(rs.getString("teacherlearn"));

                    list.add(model);
                }
            }

        }catch (Exception ex){
            System.out.println(ex.getMessage());
        }
        finally {
            con.close();
            rs.close();
        }
        return list;
    }

    public static int getLength(){
        int count = 0;
        int num = 0;
        try {
            Connection con = Connect.getInstance().connection();
            PreparedStatement statement = con.prepareStatement("select * from learn");
            rs = statement.executeQuery();
            while (rs.next()){
                count++;
            }

            num = (int) Math.ceil(count / 20);
            if (count % 20 != 0) {
                num++;
            }

        }catch (Exception ex){
        }
        return num;
    }

    private static List<String> getTitle(){
        List<String> list = new ArrayList<>();
        try {
            Connection con = Connect.getInstance().connection();
            PreparedStatement statement = con.prepareStatement("SELECT name from services");

            rs = statement.executeQuery();
            while (rs.next()){
                list.add(rs.getString("name"));
            }
        }catch (Exception ex){
        }
        return list;
    }

    public List<ModelVideo> getVideo(int id) throws SQLException {
        List<ModelVideo> list1 = new ArrayList<>();
        ModelVideo video = new ModelVideo();
        try {
            list.clear();
            con = Connect.getInstance().connection();
            PreparedStatement statement = con.prepareStatement("select * from video where idlearn = ?;");
            statement.setInt(1,id);
            rs = statement.executeQuery();
            while (rs.next()){
                video.setId(rs.getInt("id"));
                video.setName(rs.getString("name"));
                video.setVideo(rs.getString("video"));
                list1.add(video);
            }
        }catch (Exception ex){
            System.out.println(ex.getMessage());
        }
        finally {
            con.close();
            rs.close();
        }
        return list1;
    }
}
