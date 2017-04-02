package cn.xuhuanfeng.webmoment.dao;

import cn.xuhuanfeng.webmoment.entity.Comment;

import java.util.List;

/**
 * Created by xuhuanfeng on 2017/3/31.
 */
public interface CommentDao {

    /**
     * 增加评论
     * @param comment
     * @return
     */
    boolean addComment(Comment comment);

    /**
     * 通过评论
     * @param cid
     */
    void passComment(int cid);

    /**
     * 忽略评论
     * @param cid
     */
    void ignoreComment(int cid);

    /**
     * 获得文章已通过的所有评论
     * @param eid
     * @return
     */
    List<Comment> getPassedComment(int eid);

    /**
     * 获得文章所有未通过的评论
     * @param eid
     * @return
     */
    List<Comment> getUnpassedComment(int eid);
}
