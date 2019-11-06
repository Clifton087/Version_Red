package com.baizhi.serviceImpl;

import com.baizhi.dao.EmployeeDAO;
import com.baizhi.entity.Employee;
import com.baizhi.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeDAO employeeDAO;


    @Override
    public boolean dmlRegister(Employee emp) {
        emp.setId(UUID.randomUUID().toString());
        employeeDAO.insert(emp);

        return true;
    }

    @Override
    public boolean dmlModify(Employee emp) {
        employeeDAO.update(emp);

        return true;
    }

    @Override
    public boolean dmlRemove(String id) {
        employeeDAO.delete(id);

        return true;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Employee showOne(String id) {
        Employee employee = employeeDAO.queryOne(id);

        return employee;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Employee> showEmployees(String depNo) {
        List<Employee> employees = employeeDAO.queryEmployees(depNo);

        return employees;
    }
}
