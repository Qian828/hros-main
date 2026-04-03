package com.hros.mapper;

import com.hros.model.CooperationAgency;
import com.hros.model.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CooperationAgencyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CooperationAgency row);

    int insertSelective(CooperationAgency row);

    CooperationAgency selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CooperationAgency row);

    int updateByPrimaryKey(CooperationAgency row);

    List<CooperationAgency> getAgencyByPage(@Param("page") Integer page, @Param("size") Integer size, @Param("agency") CooperationAgency agency);

    Long getTotal(@Param("agency") CooperationAgency agency);
}