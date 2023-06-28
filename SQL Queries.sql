#Query 1
# Who prefers energy drink more? (male/female/non-binary)
WITH CTE AS (
    SELECT 
        CASE WHEN Gender = 'Male' THEN 1 ELSE 0 END AS Total_Male,
        CASE WHEN Gender = 'Female' THEN 1 ELSE 0 END AS Total_Female,
        CASE WHEN Gender = 'Non-binary' THEN 1 ELSE 0 END AS Total_Non_binary
    FROM dim_repondents
)
SELECT Age,
    SUM(Total_Male) AS Total_Males,
    SUM(Total_Female) AS Total_Females,
    SUM(Total_Non_binary) AS Total_Non_binary
FROM CTE;

# Query 2
#Which age group prefers energy drinks more?
select Age, count(*) as Age_Prefrences
from dim_repondents
group by Age
order by Age_Prefrences desc;

# Query 3
#What are the preferred ingredients of energy drinks among respondents?
select Ingredients_expected as Ingredients, count(*) as Total_ingredients_preferred
from fact_survey_responses
group by Ingredients_expected
order by Total_ingredients_preferred desc;

# Query 4
select Packaging_preference as Packagings, count(*) as Total_preferred_package
from fact_survey_responses
group by Packaging_preference
Order by Total_preferred_package desc;

# Query 5
# Who are the current market leaders?
select Current_brands as Brands, count(*) as Market_leaders
from fact_survey_responses
group by Brands
Order by market_leaders desc;


#Query 6
# What are the primary reasons consumers prefer those brands over ours?
select Reasons_for_choosing_brands as brands,Count(*) as Reasons_prefer_brands
from fact_survey_responses
group by Reasons_for_choosing_brands
Order by Reasons_prefer_brands DESC;

#Query 7
#Which marketing channel can be used to reach more customers?
select Marketing_channels, count(*) as best_marketing_channels
from fact_survey_responses
group by Marketing_channels
order by best_marketing_channels desc;

#Query 8
#What do people think about our brand? (overall rating)
select Brand_perception, count(*) as Brand_rating
from fact_survey_responses
group by Brand_perception
order by Brand_rating desc;

select Taste_experience, count(*) as Taste_rating
from fact_survey_responses
group by Taste_experience
order by Taste_rating desc;

	
#Query 9
#Which cities do we need to focus more on?
SELECT d.City, COUNT(*) AS ResponseCount, d.Tier
FROM dim_cities d
JOIN dim_repondents r ON d.City_ID = r.City_ID
GROUP BY d.City, Tier
ORDER BY ResponseCount;









#Query 10
# Which type of marketing reaches the most Youth (15-30)?
SELECT s.Marketing_channels, COUNT(*) AS ReachCount_Youth
FROM fact_survey_responses s
JOIN dim_repondents r ON s.Respondent_ID = r.Respondent_ID
WHERE r.Age = '19-30' 
GROUP BY s.Marketing_channels
ORDER BY ReachCount_Youth desc;




#Query 11
#Where do respondents prefer to purchase energy drinks?
#Query 12
select Purchase_location, count(*) as prefer_purchase_location
from fact_survey_responses
group by Purchase_location
order by prefer_purchase_location desc;
#What are the typical consumption situations for energy drinks among respondents?
#Query 13
select Typical_consumption_situations, count(*) as frequency
from fact_survey_responses
group by Typical_consumption_situations
order by frequency desc;

#What factors influence respondents' purchase decisions, such as price range and limited edition packaging?
#Query 14
select Limited_edition_packaging, count(*) as Survey_answer
from fact_survey_responses
group by Limited_edition_packaging
order by Survey_answer desc;

select Price_range, count(*) as desired_price
from fact_survey_responses
group by Price_range
order by desired_price desc;

#Query 15
#Which area of business should we focus more on our product development? (Branding/taste/availability)
select Reasons_for_choosing_brands, count(*) as reasons
from fact_survey_responses
group by Reasons_for_choosing_brands
order by reasons desc;

#Query 16 (Secondary Questions)
# best consuption time?
select Consume_time as reasons, count(*) as total
from fact_survey_responses
group by consume_time
order by total desc;

#Query 17
#Major cosume reason?
select Consume_reason as benefits, count(*) as total
from fact_survey_responses
group by Consume_reason
order by total desc;

#Query 18
#Reason from preventing our brand
select Reasons_preventing_trying, count(*) as total
from fact_survey_responses
group by Reasons_preventing_trying
order by total desc;


#Query 19
# Improvment desired in our brand
select Improvements_desired, count(*) as total
from fact_survey_responses
group by Improvements_desired
order by total desc;


#Query 20
# people intrest in organic?
select Interest_in_natural_or_organic, count(*) as total
from fact_survey_responses
group by Interest_in_natural_or_organic
order by total desc;


#Query 21
# people heard before
select Heard_before, count(*) as total
from fact_survey_responses
group by Heard_before
order by total desc;


#Query 22
# Tried_before
select Tried_before, count(*) as total
from fact_survey_responses
group by Tried_before
order by total desc;











