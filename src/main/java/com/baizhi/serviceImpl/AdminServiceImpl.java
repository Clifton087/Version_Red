package com.baizhi.serviceImpl;

import com.baizhi.dao.AdminDAO;
import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDAO adminDAO;


    @Override
    public boolean dmlRegister(Admin admin) {
        if(!admin.getUsername().isEmpty()){
            admin.setId(UUID.randomUUID().toString());
        }

        adminDAO.insert(admin);

        return true;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Admin showOne(Admin admin) {
        Admin login = adminDAO.queryOne(admin);

        return login;
    }
}
