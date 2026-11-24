import pandas as pd

df=pd.read_csv("quick_commerce_orders.csv")

print(df)
dfempy=df[df["order_amount_inr"]>0]["order_amount_inr"].median()

df["order_amount_inr"]=df["order_amount_inr"].fillna(dfempy)

df["SLA_Status"]=df["delivery_mins"].apply(lambda x:"Delayed" if x > 30 else "on Time")

df["net_revenue"]=df.apply(lambda row:0 if row["status"]=="Returned" else row["order_amount_inr"] + row["delivery_fee_inr"],axis=1,)

print(df)
print(df[["order_id","status","SLA_Status","net_revenue"]])
df.to_csv("cleaned_quick_commerce.csv",index=False)
print("Done! File saved.")