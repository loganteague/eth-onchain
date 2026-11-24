SELECT DATE(block_timestamp) as day, COUNT(block_number) as blocks, SUM(gas_used) / SUM(gas_limit) * 100 as pct_full, AVG(base_fee_per_gas) / 1e9 as avg_base_fee_gwei
FROM `bigquery-public-data.goog_blockchain_ethereum_mainnet_us.blocks`
WHERE block_timestamp >=TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 90 DAY)
GROUP BY day
ORDER BY day