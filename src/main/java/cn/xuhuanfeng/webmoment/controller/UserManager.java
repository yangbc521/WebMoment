package cn.xuhuanfeng.webmoment.controller;

import cn.xuhuanfeng.webmoment.entity.User;
import cn.xuhuanfeng.webmoment.service.UserService;
import cn.xuhuanfeng.webmoment.service.UserServiceImpl;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by xuhuanfeng on 2017/3/30.
 */
public class UserManager extends javax.servlet.http.HttpServlet {

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        String path = request.getRequestURI();
        String target = path.substring(path.lastIndexOf("/") + 1);
        String destinationPath = "/";
        String msg = "";
        boolean result = false;
        response.setCharacterEncoding("utf-8");
        JSONObject jsonObject = new JSONObject();

        if ("login".equals(target)) {
            User user = login(request);
            if (user == null) {
                msg = "账号或者密码错误";
                result = false;
            } else {
                destinationPath = "/User/home";
                request.getSession().setAttribute("User", user);
                result = true;
            }
            jsonObject.put("msg", msg);
            jsonObject.put("success", result);
            jsonObject.put("path", destinationPath);
            writeJsonToClient(response, jsonObject);

        } else if ("register".equals(target)) {

            result = register(request);

            if (!result) {
                msg = "邮箱或者手机号码或者昵称已经存在";
                destinationPath = "/register.jsp";
            } else {
                destinationPath = "/login.jsp";
            }
            jsonObject.put("msg", msg);
            jsonObject.put("path", destinationPath);
            jsonObject.put("success", result);

            writeJsonToClient(response, jsonObject);

        } else {

            User user = (User) request.getSession().getAttribute("User");

            if (user == null) {
                response.sendRedirect("/login.jsp");
            } else {

                String hint = "mdui-text-color-green";

                if ("unFollow".equals(target)) {
                    int pid = Integer.parseInt(request.getParameter("uid"));
                    UserService userService = new UserServiceImpl();
                    userService.removeFollow(user.getUid(), pid);

                    jsonObject.put("success", true);

                    writeJsonToClient(response, jsonObject);

                } else if ("addFollow".equals(target)) {

                    int pid = Integer.parseInt(request.getParameter("uid"));
                    UserService userService = new UserServiceImpl();
                    userService.addFollow(user.getUid(), pid);

                    jsonObject.put("success", true);

                    writeJsonToClient(response, jsonObject);

                } else if ("logout".equals(target)) {
                    request.getSession().removeAttribute("User");
                    response.sendRedirect("/login.jsp");
                    return;
                } else if ("updateIcon".equals(target)) {

                    String icon = request.getParameter("icon");
                    UserService userService = new UserServiceImpl();
                    user.setIcon(icon);
                    result = userService.updateIcon(user);
                    if (result) {
                        msg = "更新头像成功，下次登录生效";
                    } else {
                        msg = "由于网络原因，更新头像失败，请稍后重试";
                        hint = "mdui-text-color-red";
                    }

                } else if ("updateIntroduction".equals(target)) {

                    String introduction = request.getParameter("introduction");
                    UserService userService = new UserServiceImpl();
                    user.setIntroduction(introduction);
                    result = userService.updateIntroduction(user);
                    if (result) {
                        msg = "更新自我介绍成功，下次登录生效";
                    } else {
                        msg = "由于网络原因，更新自我介绍失败，请稍后重试";
                        hint = "mdui-text-color-red";
                    }
                } else if ("updatePassword".equals(target)) {

                    String oldPassword = request.getParameter("oldPassword");
                    String newPassword = request.getParameter("newPassword");
                    user.setPassword(newPassword);
                    user.setOldPassword(oldPassword);
                    UserService userService = new UserServiceImpl();
                    result = userService.updatePassword(user);
                    if (result) {
                        msg = "更新密码成功";
                    } else {
                        msg = "旧密码有误，请输入正确的旧密码";
                        hint = "mdui-text-color-red";
                    }
                }
                jsonObject.put("success", result);
                jsonObject.put("msg", msg);
                jsonObject.put("hint", hint);
                writeJsonToClient(response, jsonObject);
            }
        }
    }

    private void writeJsonToClient(HttpServletResponse response, JSONObject jsonObject) throws IOException {
        response.getWriter().write(jsonObject.toString());
        response.getWriter().flush();
        response.getWriter().close();
    }

    /**
     * 登录
     *
     * @param request
     * @return User
     */
    private User login(HttpServletRequest request) {
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        User user = new User();
        user.setPhone(phone);
        user.setPassword(password);

        UserService userService = new UserServiceImpl();
        return userService.login(user);
    }

    /**
     * 注册
     *
     * @param request
     * @return
     */
    private boolean register(HttpServletRequest request) {

        String icon = "http://oio4hn5r8.bkt.clouddn.com/17-3-3/88485926-file_1488513473512_17266.jpg";
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String nickname = request.getParameter("nickname");
        String email = request.getParameter("email");
        String type = request.getParameter("type");

        User user = new User();
        user.setPassword(password);
        user.setPhone(phone);
        user.setEmail(email);
        user.setNickname(nickname);
        user.setType(type);
        user.setIcon(icon);

        UserService userService = new UserServiceImpl();
        return userService.register(user);
    }
}
