package com.hros.mapper;

import com.hros.model.EmployeeResignation;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface EmployeeResignationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EmployeeResignation row);

    int insertSelective(EmployeeResignation row);

    EmployeeResignation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(EmployeeResignation row);

    int updateByPrimaryKey(EmployeeResignation row);

    List<Map<String, Object>> getEmployeeResignationsByEmpId(@Param("page") Integer page, @Param("size") Integer size, @Param("empId")Integer empId);

    Long getTotal(@Param("empId") Integer empId);
}