
{{ config(
  persist_docs={"relation": true, "columns": true},
  file_format="iceberg"
) }}

SELECT
    CASE
        WHEN vendor_id = 1 THEN 'Creative Mobile Technologies'
        WHEN vendor_id = 2 THEN 'VeriFone Inc'
        ELSE 'Other'
    END                             AS vendor,
    pickup_time,
    pickup.zone_name                AS pickup_zone_name,
    pickup.borough                  AS pickup_borough,
    dropoff_time,
    dropoff.zone_name               AS dropoff_zone_name,
    dropoff.borough                 AS dropoff_borough,
    passenger_count,
    trip_distance,
    CASE
        WHEN ratecode_id = 1 THEN 'Standard rate'
        WHEN ratecode_id = 2 THEN 'JFK'
        WHEN ratecode_id = 3 THEN 'Newark'
        WHEN ratecode_id = 4 THEN 'Nassau or Westchester'
        WHEN ratecode_id = 5 THEN 'Negotiated fare'
        WHEN ratecode_id = 5 THEN 'Group ride'
        ELSE 'Unknown'
    END                             AS ratecode,
    CASE
        WHEN payment_type = 1 THEN 'Credit card'
        WHEN payment_type = 2 THEN 'Cash'
        WHEN payment_type = 3 THEN 'No charge'
        WHEN payment_type = 4 THEN 'Disputed'
        WHEN payment_type = 5 THEN 'Unknown'
        WHEN payment_type = 5 THEN 'Voided trip'
        ELSE 'Unknown'
    END                             AS payment,
    total_amount,
    fare_amount,
    tip_amount,
    tolls_amount,
    mta_tax,
    improvement_surcharge,
    congestion_surcharge,
    extra_surcharges,
    lower(store_and_forward_flag) == 'yes' AS stored_in_vehicle
FROM {{ ref('taxis') }}
JOIN {{ ref('locations') }} pickup ON pickup_location_id = pickup.location_id
JOIN {{ ref('locations') }} dropoff ON dropoff_location_id = dropoff.location_id
