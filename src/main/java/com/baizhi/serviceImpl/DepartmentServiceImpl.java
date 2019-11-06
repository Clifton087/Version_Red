package com.baizhi.serviceImpl;

import com.baizhi.dao.DepartmentDAO;
import com.baizhi.entity.Department;
import com.baizhi.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private DepartmentDAO departmentDAO;


    @Override
    public boolean dmlRegister(Department dep) {
        departmentDAO.insert(dep);

        return true;
    }

    @Override
    public boolean dmlModify(Department dep) {
        departmentDAO.update(dep);

        return true;
    }

    @Override
    public boolean dmlRemove(String id) {
        departmentDAO.delete(id);

        return true;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Department showOne(String id) {
        Department department = departmentDAO.queryOne(id);

        return department;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Department> showDepartments() {
        List<Department> departments = departmentDAO.queryDepartments();

        return departments;
    }
}
