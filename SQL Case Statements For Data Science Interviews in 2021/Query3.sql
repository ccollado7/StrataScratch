-- https://www.youtube.com/watch?v=W_IERUwElkg&t=1s

--Query
SELECT (
	count(CASE 
			WHEN position <=3 AND has_clicked='yes' THEN b.search_id
			ELSE NULL
			END)/
	count(*) ) AS percentage
FROM fb_search_result a LEFT JOIN fb_results_event b ON a.result_id=b.search_id