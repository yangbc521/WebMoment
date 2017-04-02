package cn.xuhuanfeng.webmoment.dao;

import cn.xuhuanfeng.webmoment.entity.User;
import cn.xuhuanfeng.webmoment.utils.SQLFactory;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;

import java.io.InputStream;

import static org.junit.Assert.*;

/**
 * Created by xuhuanfeng on 2017/3/30.
 * 测试UserDao
 */
public class UserDaoTest {

    @Test
    public void getAllPubicUser() throws Exception {

        /*SqlSessionFactory sqlSessionFactory = SQLFactory.getInstance();
        SqlSession session = sqlSessionFactory.openSession();
        UserDao userDao = session.getMapper(UserDao.class);
        System.out.println(userDao.getAllPubicUser());*/
    }

}