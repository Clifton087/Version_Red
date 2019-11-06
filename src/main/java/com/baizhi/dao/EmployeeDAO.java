package com.baizhi.dao;

import com.baizhi.entity.Employee;

import java.util.List;

public interface EmployeeDAO {
    void insert(Employee emp);
    void update(Employee emp);
    void delete(String id);

    Employee queryOne(String id);
    List<Employee> queryEmployees(String depNo);
}
