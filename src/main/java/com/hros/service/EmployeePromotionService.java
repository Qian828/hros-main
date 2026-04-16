package com.hros.service;

import com.hros.mapper.EmployeeMapper;
import com.hros.mapper.EmployeePromotionMapper;

import com.hros.model.Employee;
import com.hros.model.EmployeePromotion;
import com.hros.model.OpLog;
import com.hros.model.RespPageBean;
import com.hros.service.utils.Hruitls;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Map;


@Transactional
@Service
public class EmployeePromotionService {
    @Autowired
    EmployeePromotionMapper employeePromotionMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    EmployeeService employeeService;
    @Autowired
    OplogService oplogService;

    public RespPageBean getEmployeePromotionByPge(Integer page, Integer size, Integer empId) {

        if (page != null && size != null) {
            page = (page - 1) * size;
        }
        List<Map<String,Object>> data = employeePromotionMapper.getMyPromotionList(page, size, empId);
        Long total = employeePromotionMapper.getTotal(empId);
        return new RespPageBean(total, data);
    }

    public Integer addEmployeePromotion(EmployeePromotion employeePromotion) {
        Employee employee = employeeService.getEmployeeById(employeePromotion.getEmpId());
        oplogService.addOpLog(new OpLog((byte) 12, new Date(), "员工申请晋升::name:" + employee.getName() + "workId:" + employee.getWorkid(), Hruitls.getCurrent().getName()));

        return employeePromotionMapper.insertSelective(employeePromotion);
    }

    public  Integer deleteEmployeePromotion(Integer id){
        EmployeePromotion employeePromotion = employeePromotionMapper.selectByPrimaryKey(id);
        Employee employee = employeeService.getEmployeeById(employeePromotion.getEmpId());
        oplogService.addOpLog(new OpLog((byte) 12, new Date(), "员工撤销晋升申请::name:" + employee.getName() + "workId:" + employee.getWorkid(), Hruitls.getCurrent().getName()));

        return employeePromotionMapper.deleteByPrimaryKey(id);
    }

    @Transactional
    public Integer updateEmployeePromotion(EmployeePromotion employeePromotion){
        Employee employee = employeeMapper.getEmployeeById(employeePromotion.getEmpId());
        if (employeePromotion.getStatus()==1){

            employee.setPosid(employeePromotion.getNewPosId());
            employee.setJoblevelid(employeePromotion.getNewJobLevelId());
            employeeService.updateEmp(employee);
            oplogService.addOpLog(new OpLog((byte) 12, new Date(), "员工晋升申请通过::name:" + employee.getName() + "workId:" + employee.getWorkid(), Hruitls.getCurrent().getName()));

        }else if (employeePromotion.getStatus()==2){
            oplogService.addOpLog(new OpLog((byte) 12, new Date(), "员工晋升申请驳回::name:" + employee.getName() + "workId:" + employee.getWorkid(), Hruitls.getCurrent().getName()));

        }
        LocalDateTime approveTime = LocalDateTime.now();

        // 转换为 Date
        Date approveDate = Date.from(approveTime.atZone(ZoneId.systemDefault()).toInstant());

        //设置审核通过时间
        employeePromotion.setApproveTime(approveDate);
        return employeePromotionMapper.updateByPrimaryKeySelective(employeePromotion);
    }
}
