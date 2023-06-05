
create table hrdata
(
	emp_no int8 PRIMARY KEY,
	gender varchar(50) NOT NULL,
	marital_status varchar(50),
	age_band varchar(50),
	age int8,
	department varchar(50),
	education varchar(50),
	education_field varchar(50),
	job_role varchar(50),
	business_travel varchar(50),
	employee_count int8,
	attrition varchar(50),
	attrition_label varchar(50),
	job_satisfaction int8,
	active_employee int8
)

SELECT * FROM hrdata

select sum(employee_count) as employee_count from hrdata
--where education = 'High School'
--where department = 'Sales'

---when ever we create a test document, we just need to take a screenshot ofthe output for reference purpose.

select count(attrition) from hrdata
--where attrition = 'Yes'and education = 'Doctoral Degree'
where attrition = 'Yes'and DEPARTMENT = 'R&D'

Select round(((select count(attrition) from hrdata where attrition = 'Yes')/sum(employee_count))*100,2) from hrdata
where department = 'Sales'

Select sum(employee_count)- (select count(attrition)from hrdata where attrition = 'Yes')
from hrdata

select round(avg(age),0) as Avg_age from hrdata

--attrition by gender
select gender, count(attrition) from hrdata
where attrition = 'Yes' and education = 'High School'
group by gender
order by count(attrition) desc

Select department,count(attrition),round((cast(count(attrition)as numeric)/(select count(attrition) from hrdata where attrition = 'Yes'))*100,2)
from hrdata
where attrition = 'Yes'
group by department
order by count(attrition) desc

--for female attrition value
Select department,count(attrition),round((cast(count(attrition)as numeric)/(select count(attrition) from hrdata where attrition = 'Yes'and gender = 'Female'))*100,2)
from hrdata
where attrition = 'Yes' and gender = 'Female'
group by department
order by count(attrition) desc

select age, sum(employee_count) from hrdata
group by age
order by age

select age, sum(employee_count) from hrdata
where department = 'R&D'
group by age
order by age

SELECT education_field , count(attrition)
where attrition = 'Yes'
group by education_field
order by count(attrition)desc

select age_band, gender, count(attrition), (cast(count(attrition)as numeric)/(select count(attrition) from hrdata where attrition = 'Yes'))*100 from hrdata
where attrition = 'Yes'
group by age_band, gender
order by age_band, gender