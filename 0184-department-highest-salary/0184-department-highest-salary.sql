select Department, Employee, Salary from
(select d.name as Department, e.name as Employee, e.Salary,
dense_rank() over(partition by departmentId order by salary desc)as rnk
from Employee as e join Department as d on e.departmentId=d.id)as a
where rnk=1