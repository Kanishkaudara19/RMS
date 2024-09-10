1. Get a clone of the RMS repository to a preferred location on your PC. 
2. Open IDE and open the project. 
3. Create MySQL database only in your system named rms_db 
4. Configure spring boot to IDE first (if needed only) 
   Go to following file in project – RMS >> src >> main >> resources >>  
  application.properties change the following:

  //Define the Data Source Parameters 
  
  spring.datasource.url=jdbc:mysql://localhost:3306/rms_db 
  
  spring.datasource.username=root 
  
  spring.datasource.password=**Enter your database password** 
  
  spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver 
  
  //Define Extra Parameters for Hibernate 
  
  #spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect  
  
  need to uncomment this line if you running the application for the first time. After 
  the database is created comment it back. 
  
  spring.jpa.hibernate.ddl-auto=update
  
  need to change update to create if you running the application for the first time. 
  After the database is created change it back to update 
  
6. Add to user to the table with user_type_id  0 to create an admin first.
   
7. Login to the admin panel  http://localhost:8080/admin/index.jsp and add the necessary 
  data.  
8. Now got to customer panel  http://localhost:8080/user/index.jsp 
9. Then you can use the application freely! Enjoy!
