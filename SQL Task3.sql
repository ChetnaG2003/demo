TASK3
1. select s.student_id, s.name , course_name ,status from students s join enrollments e on s.student_id=e.student_id
join courses on e.course_id=courses.course_id where status= 'Active'

2. select c.course_name,count(e.enrollment_id) as total_student from courses c 
left join enrollments e on c.course_id=e.course_id group by course_name order by total_student desc
select*from students
select*from courses;
select*from enrollments

3. select s.student_id, s.name ,count(e.course_id) from students s join enrollments e on s.student_id = e.student_id group by s.student_id,s.name
having   count(e.course_id)>=2

4. select c.course_id, c.course_name from courses c left Join enrollments e on c.course_id = e.course_id where e.course_id is null

5. select e.enrollment_id, e.student_id,e.course_id,e.enrolled_on,e.status,
case
when e.status = 'Completed' then 'Completed Successfully'
when e.status = 'Active' and e.enrolled_on >= current_date - interval '30 days' then 'Recent and Active'
when e.status = 'Active' and e.enrolled_on < current_date - interval '30 days' then 'Long-term Active'
else 'Unknown Status'
end as enrollment_label
from enrollments e

6. select e.course_id, c.course_name, count(e.enrollment_id) as enrollment_count from enrollments e join courses c on e.course_id = c.course_id
group by e.course_id, c.course_name order by enrollment_count desc

7. select  s.student_id, s.name, s.email from students s left join enrollments e on s.student_id = e.student_id where e.student_id is null;

8.  select s.student_id, s.name, s.email, c1.course_name,c2.course_name from students s
join enrollments e1 on s.student_id = e1.student_id
join courses c1 on e1.course_id = c1.course_id and c1.course_name = 'Python for Data Science'
join enrollments e2 on s.student_id = e2.student_id
join courses c2 on e2.course_id = c2.course_id and c2.course_name = 'SQL Mastery';

9. select s.student_id, s.name, s.email, e.enrolled_on from students s join enrollments e on s.student_id = e.student_id order by e.enrolled_on desc
limit 5;

10. select c.category, count (distinct e.student_id) as student_count from courses c join enrollments e on c.course_id = e.course_id group by c.category
ORDER BY student_count desc

11. select  distinct s.student_id, s.name, s.email,e.status from students s join enrollments e on s.student_id = e.student_id where e.status = 'Completed'

12. select s.student_id, s.name, s.email FROM students s join enrollments e on s.student_id = e.student_id
join courses c on e.course_id = c.course_id  where c.category = 'Programming' group by s.student_id, s.name, s.email

13. select DATE_TRUNC('month', enrolled_on) as enrollment_month, count(*) as total_enrollments from enrollments group by DATE_TRUNC('month', enrolled_on)
order by enrollment_month

14.  SELECT DISTINCT s.student_id, s.name, s.email
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
WHERE e.status  = 'Completed';




