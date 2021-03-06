package usermanager.dao;

import usermanager.model.User;
import java.util.List;

public interface UserDao {
    public List<User> getListUsersByName(String s);
    public void addUser(User user);
    public void removeUser (int id);
    public void updateUser (User user);
    public User getUserById (int id);
    public List<User> getListUsers ();
}
