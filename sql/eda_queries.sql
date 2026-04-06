-- Top 10 clientes por número de pedidos
SELECT
    ocd.customer_unique_id,
    COUNT(DISTINCT ood.order_id) AS pedidos_cliente
FROM olist_orders_dataset AS ood
INNER JOIN olist_customers_dataset AS ocd
ON ocd.customer_id = ood.customer_id
GROUP BY ocd.customer_unique_id
ORDER BY pedidos_cliente DESC;

-- Pedidos por status
SELECT
    ood.order_status,
    COUNT(ood.order_id) AS total_pedidos
FROM olist_orders_dataset AS ood
GROUP BY ood.order_status
ORDER BY total_pedidos DESC;

-- Pedidos por mês
SELECT
    DATE_TRUNC('month', ood.order_purchase_timestamp) AS mes,
    COUNT(ood.order_id) AS total_pedidos
FROM olist_orders_dataset AS ood
GROUP BY mes
ORDER BY mes;

-- Média móvel diária (7 dias)
SELECT 
    dia,
    total_pedidos,
    AVG(total_pedidos) OVER (ORDER BY dia ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS media_movel
FROM (
    SELECT
        DATE(ood.order_purchase_timestamp) AS dia,
        COUNT(ood.order_id) AS total_pedidos
    FROM olist_orders_dataset AS ood
    GROUP BY dia
    ORDER BY dia
) AS pedidos_diarios
ORDER BY dia;