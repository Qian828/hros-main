package com.hros.mapper;

import com.hros.model.EmployeePromotion;
import com.hros.model.SysBlackList;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface EmployeePromotionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EmployeePromotion row);

    int insertSelective(EmployeePromotion row);

    EmployeePromotion selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(EmployeePromotion row);

    int updateByPrimaryKey(EmployeePromotion row);

}