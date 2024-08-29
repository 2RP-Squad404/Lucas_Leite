%hive
-- Criação da tabela campaign_purchase com os resultados da consulta
CREATE TABLE campaign_purchase AS

-- Conta quantas compras cada cliente fez em cada local de compra
WITH LocationCounts AS (
  SELECT
    client_id,
    purchase_location,
    COUNT(*) AS location_count    -- Contagem de compras realizadas no local por cliente
  FROM
    purchase
  GROUP BY
    client_id,
    purchase_location
),

-- Calcula o preço TOTAL das compras, a data da PRIMEIRA compra e a ÚLTIMA compra por cliente
TotalPricesAndDates AS (
    SELECT 
        client_id,
        CONCAT('US$ ', ROUND(SUM(price * amount * (1 - discount_applied)), 2)) AS total_price,  -- Soma total das compras com desconto, formatada como valor monetário
        MIN(date_format(purchase_datetime, 'yyyy-MM-dd HH:mm:ss')) AS first_purchase,
        MAX(date_format(purchase_datetime, 'yyyy-MM-dd HH:mm:ss')) AS last_purchase
    FROM 
        purchase
    GROUP BY 
        client_id
),

-- Agrupa o local mais comprado por cliente
RankedLocations AS (
  SELECT
    client_id,
    purchase_location,
    location_count,
    ROW_NUMBER() OVER (           -- Numera as linhas, ordenando os locais de compra por contagem decrescente
      PARTITION BY client_id
      ORDER BY location_count DESC
    ) AS rank
  FROM
    LocationCounts
),

-- Calcula a quantidade de campanhas recebidas (sem erro) e quantidade de erros por cliente
ReceivedAndError AS (
    SELECT
        client_id,
        SUM(CASE WHEN return_status != 'error' THEN 1 ELSE 0 END) AS most_campaign,
        SUM(CASE WHEN return_status = 'error' THEN 1 ELSE 0 END) AS quantity_error,
        CAST(CURRENT_DATE() AS STRING) AS date_today,
        CAST(CONCAT(LPAD(CAST(MONTH(CURRENT_DATE()) AS STRING), 2, '0'), CAST(YEAR(CURRENT_DATE()) AS STRING)) AS INT) AS anomes_today
    FROM
        campanhas
    GROUP BY
        client_id
)

-- Consulta que seleciona os dados combinados das subconsultas anteriores
SELECT
    tp.client_id as client_id,
    tp.total_price AS total_price,
    rl.purchase_location AS most_purchase_location,
    tp.first_purchase AS first_purchase,
    tp.last_purchase AS last_purchase,
    re.most_campaign AS most_campaign,
    re.quantity_error AS quantity_error,
    re.date_today AS date_today,             
    re.anomes_today AS anomes_today
FROM
    TotalPricesAndDates tp
JOIN 
    RankedLocations rl
ON 
    tp.client_id = rl.client_id
JOIN 
    ReceivedAndError re
ON
    re.client_id = tp.client_id
WHERE
  rank = 1