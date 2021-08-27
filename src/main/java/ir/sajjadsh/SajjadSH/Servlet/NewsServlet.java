package ir.sajjadsh.SajjadSH.Servlet;


import ir.sajjadsh.SajjadSH.Database.GetNews;
import ir.sajjadsh.SajjadSH.GetValueInter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "news", value = "/news")
public class NewsServlet extends HttpServlet {
    public void init() throws ServletException {

    }


    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String date = (String) req.getParameter("newsdate");

        if (null == date ){
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
            LocalDateTime now = LocalDateTime.now();
            req.setAttribute("newsdate",dtf.format(now));
        }else {
            req.setAttribute("newsdate",date);
        }

//        new GetNews(new GetValueInter() {
//            @Override
//            public void getItemSize(int size) {
//                req.setAttribute("lengthnews",size);
//            }
//        }).getLength();
        RequestDispatcher dispatcher = req.getRequestDispatcher("/news.jsp");
        dispatcher.forward(req,resp);


    }

    public void destroy() {
    }
}
