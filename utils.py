import pandas as pd
from db import engine

def load_kpis() -> dict[str, float]:
    df = pd.read_sql_query("SELECT \
        COUNT(orders.order_id) AS Total_Orders, \
        ROUND(SUM(total_item_value), 2) AS Total_Revenue, \
        ROUND(AVG(freight_value), 2) AS Average_Freight_Value, \
        ROUND(AVG(delivery_days), 2) AS Average_Delivery_Days \
        FROM orders \
        JOIN order_items ON \
        orders.order_id = order_items.order_id", engine)

    kpi = {
        "Total Orders": df["Total_Orders"].iloc[0],
        "Total Revenue": df["Total_Revenue"].iloc[0],
        "Average Freight Value": df["Average_Freight_Value"].iloc[0],
        "Average Delivery Days": df["Average_Delivery_Days"].iloc[0]
    }
    return kpi

def load_view(view_label: str) -> pd.DataFrame:
    df = pd.read_sql_query(f"SELECT * FROM {view_label}", engine)
    return df
