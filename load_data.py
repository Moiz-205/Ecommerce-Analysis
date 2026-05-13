import os
import pandas as pd
from db import engine

files = []
for f in os.listdir("data/"):
    if f.endswith(".csv"):
        files.append(f)

for f in files:
    df = pd.read_csv(f"data/{f}", encoding='latin-1')
    table_name = f.replace(".csv", "")
    df.to_sql(table_name, engine, if_exists='replace', index=False)
    print(f"Loaded {table_name}")
