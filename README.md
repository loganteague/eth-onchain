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
- **Weekday burn peaks in US morning hours.** Across 90 full days, weekday burn runs about 1 ETH/hour overnight (4-8 UTC, midnight-4am ET), climbs from 12 UTC and jumps at 14, and peaks at 9.8 ETH/hour at 15 UTC (11am ET), then eases to ~3.5 by 18-19 UTC (2-3pm ET). Weekends stay much lower, peaking at ~4 ETH/hour in the same hour. This fits the idea that business activity drives weekday demand, but doesn't prove it. 
- **Open question: the 5pm spike.** Weekday burn at 21 UTC (5pm ET) averages 16.6 ETH/hour, about 3x the hours on either side and the biggest hour of the day. Next step: check whether that hour is high on most weekdays (a daily pattern, like end-of-day settlement) or whether one day, such as the Oct 29 spike, carries the average. 