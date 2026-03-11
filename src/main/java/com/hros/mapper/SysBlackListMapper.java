package com.hros.mapper;


import com.hros.model.SysBlackList;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface SysBlackListMapper {
    int deleteByPrimaryKey(Long id);

    int insert(SysBlackList row);

    int insertSelective(SysBlackList row);

    SysBlackList selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SysBlackList row);

    int updateByPrimaryKey(SysBlackList row);

    List<SysBlackList> getSysBlackByPage(@Param("page") Integer page, @Param("size") Integer size, @Param("emp") SysBlackList blackList, @Param("beginDateScope") Date[] beginDateScope);

    Long getTotal(@Param("emp") SysBlackList blackList, @Param("beginDateScope") Date[] beginDateScope);

}