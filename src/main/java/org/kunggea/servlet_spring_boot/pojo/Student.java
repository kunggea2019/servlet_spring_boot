package org.kunggea.servlet_spring_boot.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Student {

    private Integer studentId;          // 学生ID
    private String studentName;         // 学生姓名



    // 一对多
    private List<Course> courseList; // 课程列表
}
