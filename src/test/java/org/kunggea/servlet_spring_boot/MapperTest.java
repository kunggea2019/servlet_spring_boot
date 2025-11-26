package org.kunggea.servlet_spring_boot;

import org.junit.jupiter.api.Test;
import org.kunggea.servlet_spring_boot.mapper.CarMapper;
import org.kunggea.servlet_spring_boot.mapper.DeptMapper;
import org.kunggea.servlet_spring_boot.mapper.StudentMapper;
import org.kunggea.servlet_spring_boot.mapper.UserMapper;
import org.kunggea.servlet_spring_boot.pojo.Car;
import org.kunggea.servlet_spring_boot.pojo.Dept;
import org.kunggea.servlet_spring_boot.pojo.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class MapperTest {

    @Autowired
    DeptMapper deptMapper;


    @Test
    public void findAllDept() {
        List<Dept> depts = deptMapper.findAllDept();

        for (Dept dept : depts) {
            System.out.println(dept);
        }
    }


    @Autowired
    StudentMapper studentMapper;

    @Test
    public void findAllCoursesOfStudent() {

        List<Student> students = studentMapper.findAllCoursesOfStudent();

        for (Student student : students) {
            System.out.println(student);
        }
        // bean with List 一对多  多对多  也是ok的
//        Student(studentId=1, studentName=张三, courseList=[Course(courseId=1, courseName=MySQL数据库), Course(courseId=2, courseName=Java编程), Course(courseId=4, courseName=数据结构)])
//        Student(studentId=2, studentName=李四, courseList=[Course(courseId=1, courseName=MySQL数据库), Course(courseId=3, courseName=计算机网络)])
//        Student(studentId=3, studentName=王五, courseList=[Course(courseId=2, courseName=Java编程), Course(courseId=3, courseName=计算机网络), Course(courseId=4, courseName=数据结构), Course(courseId=5, courseName=Python爬虫)])
//        Student(studentId=4, studentName=赵六, courseList=[Course(courseId=1, courseName=MySQL数据库), Course(courseId=6, courseName=人工智能导论)])
//        Student(studentId=5, studentName=孙七, courseList=[Course(courseId=2, courseName=Java编程), Course(courseId=5, courseName=Python爬虫), Course(courseId=6, courseName=人工智能导论)])
//        Student(studentId=6, studentName=周八, courseList=[Course(courseId=3, courseName=计算机网络), Course(courseId=4, courseName=数据结构)])
//        Student(studentId=7, studentName=吴九, courseList=[Course(courseId=1, courseName=MySQL数据库), Course(courseId=2, courseName=Java编程), Course(courseId=6, courseName=人工智能导论)])
//        Student(studentId=8, studentName=郑十, courseList=[Course(courseId=3, courseName=计算机网络), Course(courseId=5, courseName=Python爬虫)])

    }


    @Autowired
    CarMapper carMapper;

    @Test
    public void findCar() {
        List<Car> cars = carMapper.findCar();
        for (Car car : cars) {
            System.out.println(car);
        }
        // 完全ok的呢
//        Car(carId=1, carModel=凯美瑞, customer=Customer(customerId=1, customerName=null, address=北京市海淀区中关村))
//        Car(carId=2, carModel=思域, customer=Customer(customerId=2, customerName=null, address=上海市浦东新区陆家嘴))
//        Car(carId=3, carModel=5系, customer=Customer(customerId=3, customerName=null, address=广州市天河区珠江新城))
//        Car(carId=4, carModel=C级, customer=Customer(customerId=4, customerName=null, address=深圳市南山区科技园))
//        Car(carId=5, carModel=Model 3, customer=Customer(customerId=6, customerName=null, address=成都市锦江区春熙路))
//        Car(carId=6, carModel=迈腾, customer=Customer(customerId=7, customerName=null, address=武汉市洪山区光谷))
    }


}
