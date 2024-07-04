use mintclassics;
select * from warehouses 
order by 3 desc;
select * from products;
select count(*), count(Distinct productname) from products;
select count(products.productname) as products_per_warehouse,
 sum(products.quantityinstock) as quantity_in_warehouse, products.warehousecode, warehouses.warehousename 
from products, warehouses 
where products.warehousecode = warehouses.warehousecode
group by products.warehousecode
order by 1 desc,2 desc;
select warehouses.warehousename, 
round((sum(products.quantityinstock)/warehouses.warehousepctcap)*100 , 0) as totalcapacity
from products, warehouses
where products.warehousecode= warehouses.warehousecode
group by products.warehousecode
order by 2 desc;
select * from orderdetails;
select min(orderdate),max(orderdate) from orders;
select productcode , sum(quantityordered) as total_quantityordered
from orderdetails
group by 1;
select count(distinct productcode) from orderdetails;
select productcode from products
where productcode not in (select productcode from orderdetails);
select productcode, productname, quantityinstock, warehousecode
from products
where productcode= 'S18_3233';
select orderdetails.productcode,
sum(orderdetails.quantityordered) as total_quantityordered,
products.quantityinstock
from orderdetails, products
where orderdetails.productcode= products.productcode
group by 1;
select sum(quantityordered)/count(distinct productcode) as avg_quantity_ordered
from orderdetails;
select 
avg(quantityinstock)
from products;
select productcode from products
where quantityinstock > 5046.6455
and productcode in (select sum(quantityordered) from orderdetails group by productcode) < 968.0367;