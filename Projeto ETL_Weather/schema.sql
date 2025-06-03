CREATE TABLE IF NOT EXISTS weather_hourly (
    station TEXT,
    datetime TEXT,
    temperature FLOAT,
    humidity FLOAT,
    pressure FLOAT,
    wind_speed FLOAT
);

CREATE TABLE IF NOT EXISTS weather_daily (
    station TEXT,
    date TEXT,
    temperature FLOAT,
    humidity FLOAT,
    pressure FLOAT,
    wind_speed FLOAT
);