Create Database Restaurant_Rating_Analysis;
use Restaurant_Rating_Analysis;


      Create table Customer_details( 
                                    Consumer_ varchar(20),
                                    City varchar(30),
                                    State varchar(30),
                                    Country varchar(40),
                                    latitude Decimal,
                                    Longitude decimal,
                                    Smoker Varchar(20),
                                    Drink_level Varchar(50),
                                    Transportation_method varchar(50),
                                    Marital_status varchar (30),
                                    Children varchar(30),
                                    age int,
                                    occupation varchar(50),
                                    Budget varchar(30));
			
SELECT * FROM Customer_details;

Create table Restaurants(  
                           Restaurant_ID varchar(30),
                           Name varchar(150),
                           city varchar(50),
                           state varchar(50),
                           country varchar(50),
                           zip_code varchar(50),
                           latitude decimal,
                           longitude decimal,
                           alcohol_service varchar(50),
                           smoking_allowed varchar(50),
                           price varchar(50),
                           franchise varchar(50),
                           area varchar(50),
				           parking varchar(100));
                           
SELECT * FROM Restaurants;

Create table customer_preferences(
                                  consumer_id varchar(20),
                                  preferred_cuisine varchar(50));
                                  
Create table Ratings( 
								Consumer_id varchar(50),
                                restaurant_id varchar(50),
                                overall_rating int,
                                food_rating int,
                                service_rating int);
                                
Create table restaurant_cuisines(
							            restaurant_id varchar(50),
                                        cuisine varchar(50));

select * from restaurant_cuisines;
select * from customer_details; 
select * from restaurants;
select * from customer_preferences;
select * from ratings;   

#Q1 TOtal restaurant in each state

select state,count(restaurant_id)total_customers
      from restaurants
      group by state
      order by total_customers desc;
      
#Q2 Total restaurants in each city
SELECT city, count(Restaurant_ID)
FROM restaurants
group by city;

#Q3 Restaurants count by alcohol service 
SELECT alcohol_service, count(Restaurant_ID)
from restaurants
group by alcohol_service;

#Q4 Restaurants count by smoking allowed
SELECT smoking_allowed, count(Restaurant_ID)
from restaurants
group by smoking_allowed;

#Q5 Alcohol & Smoking analysis
SELECT alcohol_service,smoking_allowed, count(restaurant_id)
from restaurants
group by alcohol_service,smoking_allowed;

#Q6 Preferred cuisines of each customer
        select name, count(cuisine) total_cuisines
        from restaurant_cuisines a
        Inner JOIN restaurants b
        ON a.restaurant_id = b.Restaurant_ID
        group by name 
        order by total_cuisines DESC;
        
#Q7 Restaurant price analysis for each cuisine
       select cuisine,
              sum(CASE When price = 'HIGH' then 1 Else 0 END) As "HIGH",
              sum(CASE When price = 'MEDIUM' then 1 Else 0 END) As "MEDIUM",
              sum(CASE When price = 'LOW' then 1 Else 0 END) As "LOW"
              from restaurants a
              INNER JOIN Restaurant_cuisines b
              ON a.Restaurant_ID = b.restaurant_id
		      group by cuisine
              order by cuisine DESC;
              
#Q8 finding out count of each cuisine in each state
         select * from restaurant_cuisines;
       select* from restaurants;
        select b.cuisine,
	           SUM(CASE WHEN a.state = 'Morelos' Then 1 Else 0 END) AS Morelos,
	           SUM(CASE WHEN a.state = 'San Luis Potosi' Then 1 Else 0 END) AS San_Luis_Potosi,
	           SUM(CASE WHEN a.state = 'Tamaulipas' Then 1 Else 0 END) AS Tamaulipas
			   from restaurants a
               Inner join restaurant_cuisines b
               ON a.restaurant_id = b.restaurant_id
               group by b.cuisine
               order by b.cuisine;
