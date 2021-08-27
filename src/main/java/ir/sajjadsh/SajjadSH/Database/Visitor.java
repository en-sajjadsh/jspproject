package ir.sajjadsh.SajjadSH.Database;

import ir.sajjadsh.SajjadSH.Model.NewsModel;
import okhttp3.*;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Visitor {
    private String name;
    private static Visitor visitor = new Visitor();
    int num = 0;


    private Visitor() {
    }

    public static Visitor getInstance(){
        return visitor;
    }


    public void getandsaveInfo(String name){
        HashMap<String,String> map=new HashMap<String,String>();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        OkHttpClient client = new OkHttpClient();
        HttpUrl.Builder builder = HttpUrl.parse("https://api.ipdata.co/").newBuilder();
        builder.addQueryParameter("api-key", "3dbd937ec61de2fe521224050e39dcec18b610d2a498fb686106b9e0");
        String url = builder.build().toString();
        Request reqnews = new Request.Builder()
                .url(url)
                .get()
                .build();
        client.newCall(reqnews).enqueue(new Callback() {
            @Override
            public void onFailure(@NotNull Call call, @NotNull IOException e) {

            }

            @Override
            public void onResponse(@NotNull Call call, @NotNull Response response) throws IOException {
                String str = response.body().string();
                JSONObject object = new JSONObject(str);
                JSONArray array = (JSONArray) object.get("languages");
                JSONObject obj = array.getJSONObject(0);
                num++;
                if (num == 3) {
                    try {
                        Connection con = Connect.getInstance().connection();
                        PreparedStatement stmt1 = con.prepareStatement("insert into visitor (ip, name, city, country, continent, language, language1, date)  values (?,?,?,?,?,?,?,?)");
                        stmt1.setString(1, object.getString("ip"));
                        stmt1.setString(2, name);
                        try {
                            stmt1.setString(3, object.getString("city"));
                        } catch (Exception e) {
                            stmt1.setString(3, "null");
                        }
                        stmt1.setString(4, object.getString("country_name"));
                        stmt1.setString(5, object.getString("continent_name"));
                        stmt1.setString(6, obj.getString("name"));
                        stmt1.setString(7, obj.getString("native"));
                        stmt1.setString(8, dtf.format(now));
                        stmt1.executeUpdate();
                        num = 0;
                    } catch (Exception e) {
                        e.getMessage();
                    }
                }
            }
        });
    }

}
