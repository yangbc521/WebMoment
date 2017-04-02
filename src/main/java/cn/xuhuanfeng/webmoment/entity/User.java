package cn.xuhuanfeng.webmoment.entity;

import java.util.Date;

/**
 * Created by xuhuanfeng on 2017/3/30.
 */
public class User {

    private String email;
    private String icon;
    private String introduction;
    private Date enrolltime;
    private String type;
    private String phone;
    private String nickname;
    private String password;
    private int uid;

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    private String oldPassword;

    @Override
    public String toString() {
        return "User{" +
                "email='" + email + '\'' +
                ", icon='" + icon + '\'' +
                ", introduction='" + introduction + '\'' +
                ", enrolltime=" + enrolltime +
                ", type='" + type + '\'' +
                ", phone='" + phone + '\'' +
                ", nickname='" + nickname + '\'' +
                ", password='" + password + '\'' +
                ", uid=" + uid +
                '}';
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Date getEnrolltime() {
        return enrolltime;
    }

    public void setEnrolltime(Date encrolltime) {
        this.enrolltime = encrolltime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }
}
