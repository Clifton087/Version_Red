package com.baizhi.dao;

import com.baizhi.entity.Department;

import java.util.List;

public interface DepartmentDAO {
    void insert(Department dep);
    void update(Department dep);
    void delete(String id);

    Department queryOne(String id);
    List<Department> queryDepartments();
}
