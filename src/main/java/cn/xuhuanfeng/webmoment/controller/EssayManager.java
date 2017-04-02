package cn.xuhuanfeng.webmoment.controller;

import cn.xuhuanfeng.webmoment.entity.Essay;
import cn.xuhuanfeng.webmoment.entity.User;
import cn.xuhuanfeng.webmoment.service.EssayService;
import cn.xuhuanfeng.webmoment.service.EssayServiceImpl;
import cn.xuhuanfeng.webmoment.service.UserService;
import cn.xuhuanfeng.webmoment.service.UserServiceImpl;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by xuhuanfeng on 2017/3/30.
 */
public class EssayManager extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String path = request.getRequestURI();
        System.out.println("--->" + path);
        String target = path.substring(path.lastIndexOf("/") + 1);
        System.out.println("--------> " + target);
        String msg = "";
        User  user = ((User) request.getSession().getAttribute("User"));
        if (user == null){
            response.sendRedirect("/login.jsp");
        }else {
            JSONObject jsonObject = new JSONObject();
            boolean result = false;

            if ("publishEssay".equals(target)) {
                 result = publishEssay(request, user);
                if (result) {
                    msg = "文章发布成功";
                } else {
                    msg = "由于网络原因，发布失败，请稍后重试";
                }

            }
            jsonObject.put("success", result);
            jsonObject.put("msg", msg);
            response.setCharacterEncoding("utf-8");
            response.getWriter().write(jsonObject.toString());
            response.getWriter().flush();
            response.getWriter().close();
        }
    }

    /**
     * 发布文章
     *
     * @param request
     * @return
     */
    private boolean publishEssay(HttpServletRequest request, User user) {

        String author = request.getParameter("author").replaceAll("<", "&lt;");
        String title = request.getParameter("title").replaceAll(">", "&gt;");
        String content = request.getParameter("content");

        Essay essay = new Essay();
        essay.setAuthor(author);
        essay.setTitle(title);
        essay.setContent(content);
        essay.setPublisher(user.getUid());
        EssayService essayService = new EssayServiceImpl();
        boolean result = essayService.publishEssay(essay);
        return result;
    }
}
