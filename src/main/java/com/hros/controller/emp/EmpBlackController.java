package com.hros.controller.emp;

import com.hros.model.Employee;
import com.hros.model.RespBean;
import com.hros.model.RespPageBean;
import com.hros.model.SysBlackList;
import com.hros.service.SysBlackListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/employee/black")
public class EmpBlackController {
    @Autowired
    SysBlackListService sysBlackListService;

    @GetMapping("/")
    public RespPageBean getBlackListByPge(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size, SysBlackList sysBlackList, Date[] beginDateScope) {
        return sysBlackListService.getBlackListByPge(page, size, sysBlackList, beginDateScope);

    }

    @PostMapping("/add")
    public RespBean addEmp(@RequestBody SysBlackList sysBlackList) {
        if (sysBlackListService.insertSysBlackList(sysBlackList) == 1) {
            return RespBean.ok("添加成功!");
        }else if (sysBlackListService.insertSysBlackList(sysBlackList) == 2) {
            return RespBean.error("此人已在黑名单内，请重新输入!");
        }
        return RespBean.error("添加失败!");
    }

    @PutMapping("/update")
    public RespBean updateEmp(@RequestBody SysBlackList sysBlackList) {
        if (sysBlackListService.updateSysBlackList(sysBlackList) == 1) {
            return RespBean.ok("更新成功!");
        }else if (sysBlackListService.updateSysBlackList(sysBlackList) == 2) {
            return RespBean.error("此人已在黑名单内，请重新输入!");
        }
        return RespBean.error("更新失败!");
    }

    @DeleteMapping("/many/")
    public RespBean deleteEmpByEids(Integer[] ids) {
        if (sysBlackListService.deleteSysBlackLists(ids) == ids.length) {
            return RespBean.ok("移除成功!");
        }
        return RespBean.error("移除失败!");
    }

    @DeleteMapping("/{id}")
    public RespBean deleteEmpByEid(@PathVariable Integer id) {
        if (sysBlackListService.deleteSysBlackList(id) == 1) {
            return RespBean.ok("移除成功!");
        }
        return RespBean.error("移除失败!");
    }
}
