package com.awebarts.servlets;

import com.awebarts.control.DBconnection;
import com.awebarts.model.user;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class loginServlet extends HttpServlet {

    PreparedStatement pst;

    @Override
    public void init() throws ServletException {
        super.init(); //To change body of generated methods, choose Tools | Templates.
        try {
            Connection con = DBconnection.getConnect();
            pst = con.prepareStatement("select * from users where username = ? and password = ?");
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    public boolean isUser(user usr) throws Exception {
        try {
            pst.setString(1, usr.getUsr_name());
            pst.setString(2, usr.getPassword());
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return true;
            }

        } catch (Exception ex) {
            throw ex;
        }

        return false;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        user usr = new user();
        usr.setUsr_name(request.getParameter("usrname"));
        usr.setPassword(request.getParameter("password"));
        boolean isUser=false;
        try {
             isUser = isUser(usr);

        } catch (Exception ex) {
            out.print(ex.getMessage());
        }

        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            if (isUser) {
                request.getSession().setAttribute("usr", usr);
                response.sendRedirect("app/index.jsp");
            } else {
                response.sendRedirect("http://localhost:8080/awebarts_EE/app/Login.jsp");

            }
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
