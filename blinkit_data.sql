/* BLINKIT DATA ANALYSIS*/

/* KPI's Requirements */

select * from blinkit_data;

/* Sum of total sales in millions */

select cast(sum(Total_Sales)/1000000 as decimal(10,2)) AS Total_Sales_Millions
from blinkit_data;

/* Average Sales */

select cast(avg(Total_Sales) as decimal(10,1)) as Avg_Sales from blinkit_data;

/* Number Of Items */

select count(*) as No_of_Items from blinkit_data;

/* Average  Ratings */

select cast(avg(Rating) as decimal(10,2)) As Avg_Rating from blinkit_data;

/* Granular Requirements */

/* Total Sales by Fat_Content */

select Item_Fat_Content, 
concat(cast(sum(Total_Sales)/1000 as decimal(10,2)),'k') as Total_Sales_Thousands,
concat(cast(avg(Total_Sales) as decimal(10,1)),'k') as Avg_Sales,
count(*) as No_of_Items,
cast(avg(Rating) as decimal(10,2)) As Avg_Rating
from blinkit_data
group by Item_Fat_Content
order by Total_Sales_Thousands desc;

/* for establishemnt year 2022 */

select Item_Fat_Content, 
concat(cast(sum(Total_Sales) as decimal(10,2)),'k') as Total_Sales_Thousands,
concat(cast(avg(Total_Sales) as decimal(10,1)),'k') as Avg_Sales,
count(*) as No_of_Items,
cast(avg(Rating) as decimal(10,2)) As Avg_Rating
from blinkit_data
where Outlet_Establishment_Year = 2020
group by Item_Fat_Content
order by Total_Sales_Thousands desc;

/*Total Sales By Item Type */

select Item_Type, 
cast(sum(Total_Sales)/1000 as decimal(10,2)) as Total_Sales,
cast(avg(Total_Sales) as decimal(10,1)) as Avg_Sales,
count(*) as No_of_Items,
cast(avg(Rating) as decimal(10,2)) As Avg_Rating
from blinkit_data
group by Item_Type
order by Total_Sales desc;

/* Top 5 Item Type */

select  Item_Type, 
cast(sum(Total_Sales)/1000 as decimal(10,2)) as Total_Sales,
cast(avg(Total_Sales) as decimal(10,1)) as Avg_Sales,
count(*) as No_of_Items,
cast(avg(Rating) as decimal(10,2)) As Avg_Rating
from blinkit_data
group by Item_Type
order by Total_Sales desc
limit 5;

/* Fat Content By Outlet For Total Sales */

select 
  Outlet_Location_Type,
  cast(sum(case 
             when Item_Fat_Content = 'Low Fat' then Total_Sales 
             else 0 
           end) as decimal(10,2)) AS Low_Fat,
  cast(sum(CASE 
             when Item_Fat_Content = 'Regular' then Total_Sales 
             else 0 
           end) as decimal(10,2)) AS Regular
from blinkit_data
group by Outlet_Location_Type
order by Outlet_Location_Type;

/* Total Sales by outlet Establishment */

select Outlet_Establishment_Year,
cast(sum(Total_Sales) as decimal(10,2)) as Total_Sales
from blinkit_data
group by Outlet_Establishment_Year
order by Outlet_Establishment_Year asc;


/* Percentage of Sales by Outlet Size */

select Outlet_Size,
cast(sum(Total_Sales) as decimal(10,2)) as Total_Sales,
cast(sum(Total_Sales) * 100.0 / sum(sum(Total_Sales)) over() as decimal(10,2)) as Sales_Percentage
from blinkit_data
group by Outlet_Size
order by Total_Sales desc;

/* Sales by outlet Location */

select Outlet_Location_Type,
cast(sum(Total_Sales) as decimal(10,2)) as Total_Sales,
cast(sum(Total_Sales) * 100.0 / sum(sum(Total_Sales)) over() as decimal(10,2)) as Sales_Percentage,
cast(avg(Total_Sales) as decimal(10,1)) as Avg_Sales,
count(*) as No_of_Items,
cast(avg(Rating) as decimal(10,2)) As Avg_Rating
from blinkit_data
group by Outlet_Location_Type
order by Total_Sales desc;


/* All metrics by Outlet Type */

select Outlet_Type,
cast(sum(Total_Sales) as decimal(10,2)) as Total_Sales,
cast(sum(Total_Sales) * 100.0 / sum(sum(Total_Sales)) over() as decimal(10,2)) as Sales_Percentage,
cast(avg(Total_Sales) as decimal(10,1)) as Avg_Sales,
count(*) as No_of_Items,
cast(avg(Rating) as decimal(10,2)) As Avg_Rating
from blinkit_data
group by Outlet_Type
order by Total_Sales desc;

