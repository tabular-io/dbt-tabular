
{{ config(
  persist_docs={"relation": true, "columns": true},
  file_format="iceberg",
  materialized='incremental',
  incremental_strategy='merge',
  unique_key='location_id'
) }}

SELECT *
FROM examples.nyc_taxi_locations
