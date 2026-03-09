package com.hros.service;

import com.hros.mapper.EmployeeecMapper;
import com.hros.model.datas.DataModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description :

 * @Date: 2020/1/21 13:31
 */
@Service
public class EmployeecService {

    @Autowired
    EmployeeecMapper employeeecMapper;

    public List<DataModel> getModelandView() {
        return employeeecMapper.getModelandView();
    }
}
