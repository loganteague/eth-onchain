WITH daily AS (
    SELECT DATE(block_timestamp) as day, SUM(CAST(base_fee_per_gas AS FLOAT64) * gas_used) / 1e18 AS eth_burned
FROM `bigquery-public-data.goog_blockchain_ethereum_mainnet_us.blocks`
WHERE block_timestamp >=TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 90 DAY)
    AND block_timestamp < TIMESTAMP(CURRENT_DATE())
GROUP BY day
),
med as (SELECT APPROX_QUANTILES(eth_burned, 2)[OFFSET(1)] as median FROM daily),
mad as (SELECT APPROX_QUANTILES(ABS(eth_burned - median), 2)[offset(1)] as mad_value FROM daily, med)
SELECT day, eth_burned,
    CASE 
        WHEN eth_burned < median - mad_value THEN 'quiet'
        WHEN eth_burned > median + mad_value THEN 'busy'
        ELSE 'normal'
    END AS day_type
FROM daily, med, mad
ORDER BY day