/*
package controllers;

import common.ConnectionPool;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.function.Supplier;

*/
/**
 * Created by Aleksandr_Shakhov on 30.10.16 13:29.
 *//*


public class Register extends HttpServlet {

    private Supplier<Connection> connectionSupplier = ConnectionPool.create("/Users/alexandershakhov/Developer/SocialNetwork/jdbc/src/main/resources/db.properties");

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");

        try(Connection connection = connectionSupplier.get();
        PreparedStatement ps = connection.prepareStatement("INSERT INTO social_network.user VALUES (?,?,?,?,?);"))
        {
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setString(3, firstName);
            ps.setString(4, lastName);
            ps.setString(5,"");

            int i = ps.executeUpdate();

            if (i > 0) {
                out.println("You are successfully registered");
            }
        } catch (Exception se) {
            se.printStackTrace();
            out.println("This email has been already registered, Please user forget  password button!");
        }
    }
}
*/
