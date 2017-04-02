package cn.xuhuanfeng.webmoment.dao;

import cn.xuhuanfeng.webmoment.entity.User;

import java.util.List;

/**
 * Created by xuhuanfeng on 2017/3/30.
 */
public interface UserDao {

     User login(User user);
     boolean register(User user);

     boolean updatePassword(User user);
     boolean updateIntroduction(User user);
     boolean updateIcon(User user);

     boolean addFollow(int ordinaryUser, int publicUser);
     boolean removeFollow(int ordinaryUser, int publicUser);

     List<User> getAllFollowedUser(User ordinaryUser);
     List<User> getAllPubicUser(User user);
     List<User> getAllFollowerUser(User publicUser);
}
