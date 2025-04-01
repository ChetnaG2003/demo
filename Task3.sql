1.
SELECT s.student_id,s.name,c.course_name,status
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
join courses c on e.course_id=c.course_id 
WHERE e.status = 'Active';

2.select  c.course_name, count(e.enrollment_id) as enrollment_count
from courses c
left join enrollments e on c.course_id = e.course_id
group by  c.course_name
order by enrollment_count desc

3. select  s.student_id, s.name, count(e.course_id) as course_count
from students s
join enrollments e on s.student_id = e.student_id
group by s.student_id, s.name
having count(e.course_id) >= 2;

4. select c.course_id , c.course_name from courses c left join enrollments e on c.course_id=e.course_id where e.course_id is null


5. select e.enrollment_id, s.student_id, s.name as student_name, c.course_name,
case
when e.status = 'active' then 'Currently Enrolled'
when e.status = 'completed' then 'Course Completed'
when e.status = 'dropped' then 'Enrollment Dropped'
else 'Unknown Status'
end as enrollment_status_label
from enrollments e
join students s on e.student_id = s.student_id
join courses c on e.course_id = c.course_id

6.select c.course_id, c.course_name, count(e.enrollment_id) as enrollment_count from courses c Join enrollments e on c.course_id = e.course_id
group by  c.course_id, c.course_name

7. select s.student_id, s.name from students s left join enrollments e on s.student_id = e.student_id where e.student_id is null

8.select s.student_id, s.name from students s join enrollments e on s.student_id = e.student_id join courses c on e.course_id = c.course_id
where c.course_name in ('Python for Data Science', 'SQL Mastery') group by s.student_id, s.name having count( c.course_name) = 2


9.select s.student_id, s.name, registration_date from students s join enrollments e on s.student_id = e.student_id order by registration_date desc
limit 5

10. select c.category, count(e.student_id) as student_count from courses c join enrollments e on c.course_id = e.course_id group by c.category

11.select distinct s.student_id, s.name from students s join enrollments e on s.student_id = e.student_id where e.status = 'completed'

12. select s.student_id, s.name from students s join enrollments e ON s.student_id = e.student_id JOIN courses c ON e.course_id = c.course_id
where c.category = 'Programming'

13. select date_trunc('month', registration_date) as month,count(*) AS total_enrollments from  enrollments
GROUP BY 
    month
ORDER BY 
    month;

14. select s.student_id, s.name, s.email from students s join enrollments e on s.student_id = e.student_id where e.status != 'Completed'
15. select s.student_id,s.name, min(e.enrolled_on) as earliest_enrollment_date, max(e.enrolled_on) as latest_enrollment_date from students s
join enrollments e on s.student_id = e.student_id group by s.student_id, s.name

16. select distinct s.student_id, s.name, s.email, e.enrolled_on from students s join enrollments e on s.student_id = e.student_id
where e.enrolled_on >= current_date - interval '6 months';

17. select c.course_id, c.course_name, count(e.enrollment_id) as total_enrollments from courses c join enrollments e on c.course_id = e.course_id
group by c.course_id, c.course_name having count(e.enrollment_id) > 5


18. select s.student_id, s.name, max(e.enrolled_on) as most_recent_enrollment_date from students s join enrollments e on s.student_id = e.student_id
group by s.student_id, s.name;

19. select s.student_id, s.name, s.email, c.course_name,e.status, e.enrolled_on from students s join enrollments e on s.student_id = e.student_id
join courses c on e.course_id = c.course_id where e.status = 'Dropped';


20. select c.course_id, c.course_name, count(e.enrollment_id) as total_enrollments from courses c join enrollments e on c.course_id = e.course_id
group by c.course_id, c.course_name order by total_enrollments desc limit 1;
