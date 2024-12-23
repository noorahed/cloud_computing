-- This query shows a list of the daily top Google Search terms.
SELECT
 refresh_date AS Week,
 term AS Top_Term,
 rank 
FROM `bigquery-public-data.google_trends.top_terms`
WHERE
 rank = 3 
 -- Choose only the top term each day.
 AND refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 month  )
 -- Filter to the last one month.
GROUP BY Week, Top_Term, rank
ORDER BY Week DESC
 -- Show the days in reverse chronological order.