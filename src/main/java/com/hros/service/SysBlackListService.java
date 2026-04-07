package com.hros.service;

import com.hros.mapper.SysBlackListMapper;
import com.hros.model.Employee;
import com.hros.model.OpLog;
import com.hros.model.RespPageBean;
import com.hros.model.SysBlackList;
import com.hros.service.utils.Hruitls;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Transactional
@Service
public class SysBlackListService {
    @Autowired
    SysBlackListMapper sysBlackListMapper;
    @Autowired
    OplogService oplogService;

    public RespPageBean getBlackListByPge(Integer page, Integer size, SysBlackList sysBlackList, Date[] beginDateScope) {

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

    public Integer insertSysBlackList(SysBlackList sysBlackList) {
        if (selectByIdcard(sysBlackList.getIdcard()) != null) {
            return 2;
        }
        oplogService.addOpLog(new OpLog((byte) 15, new Date(), "新增黑名单人员，姓名:" + sysBlackList.getName() + "，身份证号码:" + sysBlackList.getIdcard(), Hruitls.getCurrent().getName()));
        return sysBlackListMapper.insertSelective(sysBlackList);
    }

    public Integer updateSysBlackList(SysBlackList sysBlackList) {
        // 1. 根据身份证查询 已存在的记录
        SysBlackList exist = selectByIdcard(sysBlackList.getIdcard());

        // 2. 规则：
        //    - 如果不存在重复 → 允许修改
        //    - 如果存在，但ID和当前编辑的ID一样 → 允许修改（是自己）
        //    - 如果存在，且ID不一样 → 是别人的 → 报错
        if (exist != null && !exist.getId().equals(sysBlackList.getId())) {
            return 2; // 身份证被别人占用 → 报错
        }

        oplogService.addOpLog(new OpLog((byte) 15, new Date(), "修改黑名单人员信息，姓名:" + sysBlackList.getName() + "，身份证号码:" + sysBlackList.getIdcard(), Hruitls.getCurrent().getName()));
        return sysBlackListMapper.updateByPrimaryKeySelective(sysBlackList);
    }

    public Integer deleteSysBlackList(Integer id) {
        SysBlackList sysBlackList = new SysBlackList();
        sysBlackList.setId(id);
        sysBlackList.setStatus((byte) 0);
        oplogService.addOpLog(new OpLog((byte) 15, new Date(), "移除黑名单人员，姓名:" + sysBlackList.getName() + "，身份证号码:" + sysBlackList.getIdcard(), Hruitls.getCurrent().getName()));
        return sysBlackListMapper.updateByPrimaryKeySelective(sysBlackList);
    }
    public Integer deleteSysBlackLists(Integer[] ids) {

        for (Integer id : ids) {
            deleteSysBlackList(id);
        }
        return ids.length;
    }


}
