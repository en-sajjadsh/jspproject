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

@WebServlet(name = "signin", value = "/signin")
public class SigninServlet extends HttpServlet {

    public void init() throws ServletException {

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user = req.getParameter("username");
        String pass = req.getParameter("password");
        String url = req.getServletPath();

        if (SignInDeo.validate(user,pass)){
            req.setAttribute("status", StatusEnum.Success);

            HttpSession session = req.getSession();
            ModelUser model = SignInDeo.getInfo(user, pass);
            session.setAttribute("account",model);
            req.setAttribute("load",StatusEnum.NotShow);
            RequestDispatcher dispatcher = req.getRequestDispatcher(url);
            dispatcher.forward(req,resp);
        }else {
            req.setAttribute("status", StatusEnum.EnterError);
            req.setAttribute("textsate", "username and password is increct.Try again.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/state.jsp");
            dispatcher.forward(req,resp);
        }
    }

    public void destroy() {
    }
}
