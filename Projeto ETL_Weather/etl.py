import pandas as pd
import psycopg2
from sqlalchemy import create_engine
from config import DB_URL

weather = pd.read_csv("hourly-weather-southeast.csv")
weather["datetime"] = pd.to_datetime(weather["datetime"])
weather.fillna(method='ffill', inplace=True)
weather["date"] = weather["datetime"].dt.date

weather_daily = weather.groupby(["station", "date"]).agg({
    "temperature": "mean",
    "humidity": "mean",
    "pressure": "mean",
    "wind_speed": "mean"
}).reset_index()

engine = create_engine(DB_URL)
weather.to_sql("weather_hourly", engine, if_exists="replace", index=False)
weather_daily.to_sql("weather_daily", engine, if_exists="replace", index=False)
print("Carga completa!")