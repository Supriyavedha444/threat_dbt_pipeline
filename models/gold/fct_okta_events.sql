{{ config(
    materialized='table',
    schema='GOLD'
) }}

SELECT
    EVENT_ID,
    USER_ID,
    EVENT_TYPE,
    RISK_SCORE,

    CASE
        WHEN RISK_SCORE >= 80 THEN 'CRITICAL'
        WHEN RISK_SCORE >= 50 THEN 'HIGH'
        WHEN RISK_SCORE >= 20 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS RISK_LEVEL

FROM {{ ref('int_okta_events') }}