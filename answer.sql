SELECT
    T.investor_id,
    S.sector_name,
    ROUND(
        (CAST(SUM(T.no_of_shares) AS REAL) * 100.0) /
        SUM(SUM(T.no_of_shares)) OVER (PARTITION BY T.investor_id),
        2
    ) AS percentage
FROM
    investor_transactions T
JOIN
    sectors S ON T.sector_id = S.sector_id
GROUP BY
    T.investor_id,
    S.sector_name
ORDER BY
    T.investor_id,
    percentage DESC;
