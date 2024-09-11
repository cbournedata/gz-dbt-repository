
SELECT ord_marg.orders_id, ord_marg.date_date, ROUND(SUM(
      CAST(ord_marg.margin AS FLOAT64) + 
      CAST(ship.shipping_fee AS FLOAT64) - 
      CAST(ship.logCost AS FLOAT64) - 
      CAST(ship.ship_cost AS FLOAT64)
    ),2) AS operational_margin,
    ROUND(SUM(ship.shipping_fee),2) AS shipping_fee,
    ROUND(SUM(ship.logCost),2) AS log_cost,
    ROUND(SUM(revenue),2) AS revenue, SUM(quantity) AS quantity, ROUND(SUM(purchase_cost),2) AS purchase_cost, ROUND(SUM(margin),2) AS margin
FROM {{ ref('int_orders_margin') }} AS ord_marg
LEFT JOIN {{ ref('stg_raw__ship')}} AS ship
ON ord_marg.orders_id = ship.orders_id
GROUP BY orders_id, date_date
ORDER BY orders_id DESC

