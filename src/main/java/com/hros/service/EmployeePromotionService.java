package com.hros.service;

import com.hros.mapper.EmployeePromotionMapper;

import com.hros.model.EmployeePromotion;
import com.hros.model.RespPageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;


@Transactional
@Service
public class EmployeePromotionService {
    @Autowired
    EmployeePromotionMapper employeePromotionMapper;

    public RespPageBean getEmployeePromotionByPge(Integer page, Integer size, Integer empId) {

        if (page != null && size != null) {
            page = (page - 1) * size;
        }
        List<Map<String,Object>> data = employeePromotionMapper.getMyPromotionList(page, size, empId);
        Long total = employeePromotionMapper.getTotal(empId);
        return new RespPageBean(total, data);
    }

    public Integer addEmployeePromotion(EmployeePromotion employeePromotion) {
        return employeePromotionMapper.insertSelective(employeePromotion);
    }
}
