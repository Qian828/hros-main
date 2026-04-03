package com.hros.service;

import com.hros.mapper.AppraiseMapper;
import com.hros.mapper.CooperationAgencyMapper;
import com.hros.mapper.HandoverMapper;
import com.hros.model.*;
import com.hros.service.utils.Hruitls;
import com.hros.service.utils.LogUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Description :

 * @Date: 2020/1/13 17:22
 */
@Service
public class AgencyService {

    @Autowired
    CooperationAgencyMapper cooperationAgencyMapper;


    @Autowired
    OplogService oplogService;

    public Integer addAgency(CooperationAgency cooperationAgency) {

        oplogService.addOpLog(new OpLog((byte) 14, new Date(), "新增机构信息:" + cooperationAgency.getAgencyName() , Hruitls.getCurrent().getName()));

        return cooperationAgencyMapper.insertSelective(cooperationAgency);
    }

    public RespPageBean getAgencyByPge(Integer page, Integer size, CooperationAgency cooperationAgency) {

        if (page != null && size != null) {
            page = (page - 1) * size;
        }
        List<CooperationAgency> data = cooperationAgencyMapper.getAgencyByPage(page, size, cooperationAgency);
        Long total = cooperationAgencyMapper.getTotal(cooperationAgency);
        return new RespPageBean(total, data);
    }

    public  Integer deleteAgency(Integer id){
        CooperationAgency cooperationAgency = cooperationAgencyMapper.selectByPrimaryKey(id);
        oplogService.addOpLog(new OpLog((byte) 14, new Date(), "删除机构信息："+cooperationAgency.getAgencyName(), Hruitls.getCurrent().getName()));

        return cooperationAgencyMapper.deleteByPrimaryKey(id);
    }

    public  Integer updateAgency(CooperationAgency cooperationAgency){
        oplogService.addOpLog(new OpLog((byte) 14, new Date(), "修改机构信息："+cooperationAgency.getAgencyName(), Hruitls.getCurrent().getName()));
        return cooperationAgencyMapper.updateByPrimaryKeySelective(cooperationAgency);
    }
}
