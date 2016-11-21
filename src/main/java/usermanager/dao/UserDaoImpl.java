package usermanager.dao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import usermanager.model.User;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {
    private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
    private SessionFactory sessionFactory;
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<User> getListUsersByName(String s) {
        System.out.println ("Name :"+ s);
        Session session = sessionFactory.getCurrentSession();
        List<User> userList = session.createCriteria(User.class)
                .add(Restrictions.like("name", s))
                .list();
        for (User u : userList) {
            logger.info("User list : "+u);
        }
        return userList;
    }

    public void addUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(user);
        logger.info("User was successfully saved. Details : "+user);
    }

    public void removeUser(int id) {
        Session session = sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new Integer (id));
        if (user!=null) {
            session.delete(user);
        }
        //Why do we log event, if it wasn't occurred?!
        logger.info("User was successfully removed. Details : "+user);
    }

    public void updateUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.update(user);
        logger.info("User was successfully updated. Details : "+user);
    }

    public User getUserById(int id) {
        Session session = sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, id);
        //Where is user's check?!
        logger.info("User was successfully found. Details : "+user);
        return user; //can return null!
    }

    @SuppressWarnings("uncheked") //What?! Why do we ignore exceptions?
    public List<User> getListUsers() {
        Session session = sessionFactory.getCurrentSession();
        List<User> userList = session.createQuery("from User").list();
        for (User u : userList) {
            logger.info("User list : "+u);
        }
        return userList;
    }
}
