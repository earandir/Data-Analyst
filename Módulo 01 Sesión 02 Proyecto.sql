Use classicmodels;
#1 --------------
Select E.employeeNumber, E.lastName, E.firstName
From employees E
where E.firstName like 'a%';
#2 --------------
Select E.employeeNumber, E.lastName, E.firstName
From employees E
where E.firstName like '%on';
#3 --------------
Select E.employeeNumber, E.lastName, E.firstName
From employees E
where E.firstName like '%on%';
#4 --------------
Select E.employeeNumber, E.lastName, E.firstName
From employees E
where E.firstName like 't%e%e%e%m';
#5 --------------
Select E.employeeNumber, E.lastName, E.firstName
From employees E
where E.firstName not like 'e%';
#6 --------------
Select P.productCode, P.productName
From products P
where P.productCode like '%\_20%';
#7 --------------
Select OD.orderNumber, Sum(OD.priceEach) as Total
From orderdetails OD
group by OD.orderNumber;
#8 --------------
Select Year(O.orderDate), Count(O.orderDate)
From orders O 
group by Year(O.orderDate);
#9 --------------
Select E.lastName, E.firstName
From employees E
where E.officeCode in (Select O.officeCode 
						from offices O 
                        where O.country in ('USA'));

Select E.lastName, E.firstName, O.city
From employees E
join offices O on E.officeCode = O.officeCode and O.country in ('USA');                        
#10 --------------
select P.customerNumber, P.checkNumber, P.amount
from payments P 
order by P.amount desc
Limit 1;
#11 --------------
select P.customerNumber, P.checkNumber, P.amount
from payments P 
where P.amount > (Select Avg(NP.amount) from payments NP);
#12 --------------
Select C.customerName
From customers C
left outer join orders O on C.customerNumber = O.customerNumber
where O.orderNumber is null
order by C.customerName;
#13 --------------
Select Max(quantityOrdered) as MaxOrdered, Min(quantityOrdered) as MinOrdered, Avg(quantityOrdered) as AvgOrdered
From orderdetails OD;
#14 --------------
Select Count(O.orderNumber), C.state
from orders O
join customers C on O.customerNumber = C.customerNumber
group by C.state;
