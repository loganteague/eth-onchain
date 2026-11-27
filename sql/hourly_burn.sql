SELECT SUM(CAST(base_fee_per_gas AS FLOAT64) * gas_used) / 1e18 / COUNT(DISTINCT DATE(block_timestamp)) as burn_per_day, EXTRACT(HOUR FROM block_timestamp) AS hour, CASE WHEN EXTRACT(DAYOFWEEK FROM block_timestamp) IN (1,7) THEN 'weekend' ELSE 'weekday' END AS day_kind 
FROM `bigquery-public-data.goog_blockchain_ethereum_mainnet_us.blocks`
WHERE block_timestamp >= TIMESTAMP(DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY))
  AND block_timestamp <  TIMESTAMP(CURRENT_DATE())
GROUP BY hour, day_kind
ORDER BY day_kind, hour
