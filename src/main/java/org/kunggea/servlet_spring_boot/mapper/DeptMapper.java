package org.kunggea.servlet_spring_boot.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kunggea.servlet_spring_boot.pojo.Dept;

import java.util.List;

@Mapper
public interface DeptMapper {


    List<Dept> findAllDept();

}
