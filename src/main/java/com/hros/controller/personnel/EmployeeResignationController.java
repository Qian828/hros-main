package com.hros.controller.personnel;

import com.hros.model.EmployeePromotion;
import com.hros.model.EmployeeResignation;
import com.hros.model.RespBean;
import com.hros.model.RespPageBean;
import com.hros.service.EmployeePromotionService;
import com.hros.service.EmployeeResignationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/employee/resignation")
public class EmployeeResignationController {
    @Autowired
    EmployeeResignationService  employeeResignationService;

    @GetMapping("/")
    public RespPageBean getEmployeeResignationByPge(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size,@RequestParam Integer empId) {
        return employeeResignationService.getEmployeeResignationByPage(page, size, empId);

    }

    @PostMapping("/add")
    public RespBean addEmployeeResignation(@RequestBody EmployeeResignation employeeResignation) {
        if (employeeResignationService.addEmployeeResignation(employeeResignation) == 1) {
            return RespBean.ok("离职申请提交成功!");
        }
        return RespBean.error("离职申请提交失败!");
    }
    @PostMapping("/update")
    public RespBean updateEmployeeResignation(@RequestBody EmployeeResignation employeeResignation) {
        if (employeeResignationService.updateEmployeeResignation(employeeResignation) == 1) {
            return RespBean.ok("审核成功!");
        }
        return RespBean.error("审核失败!");
    }
    @DeleteMapping("/{id}")
    public RespBean deleteEmployeeResignation(@PathVariable Integer id) {
        if (employeeResignationService.deleteEmployeeResignation(id) == 1) {
            return RespBean.ok("删除成功!");
        }
        return RespBean.error("删除失败!");
    }

}
