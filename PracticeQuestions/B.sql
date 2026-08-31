-- Write the Query to find avg marks un each city in ascending order.


 SELECT city , avg(marks)
 FROM student
 GROUP BY city
 ORDER BY avg(marks) DESC;