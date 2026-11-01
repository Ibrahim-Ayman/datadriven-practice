WITH ad_total_clicked
AS (
SELECT ad_campaign , 
    COUNT(*) total_impressions , 
    SUM(clicked) clicked_count
FROM ad_impressions ad_impr
GROUP BY ad_campaign 
)

SELECT ad_campaign ,
    total_impressions , 
    ROUND((clicked_count::FLOAT * 100)/ total_impressions::FLOAT
    , 2 ) clicked_pct ,
    100 - ROUND((clicked_count::FLOAT * 100)/ total_impressions::FLOAT
    , 2 ) not_clicked_pct
FROM ad_total_clicked atc
