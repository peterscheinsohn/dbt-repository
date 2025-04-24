WITH nj_001 AS (
    SELECT 
        movie_id, 
        DATE_TRUNC('month', timestamp) AS month,
        'nj_001' AS location,
        SUM(ticket_amount) AS tickets_sold,
        SUM(transaction_total) AS revenue
    FROM 
        {{ source('nj_001',  'nj_001')  }}  
    GROUP BY 2,1
),

nj_002 AS (
    SELECT 
        movie_id, 
        DATE_TRUNC('month', date) AS month,
        'nj_002' AS location,
        SUM(ticket_amount) AS tickets_sold,
        SUM(total_earned) AS revenue
    FROM 
        {{ source('nj_002',  'nj_002')  }} 
    GROUP BY 2,1
),

nj_003 AS (
    SELECT
        details AS movie_id,
        DATE_TRUNC('month', timestamp) AS month,
        'nj_003' AS location,
        SUM(amount) AS tickets_sold,
        SUM(total_value) AS revenue
    FROM 
        {{ source('nj_003',  'nj_003')  }}  
    WHERE product_type = 'ticket'
    GROUP BY 2,1
)

SELECT * FROM nj_001
UNION ALL
SELECT * FROM nj_002
UNION ALL
SELECT * FROM nj_003