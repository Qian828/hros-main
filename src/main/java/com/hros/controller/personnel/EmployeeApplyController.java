package com.hros.controller.personnel;

import com.hros.model.RespPageBean;
import com.hros.model.SysBlackList;
import com.hros.service.SysBlackListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
@RequestMapping("/employee/apply")
public class EmployeeApplyController {
    @Autowired
    SysBlackListService sysBlackListService;

    @GetMapping("/")
    public RespPageBean getBlackListByPge(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size, SysBlackList sysBlackList, Date[] beginDateScope) {
        return sysBlackListService.getBlackListByPge(page, size, sysBlackList, beginDateScope);

    }


}
