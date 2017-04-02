package cn.xuhuanfeng.webmoment.entity;

import java.util.Date;

/**
 * Created by xuhuanfeng on 2017/3/30.
 */
public class Essay {

    private int eid;
    private String title;
    private String content;
    private String author;
    private int publisher;
    private Date publishtime;
    private int viewercount;
    private int likecount;

    @Override
    public String toString() {
        return "Essay{" +
                "eid=" + eid +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", author='" + author + '\'' +
                ", publisher='" + publisher + '\'' +
                ", publishtime=" + publishtime +
                ", viewercount=" + viewercount +
                ", likecount=" + likecount +
                '}';
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getPublisher() {
        return publisher;
    }

    public void setPublisher(int publisher) {
        this.publisher = publisher;
    }

    public Date getPublishtime() {
        return publishtime;
    }

    public void setPublishtime(Date publishtime) {
        this.publishtime = publishtime;
    }

    public int getViewercount() {
        return viewercount;
    }

    public void setViewercount(int viewercount) {
        this.viewercount = viewercount;
    }

    public int getLikecount() {
        return likecount;
    }

    public void setLikecount(int likecount) {
        this.likecount = likecount;
    }
}
