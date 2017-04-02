package cn.xuhuanfeng.webmoment.dao;

import cn.xuhuanfeng.webmoment.entity.Essay;

import java.util.List;

/**
 * Created by xuhuanfeng on 2017/3/30.
 */
public interface EssayDao {

    /**
     * 发布文章
     * @param essay
     * @return
     */
    boolean publishEssay(Essay essay);

    /**
     * 删除文章
     * @param eid
     * @return
     */
    boolean deleteEssay(String uid, String eid);

    /**
     * 获取某个公众号的所有文章
     * @param uid
     * @return
     */
    List<Essay> getEssayByPublisher(String uid);

}
