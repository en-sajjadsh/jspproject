package ir.sajjadsh.SajjadSH.Servlet;

import ir.sajjadsh.SajjadSH.Database.Connect;
import ir.sajjadsh.SajjadSH.StatusEnum;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "home", value = "/home")
public class HomeServlet extends HttpServlet {

    public void init() throws ServletException {

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getAttribute("load") == null || req.getAttribute("load") == StatusEnum.Show){
            req.setAttribute("load", StatusEnum.NotShow);
        }else {}
        RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
        dispatcher.forward(req,resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("contact-name");
        String email = req.getParameter("contact-email");
        String text = req.getParameter("contact-message");

        try {
            Connection con = Connect.getInstance().connection();
            PreparedStatement  statement = con.prepareStatement("insert into comment (username,email,text) values(?,?,?)");
            // error
            statement.setString(1,name);
            statement.setString(2,email);
            statement.setString(3,text);
            int result = statement.executeUpdate();
            if (result != 0){
                req.setAttribute("status", StatusEnum.Success);
                req.setAttribute("textsate","mission accomplished.");

                RequestDispatcher dispatcher = req.getRequestDispatcher("/state.jsp");
                dispatcher.forward(req,resp);
            }
        }catch (Exception ex){
            req.setAttribute("status", StatusEnum.Error);
            req.setAttribute("textsate","The operation failed."+ex.getMessage());

            RequestDispatcher dispatcher = req.getRequestDispatcher("/state.jsp");
            dispatcher.forward(req,resp);
        }
    }

    public void destroy() {
    }
}