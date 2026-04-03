package com.hros.controller.org;


import com.hros.model.CooperationAgency;
import com.hros.model.Handover;
import com.hros.model.RespBean;
import com.hros.model.RespPageBean;
import com.hros.service.AgencyService;
import com.hros.service.HandoverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/org/agency")
public class AgencyController {
    @Autowired
    AgencyService agencyService;

    @PostMapping("/add")
    public RespBean addAgency(@RequestBody CooperationAgency cooperationAgency) {
        if (agencyService.addAgency(cooperationAgency) == 1) {
            return RespBean.ok("添加成功!");
        }
        return RespBean.error("添加失败!");
    }

   @GetMapping("/")
    public RespPageBean getAgencyByPge(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size, CooperationAgency cooperationAgency) {
       System.out.println("查询参数：page=" + page + ", size=" + size + ", 条件=" + cooperationAgency);
        return agencyService.getAgencyByPge(page, size, cooperationAgency);

    }

    @DeleteMapping("/{id}")
    public RespBean deleteAgency(@PathVariable Integer id) {
        if (agencyService.deleteAgency(id) == 1) {
            return RespBean.ok("删除成功!");
        }
        return RespBean.error("删除失败!");
    }

    @PostMapping("/update")
    public RespBean updateAgency(@RequestBody CooperationAgency cooperationAgency) {
        if (agencyService.updateAgency(cooperationAgency) == 1) {
            return RespBean.ok("修改成功!");
        }
        return RespBean.error("修改失败!");
    }

}
