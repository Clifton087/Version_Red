package com.baizhi.action;

import com.baizhi.entity.Employee;
import com.baizhi.service.EmployeeService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;

@Controller
@RequestMapping("/emp")
public class EmployeeAction {
    @Autowired
    private EmployeeService employeeService;


    @RequestMapping("/add")
    public String add(Employee emp, MultipartFile upload,HttpSession session) throws Exception {
        String realPath = session.getServletContext().getRealPath("/upload");
        System.out.println(upload+"-------------->");
        if(!upload.isEmpty()){
            upload.transferTo(new File(realPath+"/"+upload.getOriginalFilename()));
            emp.setImage(upload.getOriginalFilename());
        }else{
            emp.setImage("default.jpg");
        }

        employeeService.dmlRegister(emp);

        return "redirect:/departments.jsp";
    }

    @RequestMapping("/showOne")
    public String showOne(String id, Model model) throws Exception {
        Employee emp = employeeService.showOne(id);
        model.addAttribute("emp",emp);

        return "updateEmp";
    }

    @RequestMapping("/modify")
    public String modify(Employee emp,MultipartFile upload,HttpSession session) throws Exception {
        String realPath = session.getServletContext().getRealPath("/upload");
        if(!upload.isEmpty()){
            upload.transferTo(new File(realPath+"/"+upload.getOriginalFilename()));
            emp.setImage(upload.getOriginalFilename());
        }else{
            Employee employee = employeeService.showOne(emp.getId());
            emp.setImage(employee.getImage());
        }

        employeeService.dmlModify(emp);

        return "redirect:/emp/showAll.do";
    }

    @RequestMapping("/remove")
    public String remove(String id) throws Exception {
        employeeService.dmlRemove(id);

        return "redirect:/emp/showAll.do";
    }

    @RequestMapping("/showAll")
    public String showAll(String showid, Model model, HttpSession session) throws Exception {
        List<Employee> employees = null;
        if(showid==null){
            String showid2 = (String) session.getAttribute("showid");
            employees = employeeService.showEmployees(showid2);
        }else{
            session.setAttribute("showid",showid);
            employees = employeeService.showEmployees(showid);
        }

        model.addAttribute("employees",employees);
        System.out.println("showid--->"+showid+"\n-----。。。》employees"+employees);
        return "emplist";
    }

    @RequestMapping("/download")
    public ResponseEntity<byte[]> download(String fileName,HttpSession session) throws Exception {
        String realPath = session.getServletContext().getRealPath("/upload");
        byte[] bytes = FileUtils.readFileToByteArray(new File(realPath + "/" + fileName));

        HttpHeaders headers = new HttpHeaders();
        String newName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
        headers.setContentDispositionFormData("attachment",newName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

        return new ResponseEntity<byte[]>(bytes,headers, HttpStatus.CREATED);
    }


}
