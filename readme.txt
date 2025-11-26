springboot is the future of web app.

导出数据库
# 语法：mysqldump -h主机名 -u用户名 -p密码 数据库名 表1 表2 > 导出文件路径.sql
mysqldump -hlocalhost -uroot -p123456 test_db dept emp > D:/backup/dept_emp_backup.sql


./sql/**.sql

执行导出的 SQL 文件恢复（两种方式）：
命令行方式：
cmd pojo数据库名称
mysql -hlocalhost -uroot -p123456 pojo < D:/backup/dept_emp_backup.sql

start web app
test in chrome 
get all users
http://localhost:8080/users/findAllUsers


新建低版本boot的分支
spring boot <version>2.7.18</version>
using Java 1.8.0_392 jar包可运行了


访问 API 文档
Swagger UI: http://localhost:8080/swagger-ui.html
OpenAPI JSON: http://localhost:8080/v3/api-docs


./eclipse目录是可以eclipse运行的springboot项目  358版本
jp需要的话可以拿出来测试下eclipse的环境是否配置成功