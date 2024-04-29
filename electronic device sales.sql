-- customer with total amount paid 
select full_name,sum(total_amount_paid) as total_paid
from [dbo].[custmoer] c join [dbo].[order] o
on c.cust_id=o.cust_id
group by full_name
order by total_paid desc 


--top 3 customer
select top 3 full_name,sum(total_amount_paid) as total_paid
from [dbo].[custmoer] c inner join [dbo].[order] o
on c.cust_id=o.cust_id
group by full_name
order by total_paid desc 

--order data and delivary date 
select full_name,order_id,order_date,delivery_date
from [dbo].[custmoer] c join [dbo].[order] o
on c.cust_id=o.cust_id
 

--see all orders in a month
SELECT  datepart(mm,order_date)as months ,sum(total_amount_paid) AS sales 
from [dbo].[order] 
group by datepart(mm,order_date)
ORDER BY months

--delivery person
select d.delivery_person_id,name,order_id,tot_units,delivery_date
from [dbo].[delivery_person] d join [dbo].[order] o
on d.delivery_person_id=o.delivery_person_id


--most delivers have been deliverd
SELECT TOP 5 o.delivery_person_id ,name 
FROM [dbo].[order] o join [dbo].[delivery_person] d
on o.delivery_person_id = d.delivery_person_id
GROUP BY o.delivery_person_id,name
ORDER BY COUNT(order_id) DESC; 

 --most product paid
select product_name,sum(total_amount_paid)as sales
from [dbo].[product] p join  [dbo].[order] o
on p.product_id=o.product_id
group by product_name
order by sales desc

--order by brand 
select brand,sum(total_amount_paid)as sales
from [dbo].[product] p join  [dbo].[order] o
on p.product_id=o.product_id
group by brand
order by sales desc

--top category
select  top 1 category,sum(total_amount_paid)as sales
from [dbo].[product] p join  [dbo].[order] o
on p.product_id=o.product_id
group by category
order by sales desc

 --most payment method has been use 
  select payment_type,sum(total_amount_paid) as sales
 from [dbo].[order] 
 group by payment_type
 order by sales desc

 --precurment cost 
 select p.product_name,sum(procurement_cost_per_unit*tot_units) as total_cost
from [dbo].[order]o join dbo.product p 
on p.product_id = o.product_id
group by p.product_name
order by total_cost desc

--days to ship 
select order_id,full_name,DateDiff(dd,o.order_date,o.delivery_date) as days_to_ship
 from [dbo].[custmoer] c join[dbo].[order] o 
 on c.cust_id=o.cust_id
 order by days_to_ship desc

  --whos the most gender order?
select gender,count(*) as num_gender,count(order_id) as count_orderId
  from [dbo].[custmoer] c join[dbo].[order] o 
 on c.cust_id=o.cust_id
group by gender
order by count_orderId desc


--sum total amount paid
SELECT  sum(total_amount_paid) AS sales 
from [dbo].[order] 

select sum(tot_units) as total_units
from [dbo].[order] 
