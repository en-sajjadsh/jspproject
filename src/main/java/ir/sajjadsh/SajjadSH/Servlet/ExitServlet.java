package ir.sajjadsh.SajjadSH.Servlet;

import ir.sajjadsh.SajjadSH.Database.SignInDeo;
import ir.sajjadsh.SajjadSH.Model.ModelUser;
import ir.sajjadsh.SajjadSH.StatusEnum;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;


@WebServlet(name = "exit", value = "/exit")
public class ExitServlet extends HttpServlet {

    public void init() throws ServletException {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        HttpSession session = req.getSession();
        session.removeAttribute("account");
        session.invalidate();
        PrintWriter out = resp.getWriter();
        out.print("<script language='JavaScript'>alert('You have successfully logged out of your account');</script>");
        RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
        dispatcher.forward(req,resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }

    public void destroy() {
    }
}
