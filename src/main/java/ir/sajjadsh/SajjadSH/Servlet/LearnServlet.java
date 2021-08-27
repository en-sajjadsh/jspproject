package ir.sajjadsh.SajjadSH.Servlet;

import ir.sajjadsh.SajjadSH.Database.Connect;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "learn" , value = "/learn")
public class LearnServlet extends HttpServlet {
    private static ResultSet rs;

    public void init() {
    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getParameter("name");
        String code = req.getParameter("code");

        if (url != null) {
            for (String str : getTitle()) {
                if (url.equals(str)) {
                    req.setAttribute("learnurl", url);
                    break;
                }
            }
        }
        req.setAttribute("code",code);
        req.setAttribute("learntitle", getTitle());
        RequestDispatcher dispatcher = req.getRequestDispatcher("/learn.jsp");
        dispatcher.forward(req,resp);
    }

    public void destroy() {

    }

    private List<String> getTitle(){
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
}
