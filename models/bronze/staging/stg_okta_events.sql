{{ config(
    materialized='view',
    schema='BRONZE'
) }}

SELECT
    EVENT_DATA
FROM {{ source('raw', 'OKTA_EVENTS') }}