import streamlit as st
from utils import load_kpis, load_view
from charts import (
    chart_revenue_trend, chart_top_products,
    chart_payment_types, chart_payment_installments,
    chart_seller_state_revenue, chart_customer_state_distribution,
    chart_order_status, chart_delivery_performance
)

st.set_page_config(page_title="Ecommerce Sales Analysis Dashboard", layout="wide")
st.title("Ecommerce Sales Analysis Dashboard", text_alignment="center")

kpis = load_kpis()
col1, col2, col3, col4 = st.columns(4)
col1.metric("Total Orders", kpis["Total Orders"])
col2.metric("Total Revenue", kpis["Total Revenue"])
col3.metric("Average Freight Value", kpis["Average Freight Value"])
col4.metric("Average Delivery Days", kpis["Average Delivery Days"])

st.markdown("""
    <style>
    .stTabs [data-baseweb="tab-list"] {
        justify-content: center;
    }
    </style>
""", unsafe_allow_html=True)

tab1, tab2, tab3, tab4 = st.tabs(["Sales Analysis", "Payment Analysis" ,"Regional Analysis", "Operations Analysis"])

with tab1:
    df = load_view(view_label="Revenue_Trend_View")
    st.plotly_chart(chart_revenue_trend(df))

    df = load_view("Top_Product_Categories_View")
    st.plotly_chart(chart_top_products(df))

with tab2:
    col1, col2 = st.columns(2)
    with col1:
        df = load_view("Average_Payment_Installment_View")
        st.plotly_chart(chart_payment_installments(df))

    with col2:
        df = load_view("Payment_Type_Breakdown_View")
        st.plotly_chart(chart_payment_types(df))

with tab3:
    df = load_view("Top_Seller_States_View")
    st.plotly_chart(chart_seller_state_revenue(df))

    df = load_view("Customer_State_Distribution_View")
    st.plotly_chart(chart_customer_state_distribution(df))

with tab4:
    col1, col2 = st.columns(2)
    with col1:
        df = load_view("Delivery_Performance_View")
        st.plotly_chart(chart_delivery_performance(df))

    with col2:
        df = load_view("Order_Status_Breakdown_View")
        st.plotly_chart(chart_order_status(df))
