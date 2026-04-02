package com.hros.mapper;

import com.hros.model.Handover;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface HandoverMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Handover row);

    int insertSelective(Handover row);

    Handover selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Handover row);

    int updateByPrimaryKeyWithBLOBs(Handover row);

    int updateByPrimaryKey(Handover row);

    List<Map<String,Object>> selectAllHandover(@Param("page") Integer page, @Param("size") Integer size, @Param("empId")Integer empId);

    Long getTotal(@Param("empId") Integer empId);
}