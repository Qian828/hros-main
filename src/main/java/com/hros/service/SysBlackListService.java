package com.hros.service;

import com.hros.mapper.SysBlackListMapper;
import com.hros.model.Employee;
import com.hros.model.RespPageBean;
import com.hros.model.SysBlackList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Transactional
@Service
public class SysBlackListService {
    @Autowired
    SysBlackListMapper sysBlackListMapper;

    public RespPageBean getBlackListByPge(Integer page, Integer size, SysBlackList sysBlackList, Date[] beginDateScope) {

        if (page != null && size != null) {
            page = (page - 1) * size;
        }
        List<SysBlackList> data = sysBlackListMapper.getSysBlackByPage(page, size, sysBlackList, beginDateScope);
        Long total = sysBlackListMapper.getTotal(sysBlackList, beginDateScope);
        return new RespPageBean(total, data);
    }
}
