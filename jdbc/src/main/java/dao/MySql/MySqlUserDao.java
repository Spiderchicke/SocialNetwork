package dao.MySql;

import dao.UserDao;
import lombok.SneakyThrows;
import lombok.extern.java.Log;
import model.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Collection;
import java.util.HashSet;
import java.util.function.Supplier;

/**
 * Created by Aleksandr_Shakhov on 29.10.16 15:58.
 */

@Log
public class MySqlUserDao implements UserDao {

    private Supplier<Connection> connectionSupplier;

    @SneakyThrows
    @Override
    public Collection<User> getAll() {

        Collection<User> users = new HashSet<>();

        try(Connection connection = connectionSupplier.get();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT id, email, firstName, lastName, avatar FROM user")) {
            while(resultSet.next()){
                users.add(new User(resultSet.getLong("id"),
                                resultSet.getString("email"),
                                resultSet.getString("password"),
                                resultSet.getString("firstName"),
                                resultSet.getString("lastName"),
                                resultSet.getString("avatar")
                        ));
            }
        }
        return users;
    }
}
