package util;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * Created by Aleksandr_Shakhov on 31.10.16 20:50.
 */
@Setter
@Getter
public class User implements Serializable {

    private static final long serialVersionUID = 6297385302078200511L;

    private long id;
    private String firstName;
    private String lastName;
    private String email;
    private String country;

    public User(long id, String firstName, String lastName, String email, String country) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.country = country;
        this.email = email;
        this.country = country;
    }
}
