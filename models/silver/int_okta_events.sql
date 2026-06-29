{{ config(
    materialized='view',
    schema='SILVER'
) }}

WITH bronze AS (

    SELECT
        EVENT_DATA
    FROM {{ ref('stg_okta_events') }}

)

SELECT
    EVENT_DATA:EVENT_ID::STRING    AS EVENT_ID,
    EVENT_DATA:USER_ID::NUMBER     AS USER_ID,
    EVENT_DATA:EVENT_TYPE::STRING  AS EVENT_TYPE,
    EVENT_DATA:RISK_SCORE::NUMBER  AS RISK_SCORE
FROM bronze