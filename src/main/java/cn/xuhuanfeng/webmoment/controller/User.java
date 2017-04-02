package cn.xuhuanfeng.webmoment.controller;

import cn.xuhuanfeng.webmoment.entity.Comment;
import cn.xuhuanfeng.webmoment.entity.Essay;
import cn.xuhuanfeng.webmoment.service.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by xuhuanfeng on 2017/3/30.
 */
public class User extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getRequestURI();
        String target = path.substring(path.lastIndexOf("/") + 1);
        cn.xuhuanfeng.webmoment.entity.User user = (cn.xuhuanfeng.webmoment.entity.User) request.getSession().getAttribute("User");
        if (user == null) {
            path = "/login.jsp";
            response.sendRedirect(path);
        }else {
            String type = user.getType();
            System.out.println("===> " + type);

            if ("home".equals(target)) {
                if ("P".equals(type)) {
                    path = "/PublicUser/home.jsp";
                } else if ("O".equals(type)) {
                    preparedEssay(request,user);
                    path = "/OrdinaryUser/home.jsp";
                }
            } else if ("info".equals(target)) {
                if ("P".equals(type)) {
                    path = "/PublicUser/info.jsp";
                } else if ("O".equals(type)) {
                    path = "/OrdinaryUser/info.jsp";
                }
            } else if ("writeEssay".equals(target)) {
                path = "/PublicUser/home.jsp";
            } else if ("getEssay".equals(target)) {
                getEssay(request, user.getUid() + "");
                path = "/PublicUser/essay.jsp";
            } else if ("comment".equals(target)) {
                getComment(request, user.getUid()+"");
                path = "/PublicUser/comment.jsp";
            } else if ("follower".equals(target)) {
                getFollower(request, user);
                path = "/PublicUser/follower.jsp";
            }else if ("followed".equals(target)){
                getFollowed(request, user);
                path = "/OrdinaryUser/followed.jsp";
            }else if ("allPublicUser".equals(target)){
                getAllPublicUser(request, user);
                path = "/OrdinaryUser/allPublicUser.jsp";
            }else{
                path = "/";
            }
            request.getRequestDispatcher(path).forward(request, response);
        }
    }

    private void preparedEssay(HttpServletRequest request, cn.xuhuanfeng.webmoment.entity.User user){
        UserService userService = new UserServiceImpl();
        List<cn.xuhuanfeng.webmoment.entity.User> users = userService.getAllFollowedUser(user);

        EssayService essayService = new EssayServiceImpl();
        CommentService commentService = new CommentServiceImpl();
        Map<Integer, List<Comment>> comment = new HashMap<Integer,List<Comment>>();
        List<Essay>  essays = new ArrayList<Essay>();

        if (users != null){
            for (cn.xuhuanfeng.webmoment.entity.User us:users) {
                List<Essay> tmpEssays = essayService.getEssayByPublisher(us.getUid()+"");
                for (Essay e: essays) {
                    List<Comment> comments = commentService.getPassedComment(e.getEid());
                    if (comments != null){
                        comment.put(e.getEid(),comments);
                    }
                }
                essays.addAll(tmpEssays);
            }
        }
        request.setAttribute("essays", essays);
        request.setAttribute("comment", comment);
    }

    private void getAllPublicUser(HttpServletRequest request, cn.xuhuanfeng.webmoment.entity.User user){
        UserService userService = new UserServiceImpl();
        List<cn.xuhuanfeng.webmoment.entity.User> allPublicUser = userService.getAllPubicUser(user);
        request.setAttribute("allPublicUser", allPublicUser);
    }

    private void getFollowed(HttpServletRequest request,cn.xuhuanfeng.webmoment.entity.User user ){
        UserService userService = new UserServiceImpl();
        List<cn.xuhuanfeng.webmoment.entity.User> users = userService.getAllFollowedUser(user);
        request.setAttribute("followed", users);
    }


    private void getFollower(HttpServletRequest request, cn.xuhuanfeng.webmoment.entity.User user){
        UserService userService = new UserServiceImpl();
        List<cn.xuhuanfeng.webmoment.entity.User> users = userService.getAllFollowerUser(user);
        request.setAttribute("followers", users);
    }

    private void getEssay(HttpServletRequest request, String uid){
        EssayService essayService = new EssayServiceImpl();
        CommentService commentService = new CommentServiceImpl();
        Map<Integer, List<Comment>> comment = new HashMap<Integer,List<Comment>>();

        List<Essay> essays = essayService.getEssayByPublisher(uid);
        for (Essay e: essays) {
            List<Comment> comments = commentService.getPassedComment(e.getEid());
            if (comments != null){
                comment.put(e.getEid(),comments);
            }
        }
        request.setAttribute("essays" ,essays);
        request.setAttribute("comments",comment);
    }

    private void getComment(HttpServletRequest request, String uid){
        EssayService essayService = new EssayServiceImpl();
        CommentService commentService = new CommentServiceImpl();
        Map<Integer, List<Comment>> comment = new HashMap<Integer,List<Comment>>();

        List<Essay> essays = essayService.getEssayByPublisher(uid);

        for (Essay e: essays) {
            System.out.println("---> " + e.getEid());
            List<Comment> comments = commentService.getUnpassedComment(e.getEid());
            if (comments != null && comments.size() != 0){
                System.out.println("-------> " + comments);
                comment.put(e.getEid(), comments);
            }
        }
        request.setAttribute("essays", essays);
        request.setAttribute("comments",comment);
    }
}
