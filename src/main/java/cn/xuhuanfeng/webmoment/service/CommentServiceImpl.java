package cn.xuhuanfeng.webmoment.service;

import cn.xuhuanfeng.webmoment.dao.CommentDao;
import cn.xuhuanfeng.webmoment.entity.Comment;
import cn.xuhuanfeng.webmoment.utils.SQLFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import java.util.List;

/**
 * Created by xuhuanfeng on 2017/3/31.
 */
public class CommentServiceImpl implements CommentService {

    private static Logger logger = Logger.getLogger(CommentServiceImpl.class);
    private CommentDao commentDao;
    private SqlSessionFactory sqlSessionFactory = SQLFactory.getInstance();
    private SqlSession session ;

    public boolean addComment(Comment comment) {
        initCommentDao();
        boolean result = commentDao.addComment(comment);
        session.commit();
        session.close();
        logger.info(comment.getAuthor() + " 对文章 " + comment.getEid() +"  发布评论  " + result);
        return result;
    }

    public void passComment(int cid) {
        initCommentDao();
        commentDao.passComment(cid);
        logger.info("通过评论 " + cid);
        session.commit();
        session.close();
    }

    public void ignoreComment(int cid) {
        initCommentDao();
        commentDao.ignoreComment(cid);
        logger.info("忽略评论 " + cid);
        session.commit();
        session.close();
    }

    public List<Comment> getPassedComment(int eid) {
        initCommentDao();
        List<Comment> comments = commentDao.getPassedComment(eid);
        session.commit();
        session.close();
        logger.info("获取文章" + eid + "通过的所有评论 ");
        return comments;
    }

    public List<Comment> getUnpassedComment(int eid) {
        initCommentDao();
        List<Comment> comments = commentDao.getUnpassedComment(eid);
        session.commit();
        session.close();
        logger.info("获得文章" + eid + "所有未通过评论");
        return comments;
    }

    private void initCommentDao() {
        session = sqlSessionFactory.openSession();
        commentDao = session.getMapper(CommentDao.class);
    }
}
