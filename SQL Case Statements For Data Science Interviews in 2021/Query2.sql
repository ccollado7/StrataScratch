-- https://www.youtube.com/watch?v=W_IERUwElkg&t=1s

--Query
SELECT tmp.business_type,
	   tmp.inspection_type,
	   avg(inspection_score) AS avg_inspection_score
FROM
	(SELECT DISTINCT inspection_type,
			inspection_score,
			CASE
				WHEN business_name ILIKE '%restauran%' THEN 'Restaurant'
				WHEN business_name ILIKE '%cafe%' THEN 'Cafe'
				WHEN business_name ILIKE '%taqueria%' THEN 'Taqueria'
				WHEN business_name ILIKE '%kitchen%' THEN 'Kitchen'
				WHEN business_name ILIKE '%garden%' THEN 'Garden'
				WHEN business_name ILIKE '%School%' THEN 'School'
				ELSE 'Other'
			END AS business_type
	 FROM sf_restaurant_health_violations) tmp
GROUP BY tmp.business_type,
		 tmp.inspection_type