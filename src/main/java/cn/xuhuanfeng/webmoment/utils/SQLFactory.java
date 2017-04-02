package cn.xuhuanfeng.webmoment.utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.io.InputStream;

/**
 * Created by xuhuanfeng on 2017/3/30.
 */
public class SQLFactory {

    private static SqlSessionFactory sqlSessionFactory = null;
    private static String resource = "mybatis-config.xml";
    private static Logger logger = Logger.getLogger(SQLFactory.class);
    private SQLFactory(){}

    public static SqlSessionFactory getInstance(){

        if (sqlSessionFactory == null){
            try {
                InputStream inputStream = Resources.getResourceAsStream(resource);
                sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
                inputStream.close();
            } catch (IOException e) {
                logger.error("无法加载 " + resource);
                logger.error("错误原因 " + e.getMessage());
                e.printStackTrace();
            }
        }

        return sqlSessionFactory;
    }
}
