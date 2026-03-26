package com.hros.service;

import com.hros.mapper.EmployeePromotionMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Transactional
@Service
public class EmployeeApplyService {
    @Autowired
    EmployeePromotionMapper employeePromotionMapper;

    /*public RespPageBean getBlackListByPge(Integer page, Integer size, SysBlackList sysBlackList, Date[] beginDateScope) {

        if (page != null && size != null) {
            page = (page - 1) * size;
        }
        List<Map<String,Object>> data = sysBlackListMapper.getSysBlackByPage(page, size, sysBlackList, beginDateScope);
        Long total = sysBlackListMapper.getTotal(sysBlackList, beginDateScope);
        return new RespPageBean(total, data);
    }

    public SysBlackList selectByIdcard(String idCard) {
        return   sysBlackListMapper.selectByIdcard(idCard);
    }
*/
}
