
{{ config(
  persist_docs={"relation": true, "columns": true},
  file_format="iceberg"
) }}

SELECT *
FROM examples.nyc_taxi_locations