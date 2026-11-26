import csv
from pathlib import Path

def load_csv(path):
    with open(path, encoding='utf-8-sig', newline='') as f:
        rows = list(csv.DictReader(f))
    return rows

def to_number(text):
    try:
        return float(text)
    except (TypeError, ValueError):
        return None

def column(rows, name):
    out = {}
    for row in rows:
        v = to_number(row[name])
        if v is not None:
            out[row['day'][:10]] = v
    return out

def summary(values):
    if not values:
        return None
    return {'min': min(values), 'max': max(values), 'avg': sum(values) / len(values)}

if __name__ == '__main__':
    here = Path(__file__).parent.parent
    rows = load_csv(here / 'results' / 'daily_burn.csv')
    burn = column(rows, 'eth_burned')
    stats = summary(burn.values())
    print(stats)