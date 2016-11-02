package servlet;

import common.ConnectionPool;
import org.apache.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by Aleksandr_Shakhov on 01.11.16 08:06.
 */

@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    static Logger logger = Logger.getLogger(RegisterServlet.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String country = request.getParameter("country");

        String errorMsg = null;

        if(firstName == null || firstName.equals(""))
            errorMsg = "Your name can't be null or empty.";
        if(lastName == null || lastName.equals(""))
            errorMsg = "Your surname can't be null or empty.";
        if(email == null || email.equals(""))
            errorMsg = "Email ID can't be null or empty.";
        if (password == null || password.equals(""))
            errorMsg = "Password can't be null or empty.";
        if (country == null || country.equals(""))
            errorMsg = "Country can't be null or empty.";

        if (errorMsg != null) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/register.html");
            PrintWriter out = response.getWriter();
            out.println("<font color=red>" + errorMsg + "</font>");
            rd.include(request, response);
        } else {
            Connection con = (Connection) getServletContext().getAttribute("DBConnection");
            PreparedStatement ps = null;
            try {
                ps = con.prepareStatement("INSERT INTO Users(firstName, lastName, email, password, country) VALUES (?,?,?,?,?)");
                ps.setString(1, firstName);
                ps.setString(2, lastName);
                ps.setString(3, email);
                ps.setString(4, password);
                ps.setString(5, country);

                ps.execute();

                logger.info("User registered with email = " + email);

                //forward to login page to login
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.html");
                PrintWriter out = response.getWriter();
                out.println("<br><br><br><p align = center><font color=\"#ffe4b5\" size=\"3\" style=\"align-self: auto\">Registration successful, please login below.</font></p>");
                rd.include(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                logger.error("Database connection problem");
                throw new ServletException("DB Connection problem.");
            } finally {
                try {
                    ps.close();
                } catch (SQLException e) {
                    logger.error("SQLException in closing PreparedStatement");
                }
            }
        }
    }
}
