package com.hros.controller.personnel;

import com.hros.model.EmployeePromotion;
import com.hros.model.RespBean;
import com.hros.model.RespPageBean;
import com.hros.model.SysBlackList;
import com.hros.service.EmployeePromotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@RestController
@RequestMapping("/employee/promotion")
public class EmployeePromotionController {
    @Autowired
    EmployeePromotionService employeePromotionService;

    @GetMapping("/")
    public RespPageBean getEmployeePromotionByPge(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size,@RequestParam Integer empId) {
        return employeePromotionService.getEmployeePromotionByPge(page, size, empId);

    }

    @PostMapping("/add")
    public RespBean addPromotion(@RequestBody EmployeePromotion employeePromotion) {
        if (employeePromotionService.addEmployeePromotion(employeePromotion) == 1) {
            return RespBean.ok("添加成功!");
        }/*else if (employeePromotionService.addEmployeePromotion(employeePromotion) == 2) {
            return RespBean.error("此人为黑名单人员，不予入职!");
        }*/
        return RespBean.error("添加失败!");
    }


}
