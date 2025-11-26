package org.kunggea.servlet_spring_boot.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kunggea.servlet_spring_boot.pojo.Dept;
import org.kunggea.servlet_spring_boot.pojo.Student;

import java.util.List;

@Mapper
public interface StudentMapper {


    List<Student> findAllCoursesOfStudent();

}
