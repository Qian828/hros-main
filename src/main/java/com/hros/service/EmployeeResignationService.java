package com.hros.service;

import com.hros.mapper.EmployeeResignationMapper;
import com.hros.mapper.HandoverMapper;
import com.hros.model.*;
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
public class EmployeeResignationService {
    @Autowired
    EmployeeResignationMapper employeeResignationMapper;
    @Autowired
    OplogService oplogService;
    @Autowired
    EmployeeService employeeService;
    @Autowired
    HandoverMapper handoverMapper;


    public RespPageBean getEmployeeResignationByPage(Integer page, Integer size, Integer empId) {

        if (page != null && size != null) {
            page = (page - 1) * size;
        }
        List<Map<String,Object>> data = employeeResignationMapper.getEmployeeResignationsByEmpId(page, size, empId);
        Long total = employeeResignationMapper.getTotal(empId);
        return new RespPageBean(total, data);
    }

    public Integer addEmployeeResignation(EmployeeResignation employeeResignation) {
        Employee employee = employeeService.getEmployeeById(employeeResignation.getEmpId());
        oplogService.addOpLog(new OpLog((byte) 9, new Date(), "员工申请离职::name:" + employee.getName() + "workId:" + employee.getWorkid(), Hruitls.getCurrent().getName()));
        return employeeResignationMapper.insertSelective(employeeResignation);
    }

   public  Integer deleteEmployeeResignation(Integer id){
        EmployeeResignation employeeResignation = employeeResignationMapper.selectByPrimaryKey(id);
        Employee employee = employeeService.getEmployeeById(employeeResignation.getEmpId());
       oplogService.addOpLog(new OpLog((byte) 9, new Date(), "员工撤销离职申请::name:" + employee.getName() + "workId:" + employee.getWorkid(), Hruitls.getCurrent().getName()));
       return employeeResignationMapper.deleteByPrimaryKey(id);
    }

     @Transactional
    public Integer updateEmployeeResignation(EmployeeResignation employeeResignation){
         Employee employee = employeeService.getEmployeeById(employeeResignation.getEmpId());
         if(employeeResignation.getStatus() == 1){
             if (handoverMapper.selectByHandoverBy(employee.getId()) > 0){
                 employeeService.deleteEmpByEid(employeeResignation.getEmpId());
                 oplogService.addOpLog(new OpLog((byte) 9, new Date(), "员工离职申请审核通过::name:" + employee.getName() + "workId:" + employee.getWorkid(), Hruitls.getCurrent().getName()));
             }else {
                 return  2;
             }

         }else if(employeeResignation.getStatus() == 2){
             oplogService.addOpLog(new OpLog((byte) 9, new Date(), "员工离职申请审核驳回::name:" + employee.getName() + "workId:" + employee.getWorkid(), Hruitls.getCurrent().getName()));

         }


         LocalDateTime approveTime = LocalDateTime.now();

         // 转换为 Date
         Date approveDate = Date.from(approveTime.atZone(ZoneId.systemDefault()).toInstant());

         //设置审核时间
         employeeResignation.setApproveTime(approveDate);

        return employeeResignationMapper.updateByPrimaryKeySelective(employeeResignation);
    }
}
