package com.baizhi.service;

import com.baizhi.entity.Department;

import java.util.List;

public interface DepartmentService {
    boolean dmlRegister(Department dep);
    boolean dmlModify(Department dep);
    boolean dmlRemove(String id);

    Department showOne(String id);
    List<Department> showDepartments();
}
