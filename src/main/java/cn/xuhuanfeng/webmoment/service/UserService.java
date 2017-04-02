package cn.xuhuanfeng.webmoment.service;

import cn.xuhuanfeng.webmoment.entity.User;

import java.util.List;

/**
 * Created by xuhuanfeng on 2017/3/30.
 */
public interface UserService {
    /**
     * 登录操作
     * @param user
     * @return user
     */
    public User login(User user);

    /**
     * 注册操作
     * @param user
     * @return user
     */
    public boolean register(User user);

    /**
     * 更新密码
     * @param user
     * @param password
     * @return
     */
    public boolean updatePassword(User user);

    /**
     * 更新自我介绍
     * @param user
     * @param introduction
     * @return
     */
    public boolean updateIntroduction(User user);

    /**
     * 更新头像
     * @param user
     * @param icon
     * @return
     */
    public boolean updateIcon(User user);

    /**
     * 添加订阅
     * @param ordinaryUser
     * @param publicUser
     * @return
     */
    public boolean addFollow(int ordinaryUser, int publicUser);

    /**
     * 取消订阅
     * @param ordinaryUser
     * @param publicUser
     * @return
     */
    public boolean removeFollow(int ordinaryUser, int publicUser);

    /**
     * 获得所有关注的公众号
     * @param ordinaryUser
     * @return
     */
    public List<User> getAllFollowedUser(User ordinaryUser);

    /**
     * 获得所有的公众号
     * @return
     */
    public List<User> getAllPubicUser(User user);

    /**
     * 获得公众号所有的关注者
     * @param publicUser
     * @return
     */
    public List<User> getAllFollowerUser(User publicUser);
}
