SELECT DATE(block_timestamp) as day, SUM(CAST(base_fee_per_gas AS FLOAT64) * gas_used) / 1e18 AS eth_burned
FROM `bigquery-public-data.goog_blockchain_ethereum_mainnet_us.blocks`
WHERE block_timestamp >=TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 90 DAY)
GROUP BY day