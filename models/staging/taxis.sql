
{{ config(
  persist_docs={"relation": true, "columns": true},
  file_format="iceberg"
) }}

SELECT *
FROM examples.nyc_taxi_yellow
-- To speed up the query, let's take a slice of the data
-- Iceberg will only read the relevant data
WHERE pickup_time BETWEEN '2021-01-01' AND '2021-01-02'