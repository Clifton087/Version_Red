package com.baizhi.action;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminAction {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/add")
    public String add(Admin admin, Model model, HttpSession session) throws Exception {
        try {
            adminService.dmlRegister(admin);
            session.setAttribute("login",admin);

            model.addAttribute("message","注册成功");

            return "login";
        }catch (Exception e){
            e.printStackTrace();
            model.addAttribute("message","注册失败");

            return "regist";
        }
    }

    @RequestMapping("/login")
    public String login(Admin admin,Model model,HttpSession session) throws Exception {
        Admin login = adminService.showOne(admin);

        if(!admin.getPassword().equals(login.getPassword())){
            model.addAttribute("message","密码错误");

            return "login";
        }else{
            model.addAttribute("message","登录成功");
            session.setAttribute("login",login);

            return "departments";
        }
    }

    @RequestMapping("/check")
    @ResponseBody
    public String check(Admin admin) throws Exception {
        Admin login = adminService.showOne(admin);

        String message = null;
        if(login==null){
            message = "该用户不存在";
        }

        return message;
    }
}
