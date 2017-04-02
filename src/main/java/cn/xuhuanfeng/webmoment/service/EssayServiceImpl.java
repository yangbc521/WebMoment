package cn.xuhuanfeng.webmoment.service;

import cn.xuhuanfeng.webmoment.dao.EssayDao;
import cn.xuhuanfeng.webmoment.entity.Essay;
import cn.xuhuanfeng.webmoment.utils.SQLFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import java.util.List;

/**
 * Created by xuhuanfeng on 2017/3/30.
 */
public class EssayServiceImpl implements EssayService {

    private static Logger logger = Logger.getLogger(EssayServiceImpl.class);

    private SqlSessionFactory sqlSessionFactory = SQLFactory.getInstance();
    private SqlSession session ;
    private EssayDao essayDao;


    public boolean publishEssay(Essay essay) {
        initUserDao();
        boolean result = essayDao.publishEssay(essay);
        session.commit();
        session.close();
        logger.info(essay.getPublisher() + " 发布了文章 " + essay.getTitle());
        return result;
    }

    public boolean deleteEssay(String uid, String eid) {
        initUserDao();
        boolean result = essayDao.deleteEssay(uid, eid);
        session.commit();
        session.close();
        logger.info(uid +  "  删除了文章  " + eid );
        return result;
    }

    public List<Essay> getEssayByPublisher(String uid) {
        initUserDao();
        List<Essay> essays = essayDao.getEssayByPublisher(uid);
        logger.info(uid + " 获取所有的文章 " );
        return essays;
    }

    private void initUserDao() {
        session = sqlSessionFactory.openSession();
        essayDao = session.getMapper(EssayDao.class);
    }
}
