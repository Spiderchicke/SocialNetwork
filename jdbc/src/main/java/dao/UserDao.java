package dao;

import model.User;

import java.util.Collection;
import java.util.Optional;

/**
 * Created by Aleksandr_Shakhov on 29.10.16 15:57.
 */


public interface UserDao {
    Collection<User> getAll();

    default Optional<User> getById(long id) {
        return getAll().stream()
                .filter(user -> user.getId() == id)
                .findAny();
    }

    default Optional<User> isUserRegistered(String login, String hash) {
        return getAll().stream()
                .filter(user -> user.getEmail().equals(login))
                .filter(user -> user.getPassword().equals(hash))
                .findAny();
    }


}
