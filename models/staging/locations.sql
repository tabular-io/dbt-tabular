
{{ config(
  file_format="iceberg"
) }}

SELECT *
FROM examples.nyc_taxi_locations