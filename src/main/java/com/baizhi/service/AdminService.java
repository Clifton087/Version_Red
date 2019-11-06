package com.baizhi.service;

import com.baizhi.entity.Admin;

public interface AdminService {
    boolean dmlRegister(Admin admin);
    Admin showOne(Admin admin);
}
