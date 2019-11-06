package com.baizhi.dao;

import com.baizhi.entity.Admin;

public interface AdminDAO {
    void insert(Admin admin);
    Admin queryOne(Admin admin);
}
