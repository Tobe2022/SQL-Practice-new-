#doing my sql practice#

#Started with creating a table, employee salary#

Create table EmployeeSalary
(EmployeeID int,
Designation varchar (50),
Salary int)

#Inserted values into EmployeeSalary table#

Insert into EmployeeSalary Values
(001, 'Head Officer', 500000),
(002, 'Asst Head Officer', 450000),
(003, 'Secretary', 400000),
(004, 'Asst Secretary', 380000),
(005, 'Cheif Sales Officer', 500000),
(006, 'Asst Cheif Sales Officer', 400000),
(007, 'Sales Rep', 250000),
(008, 'Sales Rep', 280000),
(009, 'Sales Rep', 280000),
(010, 'Technician', 200000),
(011, 'Technician', 185000),
(012, 'Technician', 215000),
(013, 'IT Rep', 300000),
(014, 'IT Rep', 300000),
(015, 'IT Rep', 300000)

#Creating the second table#

Create table EmployeeDemograpics
(EmployeeID int,
FristName varchar (50),
LastName varchar (50),
Email_Address varchar (50),
DOE int)

#Inserting into EmployeeDemographics#

Insert into EmployeeDemograpics Values
(001, 'Tobechukwu', 'Agoziem', 'tt.agoziem@unizik.edu.ng', 2020-01-21)
(002, 'Chinedum', 'Ilechukwu', 'ce.ilechukwu@unizik.edu.ng', 1992-04-28),
(003, 'Chisom', 'Agoziem', 'cp.agoziem@unizik.edu.ng', 1997-03-09),
(004, 'Favour', 'Agoziem', 'fc.agoziem@unizik.edu.ng', 2020-04-01),
(005, 'Goodness', 'Agoziem', 'gc.agoziem@unizik.edu.ng', 2002-07-01),
(006, 'Chibuzor', 'Ilechukwu', 'cb.ilechukwu@unizik.edu.ng', 1968-06-08),
(007, 'Chukwuagoziem', 'Ilechukwu', 'ce.ilechukwu@unizik.edu.ng', 1961-01-05),
(008, 'Ebube', 'Chinedum', 'ej.chinedum@unizik.edu.ng', 2003-09-12),
(009, 'Chidiogo', 'Chinedum', 'cg.chinedum@unizik.edu.ng', 2004-03-02),
(010, 'Miracle', 'Ezeifeoma', 'mj.ezeifeoma@unizik.edu.ng', 2006-08-13),
(011, 'Victory', 'Ezeifeoma', 'vc.ezeifeoma@unizik.edu.ng', 2008-09-12),
(012, 'Joshua', 'Okeke', 'jp.okeke@unizik.edu.ng', 2010-05-03),
(013, 'Tobechukwu', 'Okeke', 'tm.okeke@unizik.edu.ng', 2012-11-01),
(014, 'Obinna', 'Ogarannya', 'oo.ogarannya@unizik.edu.ng', 1989-07-017),
(015, 'Obiora', 'Onyenekwe', 'oo.onyenekwe@unizik.edu.ng', 1975-03-21)

#Select-from statements#

Select *
From EmployeeDemograpics

Select *
From EmployeeSalary

#where statements#

Select Salary
From EmployeeSalary
Where Salary = '400000'

#Order by statements#

Select *
From EmployeeDemograpics
order by DOE

#Group by statement#

Select EmployeeID, DOE
From EmployeeDemograpics
group by EmployeeID, DOE

#Joins- combining columns from EmployeeDemographics and EmployeeSalary#

#InnerJoin#

Select *
From EmployeeDemograpics
Inner join EmployeeSalary
on EmployeeDemograpics.EmployeeID = EmployeeSalary.EmployeeID

#OuterJoins#

Select *
From EmployeeDemograpics
Full Outer join EmployeeSalary
on EmployeeDemograpics.EmployeeID = EmployeeSalary.EmployeeID

#unions + orderby# In unions, data types must be uniform i.e equal number of data types#

Select EmployeeID, DOE, FristName
From EmployeeDemograpics
Union
Select EmployeeID, Salary, Designation
From EmployeeSalary
Order by DOE

#Case statement#

Select FristName, LastName, DOE,
Case
When DOE > '2000' then 'Old Staff'
Else 'Young Staff'
End
From EmployeeDemograpics
order by DOE

#Having Clause#

Select Designation, count(Designation) As [No of Designations > 1]
From EmployeeSalary
Join EmployeeDemograpics
on EmployeeSalary.EmployeeID = EmployeeDemograpics.EmployeeID
Group by Designation
Having count(Designation) > 1 

#Partition by#

Select 
FristName, LastName, Designation, Salary, count (Designation) 
over (partition by Designation) as [Total No of Designations]
From EmployeeDemograpics
Join EmployeeSalary
on EmployeeDemograpics.EmployeeID = EmployeeSalary.EmployeeID

#CTEs#

With CTE_Employee as
(Select 
FristName, LastName, Designation, Salary, count (Designation) 
over (partition by Designation) as [Total No of Designations]
 From EmployeeDemograpics
Join EmployeeSalary
on EmployeeDemograpics.EmployeeID = EmployeeSalary.EmployeeID
Where Salary > '200000')
Select *
From CTE_Employee

#Temporary Table#

Create table #temp_Employee(
EmployeeID int,
Designation varchar(100),
Salary int
)

#Subqueries#
Select EmployeeID, Salary, (Select avg(salary) from EmployeeSalary) as [All Avg Salary]
from EmployeeSalary

#So, these are just a breif run down of all i have learn from sql so far# learning continue though#



