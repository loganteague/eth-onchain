SELECT DATE_TRUNC(DATE(block_timestamp), WEEK(MONDAY)) as week, SUM(CAST(base_fee_per_gas AS FLOAT64)  gas_used)  1e18 AS eth_burned, COUNT(block_number) as blocks
FROM `bigquery-public-data.goog_blockchain_ethereum_mainnet_us.blocks`
WHERE block_timestamp =TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 90 DAY)
GROUP BY week
ORDER BY week