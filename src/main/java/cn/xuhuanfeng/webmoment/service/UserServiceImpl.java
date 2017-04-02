package cn.xuhuanfeng.webmoment.service;

import cn.xuhuanfeng.webmoment.dao.UserDao;
import cn.xuhuanfeng.webmoment.entity.User;
import cn.xuhuanfeng.webmoment.utils.SQLFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import java.util.List;

/**
 * Created by xuhuanfeng on 2017/3/30.
 * UserService的实现类
 */

public class UserServiceImpl implements UserService{

    private static Logger logger = Logger.getLogger(UserServiceImpl.class);

    private SqlSessionFactory sqlSessionFactory = SQLFactory.getInstance();
    private SqlSession session ;
    private UserDao userDao;

    public User login(User user) {
        initUserDao();
        User resUser = userDao.login(user);
        commit();
        logger.info("用户尝试登录 id " + user.getPhone() +" 登录结果 " + (resUser != null));
        return resUser;
    }

    public boolean register(User user) {

        initUserDao();
        boolean result = userDao.register(user);
        commit();
        logger.info("新用户注册 " + user.getUid() +"  " + user.getNickname() +" 结果 " + result);
        return result;
    }

    public boolean updatePassword(User user) {
        initUserDao();
        boolean result = userDao.updatePassword(user);
        commit();
        logger.info("用户 " + user.getNickname() +" id " + user.getUid() + "更新密码 " + result);
        return  result;
    }

    public boolean updateIntroduction(User user) {

        initUserDao();
        boolean result = userDao.updateIntroduction(user);
        commit();
        logger.info("用户 " + user.getNickname() +" id " + user.getUid() +" 更改自我介绍，结果 " + result);
        return result;
    }

    private void commit() {
        session.commit();
        session.close();
    }

    public boolean updateIcon(User user) {

        initUserDao();
        boolean result = userDao.updateIcon(user);
        commit();
        logger.info("用户 " + user.getNickname() +" id " + user.getUid() + " 更新头像 " + result);
        return result;
    }

    private void initUserDao() {
        session = sqlSessionFactory.openSession();
        userDao = session.getMapper(UserDao.class);
    }

    public boolean addFollow(int ordinaryUser, int publicUser) {
        initUserDao();
        boolean result = userDao.addFollow(ordinaryUser, publicUser);
        commit();
        logger.info("用户 " + ordinaryUser + " 订阅 "
                + " " + publicUser + "  "+ result);
        return result;
    }

    public boolean removeFollow(int ordinaryUser, int publicUser) {

        initUserDao();
        boolean result = userDao.removeFollow(ordinaryUser, publicUser);
        commit();
        logger.info("用户 " + ordinaryUser + " 取消订阅 "
                + " " + publicUser + "  "+ result);
        return result;
    }

    public List<User> getAllFollowedUser(User ordinaryUser) {

        initUserDao();
        List<User> followedUsers = userDao.getAllFollowedUser(ordinaryUser);
        commit();
        logger.info("用户 " + ordinaryUser.getNickname() +" id " + ordinaryUser.getUid() + " 查看关注的公众号 ");
        return followedUsers;
    }

    public List<User> getAllPubicUser(User user) {

        initUserDao();
        List<User> publicUsers = userDao.getAllPubicUser(user);
        commit();
        logger.info("查看所有的公众号");
        return publicUsers;
    }

    public List<User> getAllFollowerUser(User publicUser) {

        initUserDao();
        List<User> followerUsers = userDao.getAllFollowerUser(publicUser);
        commit();
        logger.info("公众号用户 " + publicUser.getNickname() +" id " + publicUser.getUid() + " 查看关注的用户");
        return followerUsers;
    }
}
