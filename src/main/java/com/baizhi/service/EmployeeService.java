package com.baizhi.service;

import com.baizhi.entity.Employee;

import java.util.List;

public interface EmployeeService {
    boolean dmlRegister(Employee emp);
    boolean dmlModify(Employee emp);
    boolean dmlRemove(String id);

    Employee showOne(String id);
    List<Employee> showEmployees(String depNo);
}
