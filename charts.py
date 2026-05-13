import plotly.express as px
import plotly.graph_objects as go

def chart_revenue_trend(df):
    df["Order_Year"] = df["Order_Year"].astype(str)
    return px.line(df,
        x="Order_Month",
        y="Total_Revenue",
        color="Order_Year",
        title="Revenue Trend",)

def chart_top_products(df):
    return px.bar(df,
        x="Product_Category",
        y="Total_Revenue",
        title="Top Product Categories")

def chart_payment_types(df):
    return px.pie(df,
        values="Total_Payment_Value",
        names="Payment_Type",
        title="Payment Types")

def chart_payment_installments(df):
    return px.bar(df,
        x="Payment_Type",
        y="Average_Installments",
        title="Average Payment Installments")

def chart_seller_state_revenue(df):
    return px.bar(df,
        x="Seller_State",
        y="Total_Revenue",
        title="Sellers State by Revenue")

def chart_customer_state_distribution(df):
    return px.bar(df,
        x="Customer_States",
        y="Total_Customers",
        title="Customers Distribution by States")

def chart_order_status(df):
    return px.pie(df,
        values="Number_of_Orders",
        names="Order_Status",
        title="Order Status")

def chart_delivery_performance(df):
    df["Order_Year"] = df["Order_Year"].astype(str)
    fig = go.Figure()
    fig.add_trace(go.Bar(x=df["Order_Month"], y=df["Avg_Delivery_Days"], name="Actual"))
    fig.add_trace(go.Bar(x=df["Order_Month"], y=df["Avg_Delay_Days"], name="Delay"))
    fig.update_layout(barmode='group', title="Delivery Performance")
    return fig
