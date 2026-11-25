# Ethereum On-Chain tracking project

A project to practice SQL and understand what is happening on Ethereum using on-chain data. 

The data comes from Google's public Ethereum dataset in BigQuery.

## What I track 

- How much ETH is burned per day
- How full blocks are
- Gas fees over time

I'm looking for trends over time to see how the chain is growing. 

Eventually this will paint a picture of how Ethereum is growing, where it's growing, and what the tokenomics look like. 

## Findings

- **Oct 29, 2026: 1,618 ETH burned**, the highest day in the last 90 days. The next highest was 260. It was the day of the Binance hack. The average base fee was 7.52 gwei, up from 0.12 gwei the day before, while blocks stayed about 50% full.
- **Weekends burn less than half as much ETH as weekdays.** Saturday and Sunday average ~29 ETH/day, vs ~68 ETH/day Monday-Friday (~92 if you include the Oct spike, which falls on a Thursday and spikes that days average to ~208)
- **Hypothesis:** is weekday demand coming from business-hours activity such as trading desks and institutions? Next step: break burn down by hour of day.  