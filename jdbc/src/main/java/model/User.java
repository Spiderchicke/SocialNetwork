package model;

import lombok.AllArgsConstructor;
import lombok.Value;

/**
 * Created by Aleksandr_Shakhov on 29.10.16 15:58.
 */

@Value
@AllArgsConstructor
public class User {
    private long id;
    private String email;
    private String password;
    private String firstName;
    private String lastName;
    private String avatar;
}
