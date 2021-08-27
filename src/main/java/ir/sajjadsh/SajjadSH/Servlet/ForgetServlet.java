package ir.sajjadsh.SajjadSH.Servlet;

import ir.sajjadsh.SajjadSH.Database.ForgetDeo;
import ir.sajjadsh.SajjadSH.StatusEnum;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;



@WebServlet(name = "forget", value = "/forget")
public class ForgetServlet extends HttpServlet {
    private static String fromUser = "shsajjad57@gmail.com";
    private static String pass = "mongh 32419";
    public void init() throws ServletException {
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email1");

        if (ForgetDeo.checkEmail(email)){
            try {
                sendMail(email,req,resp);
            } catch (MessagingException e) {
                req.setAttribute("status", StatusEnum.Error);
                req.setAttribute("textsate", e.getMessage());
                RequestDispatcher dispatcher = req.getRequestDispatcher("/state.jsp");
                dispatcher.forward(req,resp);
            }
        }else {
            req.setAttribute("status", StatusEnum.Error);
            req.setAttribute("textsate", "Email is not exist.Try again.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/state.jsp");
            dispatcher.forward(req,resp);
        }
    }

    public void destroy() {
    }

    private void sendMail(String email,HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, MessagingException {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.socketFactory.port", "465");
        properties.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromUser,pass);
            }
        });


        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(fromUser));
        message.addRecipient(Message.RecipientType.TO,new InternetAddress(email));
        message.setSubject("Request Password");
        String pass = ForgetDeo.getPass();
        if (pass != null) {
            message.setContent("<p>This is your password. Please take care of it and do not give it to anyone.</P><br><h1>" + pass + "</h1>", "text/html");

            // Send message
            Transport.send(message);
            req.setAttribute("status", StatusEnum.Success);
            req.setAttribute("textsate", "The password was successfully sent to you.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/state.jsp");
            dispatcher.forward(req,resp);
        }
    }
}
