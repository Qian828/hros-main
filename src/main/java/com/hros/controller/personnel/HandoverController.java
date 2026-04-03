package com.hros.controller.personnel;


import com.hros.model.Handover;
import com.hros.model.RespBean;
import com.hros.model.RespPageBean;
import com.hros.service.EmployeePromotionService;
import com.hros.service.HandoverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/employee/handover")
public class HandoverController {
    @Autowired
    HandoverService handoverService;

    @PostMapping("/add")
    public RespBean addHandover(@RequestBody Handover handover) {
        if (handoverService.addHandover(handover) == 1) {
            return RespBean.ok("添加成功!");
        }
        return RespBean.error("添加失败!");
    }

   @GetMapping("/")
    public RespPageBean getHandoverByPge(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size, @RequestParam Integer empId) {
        return handoverService.getHandoverByPge(page, size, empId);

    }

    @DeleteMapping("/{id}")
    public RespBean deleteHandover(@PathVariable Integer id) {
        if (handoverService.deleteHandover(id) == 1) {
            return RespBean.ok("删除成功!");
        }
        return RespBean.error("删除失败!");
    }

 /*
    @PostMapping("/update")
    public RespBean updateEmployeePromotion(@RequestBody EmployeePromotion employeePromotion) {
        if (employeePromotionService.updateEmployeePromotion(employeePromotion) == 1) {
            return RespBean.ok("审核成功!");
        }
        return RespBean.error("审核失败!");
    }
   */

}
