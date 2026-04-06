-- Quantidade de clientes ativos nos ultimos 6 meses
SELECT
    mes,
    COUNT(DISTINCT customer_unique_id) AS clientes_ativos
FROM (
    SELECT
        DATE_TRUNC('month', ood.order_purchase_timestamp) AS mes,
        ocd.customer_unique_id
    FROM olist_orders_dataset AS ood
    INNER JOIN olist_customers_dataset AS ocd
    ON ocd.customer_id = ood.customer_id
) AS pedidos_por_cliente
WHERE mes >= CURRENT_DATE - INTERVAL '6 MONTH'
GROUP BY mes
ORDER BY mes DESC;

-- Quantidade de pedidos entregues e cancelados
SELECT COUNT(order_id) AS pedidos_entregues
FROM olist_orders_dataset
WHERE order_status = 'delivered';

SELECT COUNT(order_id) AS pedidos_cancelados
FROM olist_orders_dataset
WHERE order_status = 'canceled';

-- Top 10 clientes com mais pedidos
SELECT 
	ocd.customer_unique_id,
	COUNT(ood.order_id) AS total_pedidos
FROM olist_orders_dataset AS ood
INNER JOIN olist_customers_dataset AS ocd
ON ood.customer_id = ocd.customer_id
GROUP BY ocd.customer_unique_id
ORDER BY total_pedidos DESC
LIMIT 10;

-- Top categorias de produtos mais vendidas
SELECT
	opd.product_category_name,
	SUM(ooid.price) AS total_vendas
FROM olist_orders_dataset AS ood
INNER JOIN olist_order_items_dataset AS ooid
ON ooid.order_id = ood.order_id
INNER JOIN olist_products_dataset AS opd
ON ooid.product_id = opd.product_id
WHERE ood.order_status = 'delivered'
GROUP BY opd.product_category_name
ORDER BY total_vendas DESC;

-- Top categorias de produtos mais vendidas por quantidade
SELECT
	opd.product_category_name,
	COUNT(ooid.order_item_id) AS total_itens
FROM olist_orders_dataset AS ood
INNER JOIN olist_order_items_dataset AS ooid
ON ooid.order_id = ood.order_id
INNER JOIN olist_products_dataset AS opd
ON ooid.product_id = opd.product_id
WHERE ood.order_status = 'delivered'
GROUP BY opd.product_category_name
ORDER BY total_itens DESC;
