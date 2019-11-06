package com.baizhi.action;

import com.baizhi.entity.Department;
import com.baizhi.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/dep")
public class DepartmentAction {
    @Autowired
    private DepartmentService departmentService;


    @RequestMapping("/add")
    public String add(Department dep) throws Exception {
        departmentService.dmlRegister(dep);

        return "redirect:/departments.jsp";
    }

    @RequestMapping("/showOne")
    public String showOne(String id, Model model) throws Exception {
        Department dep = departmentService.showOne(id);
        model.addAttribute("dep",dep);

        return "updateDepartment";
    }

    @RequestMapping("/modify")
    public String modify(Department dep) throws Exception {
        departmentService.dmlModify(dep);

        return "redirect:/departments.jsp";
    }

    @RequestMapping("/remove")
    public String remove(String id) throws Exception {
        departmentService.dmlRemove(id);

        return "redirect:/departments.jsp";
    }

    @RequestMapping("/showAll")
    @ResponseBody
    public List<Department> showAll() throws Exception {
        List<Department> departments = departmentService.showDepartments();

        return departments;
    }
}
