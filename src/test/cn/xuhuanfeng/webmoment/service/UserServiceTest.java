package cn.xuhuanfeng.webmoment.service;

import cn.xuhuanfeng.webmoment.entity.User;
import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Created by xuhuanfeng on 2017/3/30.
 */
public class UserServiceTest {

    @Test
    public void updatePassword() throws Exception {
    }

    @Test
    public void updateIntroduction1() throws Exception {
    }

    @Test
    public void updateIcon() throws Exception {
    }

    @Test
    public void addFollow() throws Exception {
    }

    @Test
    public void removeFollow() throws Exception {
    }

    @Test
    public void getAllFollowedUser() throws Exception {
    }

    @Test
    public void getAllPubicUser() throws Exception {
    }

    @Test
    public void getAllFollowerUser() throws Exception {
    }

    UserService userService = new UserServiceImpl();

    @Test
    public void login() throws Exception {

        User user = new User();
        user.setPassword("huanfeng");
        user.setPhone("15889610395");
        System.out.println(userService.login(user));

    }

    @Test
    public void register() throws Exception {
    }

    @Test
    public void updateIntroduction() throws Exception {
    }

}