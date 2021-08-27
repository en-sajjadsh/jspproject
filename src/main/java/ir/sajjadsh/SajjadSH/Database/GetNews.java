package ir.sajjadsh.SajjadSH.Database;

import ir.sajjadsh.SajjadSH.GetValueInter;
import ir.sajjadsh.SajjadSH.Model.NewsModel;
import ir.sajjadsh.SajjadSH.StatusEnum;
import okhttp3.*;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;


public class GetNews {
    private static String limit,offset;
    private static String date;
    private static HttpServletRequest req;
    private static HttpServletResponse res;
    private static List<NewsModel> list = new ArrayList<>();
    private static int num,number;
    private int sum = 0;



    public GetNews(HttpServletRequest req, HttpServletResponse res, String limit, String offset, String date) {
        this.req = req;
        this.res = res;
        this.limit = limit;
        this.offset = offset;
        this.date = date.replace("/","-");
    }

    public GetNews (HttpServletRequest req, HttpServletResponse res, String limit, String date){
        this.req = req;
        this.res = res;
        this.limit = limit;
        this.offset = "0";
        this.date = date.replace("/","-");
    }


    public List<NewsModel> getList(){
        OkHttpClient client = new OkHttpClient();
        HttpUrl.Builder builder = HttpUrl.parse("http://api.mediastack.com/v1/news").newBuilder();
        builder.addQueryParameter("access_key", "6fbf02afe7f4d6b5bcb82c2a20fab787");
        builder.addQueryParameter("languages","en");
        builder.addQueryParameter("limit",limit);
        builder.addQueryParameter("offset",offset);
        builder.addQueryParameter("sort","published_desc");
        builder.addQueryParameter("date",date);
        String url = builder.build().toString();
        Request reqnews = new Request.Builder()
                .url(url)
                .get()
                .build();

        client.newCall(reqnews).enqueue(new Callback() {
            @Override
            public void onFailure(@NotNull Call call, @NotNull IOException e) {
                req.setAttribute("status", StatusEnum.Error);
                req.setAttribute("textsate","The operation failed."+e.getMessage());

                RequestDispatcher dispatcher = req.getRequestDispatcher("/state.jsp");
                try {
                    dispatcher.forward(req,res);
                } catch (ServletException | IOException servletException) {
                    servletException.printStackTrace();
                }
            }

            @Override
            public void onResponse(@NotNull Call call, @NotNull Response response) throws IOException {
                String str = response.body().string();
                JSONObject object = new JSONObject(str);
                JSONArray array = (JSONArray) object.get("data");
                int len = array.length();
                for (int i = 0; i < len; i++) {
                    JSONObject obj = array.getJSONObject(i);
                    NewsModel model = new NewsModel();

                    model.setId(i);
                    try {
                        model.setAuthor(obj.getString("author"));

                    } catch (Exception e) {
                        model.setAuthor("");
                    }

                    try {
                        model.setImage(obj.getString("image"));
                    } catch (Exception e) {
                        model.setImage("");
                    }
                    model.setTitle(obj.getString("title"));
                    model.setDescription(obj.getString("description"));
                    model.setUrl(obj.getString("url"));
                    model.setCategory(obj.getString("category"));
                    String[] datetime = obj.getString("published_at").split("T");
                    model.setDate(datetime[0]);
                    model.setTime(datetime[1]);
                    list.add(model);
                }
            }
        });

        return list;
    }

    public int getLength(){
        OkHttpClient client = new OkHttpClient();
        HttpUrl.Builder builder = HttpUrl.parse("http://api.mediastack.com/v1/news").newBuilder();
        builder.addQueryParameter("access_key", "6fbf02afe7f4d6b5bcb82c2a20fab787");
        builder.addQueryParameter("languages","en");
//        builder.addQueryParameter("offset","0");
//        builder.addQueryParameter("sort","published_desc");
        builder.addQueryParameter("date",date);
        String url = builder.build().toString();
        Request reqnews = new Request.Builder()
                .url(url)
                .get()
                .build();


        client.newCall(reqnews).enqueue(new Callback() {
            @Override
            public void onFailure(@NotNull Call call, @NotNull IOException e) {
                req.setAttribute("status", StatusEnum.Error);
                req.setAttribute("textsate","The operation failed."+e.getMessage());

                RequestDispatcher dispatcher = req.getRequestDispatcher("/state.jsp");
                try {
                    dispatcher.forward(req,res);
                } catch (ServletException | IOException servletException) {
                    servletException.printStackTrace();
                }
            }

            @Override
            public void onResponse(@NotNull Call call, @NotNull Response response) throws IOException {
                String str = response.body().string();
                JSONObject object = new JSONObject(str);

                JSONObject obj = (JSONObject) object.get("pagination");
                num = Integer.valueOf(obj.getInt("total"));
                number = num / 25;
            }
        });
        return number;
    }
}
