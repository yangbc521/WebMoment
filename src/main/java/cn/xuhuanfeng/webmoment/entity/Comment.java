package cn.xuhuanfeng.webmoment.entity;

import java.util.Date;

/**
 * Created by xuhuanfeng on 2017/3/31.
 */
public class Comment {

    private int cid;
    private int eid;
    private String content;
    private int author;
    private Date publishtime;
    private String pass;

    @Override
    public String toString() {
        return "Comment{" +
                "cid=" + cid +
                ", eid=" + eid +
                ", conent='" + content + '\'' +
                ", author=" + author +
                ", publishtime=" + publishtime +
                ", pass='" + pass + '\'' +
                '}';
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String conent) {
        this.content = conent;
    }

    public int getAuthor() {
        return author;
    }

    public void setAuthor(int author) {
        this.author = author;
    }

    public Date getPublishtime() {
        return publishtime;
    }

    public void setPublishtime(Date publishtime) {
        this.publishtime = publishtime;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
}
