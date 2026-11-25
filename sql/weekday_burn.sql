SELECT FORMAT_DATE('%A', DATE(block_timestamp)) AS weekday, SUM(CAST(base_fee_per_gas AS FLOAT64) * gas_used) / 1e18 AS eth_burned, COUNT(DISTINCT DATE(block_timestamp)) as days, SUM(CAST(base_fee_per_gas AS FLOAT64) * gas_used) / 1e18 / COUNT(DISTINCT DATE(block_timestamp)) as burn_per_day, EXTRACT(DAYOFWEEK FROM block_timestamp) AS dow
FROM `bigquery-public-data.goog_blockchain_ethereum_mainnet_us.blocks`
WHERE block_timestamp >= TIMESTAMP(DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY))
  AND block_timestamp <  TIMESTAMP(CURRENT_DATE())
GROUP BY weekday, dow
ORDER BY dow