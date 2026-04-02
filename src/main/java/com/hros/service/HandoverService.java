package com.hros.service;

import com.hros.mapper.HandoverMapper;
import com.hros.model.Employee;
import com.hros.model.Handover;
import com.hros.model.OpLog;
import com.hros.model.RespPageBean;
import com.hros.service.utils.Hruitls;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;


@Transactional
@Service
public class HandoverService {
    @Autowired
    HandoverMapper handoverMapper;
    @Autowired
    EmployeeService employeeService;

    @Autowired
    OplogService oplogService;

    public Integer addHandover(Handover handover) {
        Employee employee = employeeService.getEmployeeById(handover.getHandoverBy());
        oplogService.addOpLog(new OpLog((byte) 13, new Date(), "员工进行物品交接，交接人:" + employee.getName() + "，workId:" + employee.getWorkid(), Hruitls.getCurrent().getName()));

        return handoverMapper.insertSelective(handover);
    }

   public RespPageBean getHandoverByPge(Integer page, Integer size, Integer empId) {

        if (page != null && size != null) {
            page = (page - 1) * size;
        }
        List<Map<String,Object>> data = handoverMapper.selectAllHandover(page, size, empId);
        Long total = handoverMapper.getTotal(empId);
        return new RespPageBean(total, data);
    }

    public  Integer deleteHandover(Integer id){
        Handover handover = handoverMapper.selectByPrimaryKey(id);
        Employee employee = employeeService.getEmployeeById(handover.getHandoverBy());
        oplogService.addOpLog(new OpLog((byte) 13, new Date(), "删除员工交接记录，交接人："+employee.getName(), Hruitls.getCurrent().getName()));

        return handoverMapper.deleteByPrimaryKey(id);
    }

}
