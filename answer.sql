SELECT
    T.investor_id,
    S.sector_name,
    
    ROUND(
        (CAST(T.no_of_shares AS REAL) * 100.0) / 
        SUM(T.no_of_shares) OVER (PARTITION BY T.investor_id),
        2
    ) AS share_percentage
FROM
    investor_transactions T
JOIN
    sectors S ON T.sector_id = S.sector_id
ORDER BY
    T.investor_id,
    share_percentage DESC;


python main.py 
