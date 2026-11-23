# eth-onchain

Tracking Ethereum's supply health with onchain data: how much ETH gets burned, how that compares with new issuance, and what changed after Layer 2 scaling.

## Question

(Day 14: write the question you set out to answer.)

## Data

(Day 14: which BigQuery tables, what time range, what you excluded and why.)

## Findings

(Day 14: what the data showed, with numbers.)

## How it works

- `sql/`: the BigQuery queries (run in the BigQuery console)
- `results/`: query results saved as CSV
- `src/`: Python that reads the results and runs the checks
- `tests/`: tests for the checks
- `reports/latest.md`: the latest numbers
