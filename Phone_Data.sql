/* Checking the table */
select * from phone_dataset limit 20;


/* Phones with Edge and arrangr by Announced */
Select Edge, Model, Ram, announced, Brand
From phone_dataset
Where Edge = "Yes"
Order BY announced desc;


/* Total Model launched with LTE */
Select COUNT(4g_Bands) as Total
From phone_dataset
Where 4G_bands like '%LTE%';


/* Model with 3 GB RAM but do not have LTE*/
Select Model, 4g_bands, RAM
From phone_dataset
where Ram = "3 GB" and 4G_bands not like '%LTE%';


/* Phones with LTE of all the Bands an total count */
select count(Brand) as Total, Brand
from phone_dataset
where 4G_bands like '%LTE%'
Group By Brand;


/* Total number models of each Brand group by Chipset*/
Select Brand, Chipset, Count(Chipset) as Total
From phone_dataset
Group By 1
Order By 3 desc;


/* Total Number of models Group By RAM */
Select Brand, RAM, count(RAM) as Total
From phone_dataset
group by 2
order by 3 desc;


/* Which company has maximum number of models of same RAM*/
Select Brand, RAM, Max(MxMfg) as MxTotal
From (Select Brand, RAM, count(RAM) as MxMfg
From phone_dataset
Group By 2) as TempTable;


/* Which Brand has phones with 8 GB RAM and total qty*/
Select Brand, RAM, Model
From phone_dataset
Where RAM like "%8 GB%";


