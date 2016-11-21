package usermanager.service;

import org.springframework.transaction.annotation.Transactional;
import usermanager.dao.UserDao;
import usermanager.model.User;

import java.util.List;

public class UserServiceImpl implements UserService {

    private UserDao userDao;

    @Transactional
    public List<User> getListUsersByName(String s) {return this.userDao.getListUsersByName(s);}

    @Transactional
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Transactional
    public void addUser(User user) {
        userDao.addUser(user);
    }

    @Transactional
    public void removeUser(int id) {
        userDao.removeUser(id);
    }

    @Transactional
    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    @Transactional
    public User getUserById(int id) {
        return userDao.getUserById(id);
    }

    @Transactional
    public List<User> getListUsers() {
        return userDao.getListUsers();
    }
}
