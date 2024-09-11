SELECT date_date
, COUNT(orders_id) AS nb_transactions
, ROUND(SUM(revenue),2) AS revenue
, ROUND(AVG(purchase_cost),2) AS average_basket
, ROUND(SUM(margin),2) AS margin
, ROUND(SUM(operational_margin),2) AS operational_margin
, ROUND(SUM(purchase_cost),2) AS total_purchase_cost
, ROUND(SUM(shipping_fee),2) AS total_shipping_fee
, ROUND(SUM(log_cost),2) AS total_log_costs
, ROUND(SUM(quantity),2) AS total_quantity_of_products_sold
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date