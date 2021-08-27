package ir.sajjadsh.SajjadSH.Servlet;

import ir.sajjadsh.SajjadSH.Database.SignUpDeo;
import ir.sajjadsh.SajjadSH.StatusEnum;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "signup", value = "/signup")
public class SignupServlet extends HttpServlet {

    public void init() throws ServletException {
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("signup-name");
        String email = req.getParameter("signup-email");
        String user = req.getParameter("signup-username");
        String pass = req.getParameter("signup-password");


        if (SignUpDeo.insert(name,email,user,pass)){
            req.setAttribute("status", StatusEnum.Success);
            req.setAttribute("textsate", "User created successfully.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/state.jsp");
            dispatcher.forward(req,resp);
        }else {
            req.setAttribute("status", StatusEnum.SubError);
            req.setAttribute("textsate", "User not created successfully..Try again.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/state.jsp");
            dispatcher.forward(req,resp);
        }
    }


    public void destroy() {

    }
}
