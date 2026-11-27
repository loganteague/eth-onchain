SELECT COUNT(block_number) as blocks, SUM(gas_used) / SUM(gas_limit) * 100 as pct_full, AVG(base_fee_per_gas) / 1e9 as avg_base_fee_gwei, EXTRACT(HOUR FROM block_timestamp) AS hour
FROM `bigquery-public-data.goog_blockchain_ethereum_mainnet_us.blocks`
WHERE DATE(block_timestamp) = '2026-10-29'
GROUP BY hour
ORDER BY hour