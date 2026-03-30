package com.hros.mapper;

import com.hros.model.EmployeeResignation;

public interface EmployeeResignationMapper {
    int deleteByPrimaryKey(Long id);

    int insert(EmployeeResignation row);

    int insertSelective(EmployeeResignation row);

    EmployeeResignation selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(EmployeeResignation row);

    int updateByPrimaryKey(EmployeeResignation row);
}