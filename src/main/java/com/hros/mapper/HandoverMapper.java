package com.hros.mapper;

import com.hros.model.Handover;

public interface HandoverMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Handover row);

    int insertSelective(Handover row);

    Handover selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Handover row);

    int updateByPrimaryKeyWithBLOBs(Handover row);

    int updateByPrimaryKey(Handover row);
}