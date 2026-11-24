create database Project;
use Project;
create table cleaned_orders(
order_ID varchar(10) primary key,
order_date date,
city varchar(20) ,
zone varchar(40),
platform  varchar(20),
category VARCHAR(40),
    payment_mode VARCHAR(20),
    order_amount_inr DECIMAL(10,2),
    delivery_mins INT,
    delivery_fee_inr DECIMAL(10,2),
    status VARCHAR(20),
    sla_status VARCHAR(20),
    net_revenue DECIMAL(10,2)
);
select * from cleaned_quick_commerce
;
USE project;
select * from cleaned_quick_commerce;
SELECT city,
       COUNT(*) AS total_orders,
       SUM(CASE WHEN sla_status = 'Delayed' THEN 1 ELSE 0 END) AS delayed_orders,
       ROUND(100.0 * SUM(CASE WHEN sla_status = 'Delayed' THEN 1 ELSE 0 END) / COUNT(*), 1) AS breach_pct
FROM cleaned_quick_commerce
GROUP BY city
ORDER BY breach_pct DESC;
select * from cleaned_quick_commerce;

select platform , count(*) as Order_count , round(avg(delivery_mins),2) as Avg_delivery_time ,
sum(net_revenue) as total_net_revenue from cleaned_quick_commerce 
group by platform
order by total_net_revenue desc ;

select * from cleaned_quick_commerce;
select platform , delivery_mins ,net_revenue  from cleaned_quick_commerce where delivery_fee_inr=0
and sla_status='delayed';

select city , zone , round(avg(delivery_mins),2) as Avg_d_t ,
rank() over(order by avg(delivery_mins) desc) as delay_rank from cleaned_quick_commerce
group by city , zone ;




